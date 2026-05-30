REPORT_TEX := report.tex
REPORT_SHARDS := $(shell find report/sections -type f -name '*.tex' 2>/dev/null | sort)
REPORT_PDF := report.pdf

.PHONY: report check-report-shards ci-before-push test clean-report clobber-report

report: $(REPORT_PDF)

$(REPORT_PDF): $(REPORT_TEX) $(REPORT_SHARDS)
	latexmk -pdf $(REPORT_TEX)

check-report-shards:
	scripts/check_report_shards.sh

ci-before-push:
	scripts/ci_before_push.sh

test:
	julia --project=. -e 'using Pkg; Pkg.test()'

clean-report:
	latexmk -c $(REPORT_TEX)

clobber-report:
	latexmk -C $(REPORT_TEX)
	rm -f $(REPORT_PDF)
