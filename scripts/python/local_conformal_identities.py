"""Exact free-expression checks for CONVENTIONS (ae).

Only the tag 'm' is normalized as associative multiplication. Other tags
are independent multilinear operations. Coefficients are exact rationals.
The optional mutations intentionally violate the stated conventions.
"""
from fractions import Fraction
from itertools import product
import os

MUTATION = os.environ.get("CFT_IDENTITY_MUTATION", "")
if MUTATION not in ("", "hoch_sign", "ward_sign", "circle_sign", "taylor_factor", "mixed_sign"):
    raise ValueError(f"unknown mutation: {MUTATION}")


def atom(name):
    return {("atom", name): Fraction(1)}


def add(*expressions):
    result = {}
    for expression in expressions:
        for term, coefficient in expression.items():
            result[term] = result.get(term, Fraction(0)) + coefficient
            if not result[term]:
                del result[term]
    return result


def scale(coefficient, expression):
    return {term: coefficient * value for term, value in expression.items()
            if coefficient * value}


def op(tag, *expressions):
    result = {}
    for terms in product(*(expression.items() for expression in expressions)):
        children, coefficient = [], Fraction(1)
        for tree, value in terms:
            coefficient *= value
            if tag == "m" and tree[0] == "m":
                children.extend(tree[1:])
            else:
                children.append(tree)
        term = (tag, *children)
        result = add(result, {term: coefficient})
    return result


def hoch(cochain, arguments):
    """Hochschild differential, with n=len(arguments)-1."""
    n = len(arguments) - 1
    assert n >= 1
    terms = [op("m", arguments[0], cochain(*arguments[1:]))]
    for i in range(n):
        merged = (*arguments[:i], op("m", arguments[i], arguments[i+1]),
                  *arguments[i+2:])
        terms.append(scale((-1)**(i+1), cochain(*merged)))
    final_sign = (-1)**(n+1)
    if MUTATION == "hoch_sign":
        final_sign *= -1
    terms.append(scale(final_sign, op("m", cochain(*arguments[:-1]), arguments[-1])))
    return add(*terms)


def associator(operation, a, b, c):
    return add(operation(operation(a, b), c), scale(-1, operation(a, operation(b, c))))


def deformation_coefficients(a, b, c):
    """Expand the associator of m+t*p+t^2*q directly to order two."""
    tags = ("m", "p", "q")

    def multiply(left, right):
        output = [{} for _ in range(3)]
        for order, tag in enumerate(tags):
            for i, x in enumerate(left):
                for j, y in enumerate(right):
                    if order+i+j < 3:
                        k = order+i+j
                        output[k] = add(output[k], op(tag, x, y))
        return output

    aa, bb, cc = [a, {}, {}], [b, {}, {}], [c, {}, {}]
    left = multiply(multiply(aa, bb), cc)
    right = multiply(aa, multiply(bb, cc))
    return [add(x, scale(-1, y)) for x, y in zip(left, right)]


def ward_derivative(z, incoming, outgoing):
    sign = 1 if MUTATION == "ward_sign" else -1
    return add(scale(sign, op("m", outgoing, z)), op("m", z, incoming))


def circle_nonscalar_defect(m, n):
    # [iL_m,iL_n] has L_(m+n) coefficient -(m-n).
    commutator_coefficient = -(m-n)
    # A([e_m,e_n]_*) has the same coefficient for f'g-fg'.
    bracket_coefficient = (m-n) if MUTATION == "circle_sign" else -(m-n)
    return commutator_coefficient-bracket_coefficient


def ward_taylor_next(alpha_i, plus_convolution, minus_convolution):
    assert isinstance(alpha_i, int) and alpha_i >= 0
    denominator = 1 if MUTATION == "taylor_factor" else alpha_i+1
    return scale(Fraction(-1, denominator),
                 add(plus_convolution, scale(-1, minus_convolution)))


def derive(expression):
    """Universal derivation of associative products; other operations are opaque."""
    output = {}
    for tree, coefficient in expression.items():
        if tree[0] != "m":
            value = op("D", {tree: Fraction(1)})
        else:
            factors = [{child: Fraction(1)} for child in tree[1:]]
            value = add(*(op("m", *factors[:i], derive(factor), *factors[i+1:])
                          for i, factor in enumerate(factors)))
        output = add(output, scale(coefficient, value))
    return output


def lie_on(cochain, arguments):
    sign = 1 if MUTATION == "mixed_sign" else -1
    return add(derive(cochain(*arguments)),
               *(scale(sign, cochain(*arguments[:i], derive(a), *arguments[i+1:]))
                 for i, a in enumerate(arguments)))
