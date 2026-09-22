# The observable algebra is fixed by each factor's parity, not total parity.
# Source: Bockenhauer1994/source.tex:324-356,563-588; CONVENTIONS (z).
function observable_word(recipe::IsingRecipe,factor_indices::AbstractVector{Int})
    k=length(recipe.input_labels)
    all(f -> 1<=f<=k,factor_indices) || throw(ArgumentError("invalid factor in CAR word"))
    all(f -> iseven(count(==(f),factor_indices)),1:k)
end
function local_observable_recipe(recipe::IsingRecipe,M::Int)
    (; algebra=:factorwise_even_self_dual_CAR,
       parity_group=fill(:Z2,length(recipe.input_labels)),
       unit=:identity,
       spatial_generators=[(;factor=f,sites=(x,y),coefficient=im,
                              word=:Psi_x_Psi_y)
            for f in eachindex(recipe.input_labels) for x in 1:M for y in x+1:M],
       local_reconstruction=:norm_limits_of_sampled_interval_even_polynomials,
       representation=:NS_vacuum_cyclic_even_space,
       global_scope=:represented_interval_net_not_universal_observable_algebra)
end
# Continuum basis exp(irx)/sqrt(2pi), h=L2(dx); finite basis orthonormal.
# f must be a real continuous section supported compactly inside this chart.
# Smooth inputs suffice for the local-net reconstruction proof in LOCAL_LIMIT.md.
function sample_local_field(M::Int,f::Function,interval::Tuple{Real,Real})
    a,b=interval
    0<a<b<2pi || throw(ArgumentError("first sampling chart must avoid the AP seam"))
    rs=FermionBenchmark.momenta(M); epsilon=2pi/M
    positions=epsilon.*collect(0:M-1)
    values=ComplexF64[f(x) for x in positions]
    all(isreal,values) || throw(ArgumentError("real Majorana test section required"))
    all(i -> a<positions[i]<b || iszero(values[i]),eachindex(positions)) ||
        throw(ArgumentError("sampled field is not supported in the declared interval"))
    spatial=sqrt(epsilon).*values
    U=ComplexF64[exp(im*x*r)/sqrt(M) for x in positions,r in rs]
    (;interval,positions,spatial,momentum=U'*spatial,
       mode_labels=rs,continuum_basis=:exp_irx_over_sqrt_2pi,
       embedding=:preserve_half_integer_momentum_labels)
end
