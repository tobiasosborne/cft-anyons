"""Reproduce small categorical sewing, cohomology and stress probes.

Command: python3 scripts/python/run_small_category_inputs.py
No network, diagonalization or chain computation; exact algebra only.
"""
from pathlib import Path
import hashlib,json,os,re,subprocess,sys
import sympy as s
from small_category_sewing import R,canon,Category,parameters,assoc_residuals,frobenius_blocks,cohomology_data
from small_category_stress import Virasoro,exchange,null_selection

assert not os.environ.get("CFT_SMALL_MUTATION"), "producer needs restored implementation"
root=Path(__file__).resolve().parents[2]
output=root/"runs/2026-10-21-small-category-inputs"
output.mkdir(parents=True,exist_ok=True)
test=root/"scripts/python/test_small_category_inputs.py"
records=[]
expected={"fib_product":"test_positive_associative_products",
          "semion_F":"test_semion_obstruction_is_associator_dependent",
          "virasoro_central":"test_virasoro_gram_matches_independent_level_two_formula",
          "ward_weight":"test_vacuum_exchange_coefficients_and_all_low_grade_ward_relations"}
for mutation in ("",*expected,""):
    tag=mutation or ("green_restored" if records else "green_initial")
    env=os.environ.copy();env["CFT_SMALL_MUTATION"]=mutation
    result=subprocess.run([sys.executable,str(test)],cwd=root,env=env,
                          text=True,capture_output=True,timeout=30)
    transcript=result.stdout+result.stderr
    (output/f"{tag}.txt").write_text(transcript)
    count=re.search(r"Ran (\d+) tests",transcript)
    assert count and int(count.group(1))==10,(tag,transcript)
    failures=re.findall(r"^FAIL: (\w+)",transcript,re.MULTILINE)
    if mutation:
        assert result.returncode==1 and expected[mutation] in failures,(tag,transcript)
        assert "ERROR:" not in transcript,(tag,transcript)
    else:
        assert result.returncode==0 and transcript.rstrip().endswith("OK"),transcript
    records.append({"case":tag,"returncode":result.returncode,"tests":10,"failures":failures})

matrix=lambda a:[[str(canon(x)) for x in row] for row in a.tolist()]
categories=[]
for name in ("VecZ2","Fib"):
    cat=Category(name);alpha,beta=parameters(cat)
    blocks=[]
    for total in (0,1):
        left,right,mmstar,row=frobenius_blocks(cat,total)
        blocks.append({"charge":total,"multiplication":matrix(row),
                       "frobenius_map":matrix(left),"m_dagger_m":matrix(mmstar),
                       "special_scalar":str(canon((row*row.T)[0]))})
    categories.append({"name":name,"alpha":str(canon(alpha)),"beta":str(canon(beta)),
                       "associativity_residuals":list(map(str,assoc_residuals(cat))),"blocks":blocks})
d1,d2,h2,sep=cohomology_data()
stress=[]
for name,c,h in (("Semion",s.Integer(1),s.Rational(1,4)),
                 ("Fib",s.Rational(14,5),s.Rational(2,5))):
    rep=Virasoro(c,h)
    states=exchange(c,h,4)
    stress.append({"name":name,"selected_c":str(c),"selected_h":str(h),
                   "grams":[{"grade":k,"basis":rep.basis(k),"matrix":matrix(rep.gram(k)),
                             "rank":rep.gram(k).rank()} for k in range(1,5)],
                   "vacuum_exchange":{str(k):{str(w):str(a) for w,a in v.items()} for k,v in states.items()}})
producers=[Path(__file__).resolve(),test,root/"scripts/python/small_category_sewing.py",
           root/"scripts/python/small_category_stress.py"]
sources=[root/"references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex",
         root/"references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex",
         root/"references/cft/Schottenloher2008/Schottenloher2008.md"]
data={"scope":"Exact small algebra-object and one-block stress checks; not complete CFT/KS/OAR",
      "field":"Q(r), r>0, r^4-r^2-1=0; phi=r^2", "python":sys.version.split()[0],
      "sympy":s.__version__,"tests":records,"categories":categories,
      "semion_A_1_plus_s":"associativity forces alpha=0; dagger Frobenius/separability fail",
      "fib_cohomology":{"d1":matrix(d1),"d2":matrix(d2),"h2":matrix(h2),
                         "separability_residuals":[str(canon(a)) for a in sep],
                         "ranks_d1_d2":[1,1],"all_positive_degrees":"vanish by LC-7 contraction proof"},
      "stress":stress,"semion_null_selection":str(s.factor(null_selection(s.Rational(1,4),s.Rational(1,4),s.Symbol("h_out")))),
      "sha256":{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in producers+sources}}
(output/"results.json").write_text(json.dumps(data,indent=2)+"\n")
print("10 exact small-input tests pass; four mutations rejected; restored run passes.")
