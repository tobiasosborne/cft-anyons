# Pdflatex research synthesis

Final output: `cft_machine/report.pdf`. Master: `cft_machine/report.tex`.
This is the detailed standalone summary requested on 2026-09-22 while winding
up the CFT-machine investigation. The root `report.pdf` remains the complete
historical lab book; the synthesis explains all new work and its boundaries.

Build from the repository root:

```bash
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=cft_machine cft_machine/report.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=cft_machine cft_machine/report.tex
```

The source combines eight short synthesis sections in this folder with the
canonical lab-book shards CA-81--CA-85. Changes to those shards require
rebuilding both PDFs. Source and run paths in the PDF are repository-relative.

Visual QA: all 26 pages rendered with Poppler at 90 dpi and inspected; final
pdflatex log has no overfull boxes, unresolved references or missing glyphs.
Temporary rendering images live outside the repository and are not deliverables.

The report preserves the user's locality direction: global fusion constraints
are compatible with local models on fusion spaces. The current descendant
spaces have not yet been identified with such a categorical local model.
