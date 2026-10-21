"""Reproduce exact four-port sewing probes and rejected regressions.

Command: python3 scripts/python/run_four_port_consistency.py
No network, push, large-matrix lattice computation or CFT existence claim.
"""
from pathlib import Path
import hashlib,json,os,re,subprocess,sys
import sympy as s
from four_port_sewing import block_coefficients
from four_port_semion import (
    Z,blocks,connection,channel_metric,tensor_data,reflected_kernel,
    global_null_residuals,global_ward_residuals,braid_checks,multiplicity_kernels,
)

assert not os.environ.get("CFT_FOUR_MUTATION"), "producer requires restored code"
assert not os.environ.get("CFT_SMALL_MUTATION"), "dependency mutation must be unset"
root=Path(__file__).resolve().parents[2]
output=root/"runs/2026-10-21-four-port-consistency"
output.mkdir(parents=True,exist_ok=True)
test=root/"scripts/python/test_four_port_consistency.py"
expected={
    "dual_conjugation":"test_complex_categorical_dual_conversion",
    "null_drop":"test_positive_quotient_and_null_rejection",
    "metric_sign":"test_metric_linearization_sign",
    "reflection_sign":"test_pair_reflection_is_positive_with_declared_orientation",
    "block_weight":"test_semion_quotient_gram_coefficients",
}
records=[]
for mutation in ("",*expected,""):
    tag=mutation or ("green_restored" if records else "green_initial")
    env=os.environ.copy();env["CFT_FOUR_MUTATION"]=mutation
    result=subprocess.run([sys.executable,str(test)],cwd=root,env=env,
                          text=True,capture_output=True,timeout=60)
    transcript=result.stdout+result.stderr
    (output/f"{tag}.txt").write_text(transcript)
    count=re.search(r"Ran (\d+) tests",transcript)
    assert count and int(count.group(1))==15,(tag,transcript)
    failures=re.findall(r"^FAIL: (\w+)",transcript,re.MULTILINE)
    if mutation:
        assert result.returncode==1 and expected[mutation] in failures,(tag,transcript)
        assert "ERROR:" not in transcript,(tag,transcript)
    else:
        assert result.returncode==0 and transcript.rstrip().endswith("OK"),transcript
    records.append({"case":tag,"returncode":result.returncode,"tests":15,"failures":failures})

matrix=lambda value:[[str(x) for x in row] for row in value.tolist()]
_,_,_,a0,a1=tensor_data()
semion={"selected_c":"1","selected_h":"1/4", "external_dimension":2,
        "scalar_blocks":[str(f) for f in blocks()],"monic_connection":matrix(connection()),
        "positive_channel_metric":matrix(channel_metric()),
        "tensor_coefficients":{"A0":matrix(a0),"A1":matrix(a1)},
        "pair_reflection_kernels":{"vacuum":matrix(reflected_kernel(a0)),
                                   "weight_one":matrix(reflected_kernel(a1))},
        "categorical_F":"-1","declared_positive_braid_R":"I",
        "all_port_null_residuals":list(map(str,global_null_residuals())),
        "global_ward_residuals":list(map(str,global_ward_residuals())),
        "polynomial_braid_and_duality_checks":len(braid_checks())}
assert all(braid_checks())
selection=[]
for dim in (2,4):
    p,k0,k1,e=multiplicity_kernels(dim)
    selection.append({"dimension":dim,"vacuum_kernel_rank":k0.rank(),
                      "weight_one_epsilon_expectation":str((e.T*k1*e)[0]/dim),
                      "pointwise_midpoint_kernel":"3/2 K0+K1; d=4 gives I/4+P_epsilon"})
coefficients=[]
for name,c,h,intermediate in (("semion_vacuum",1,s.Rational(1,4),0),
                              ("semion_weight_one",1,s.Rational(1,4),1),
                              ("fib_vacuum",s.Rational(14,5),s.Rational(2,5),0),
                              ("fib_charged",s.Rational(14,5),s.Rational(2,5),s.Rational(2,5))):
    coefficients.append({"name":name,"c":str(c),"external_h":str(h),"internal_H":str(intermediate),
                         "grade_0_to_4":list(map(str,block_coefficients(c,h,intermediate)))})
producers=[Path(__file__).resolve(),test,root/"scripts/python/four_port_sewing.py",
           root/"scripts/python/four_port_semion.py",root/"scripts/python/small_category_stress.py",
           root/"scripts/python/small_category_sewing.py"]
sources=[root/"references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex",
         root/"references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex",
         root/"references/categorical-reconstruction/BrehmRunkel2024/source/main.tex",
         root/"references/cft/Schottenloher2008/Schottenloher2008.md"]
data={"scope":"Local four-port equations/probes; no full CFT, Hamiltonian or KS/OAR result",
      "python":sys.version.split()[0],"sympy":s.__version__,"tests":records,
      "semion":semion,"graded_multiplicity_selection":selection,"conditional_scalar_coefficients":coefficients,
      "fibonacci_midpoint_parities":{"even_ratio":"phi^(-3/2)","odd_ratio":"-phi^(3/2)",
                                       "scope":"specified symmetric transported chart, completed functions"},
      "sha256":{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in producers+sources}}
(output/"results.json").write_text(json.dumps(data,indent=2)+"\n")
print("15 exact four-port test groups pass; five mutations rejected; restored run passes.")
