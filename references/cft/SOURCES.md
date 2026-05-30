# Source Manifest — `references/cft/`

Conformal-field-theory ground-truth sources. Per AGENTS.md Law 1, every claim
that uses one of these cites a local path + line locator into the extracted
markdown (or a page in the PDF).

## Sources

### SRC-SCHOTTENLOHER-CFT — Schottenloher, *A Mathematical Introduction to CFT*

- **Author:** Martin Schottenloher
- **Title:** A Mathematical Introduction to Conformal Field Theory
- **Series:** Lecture Notes in Physics, vol. 759 (2nd edition)
- **Publisher:** Springer, Berlin Heidelberg, 2008
- **DOI:** 10.1007/978-3-540-68628-6
- **ISBN:** 978-3-540-68625-5 (print) / 978-3-540-68628-6 (online)
- **Local PDF:** `references/cft/Schottenloher2008.pdf` (249 pp)
- **PDF SHA256:** `b81c172da0138c3b8b28483be881a5d035f427aa476dfb2027a304e142b1e97c`
- **Extracted markdown:** `references/cft/Schottenloher2008/Schottenloher2008.md`
  (via `marker`; SHA256 recorded below)
- **Extraction SHA256:** `d718428a2feb94e4f26b1c9c59b3dce3826b68d146f251cb95cde2bbed80cb40`
  (markdown via `marker`; 7740 lines; equations preserved as LaTeX, e.g. the
  Virasoro central-charge commutator and stress-tensor mode expansion).
  Sidecar: `Schottenloher2008_meta.json` + 9 extracted figures (`_page_*.jpeg`).
- **Retrieval:** copied 2026-05-30 from the owner's personal library
  (`C:\Users\tobia\Dropbox\Books and Papers\Physics\Quantum field theory\Conformal field theory\`).
  Owner-held copy; not redistributed in this repo's public remote beyond fair
  scholarly use. Re-acquirable via Springer / TIB (LUH institutional access).
- **Why it's here:** the owner's primary CFT reference; designated ground truth
  for the rigorous-CFT target end of the pipeline (CA-01 Stage 5 — conformal
  nets / VOA / Wightman, central charge / Virasoro / OPE conventions).

## Notes

- Cite as, e.g.:
  ```
  % Source: references/cft/Schottenloher2008/Schottenloher2008.md:<line>
  %   "<verbatim statement / equation>"
  ```
- The PDF is the authoritative artifact; the marker markdown is a convenience
  extraction for grep/line-citation. Where they disagree, the PDF wins.
