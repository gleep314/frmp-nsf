.PHONY all:
all: project_description references_cited data_management_plan \
				facilities_equipment project_summary 

.PHONY: PDFs
PDFs: all
	cp project_description/project_description.pdf PDFs \
				&& cp data_management_plan/data_management_plan.pdf PDFs \
				&& cp facilities_equipment/facilities_equipment.pdf PDFs \
				&& cp project_summary/project_summary.pdf PDFs \
				&& cp references_cited/references_cited.pdf PDFs

.PHONY: project_description
project_description:
	cd project_description && latexmk -f -pdf project_description.tex

.PHONY: data_management_plan
data_management_plan:
	cd data_management_plan && latexmk -f -pdf data_management_plan.tex

.PHONY: project_summary
project_summary:
	cd project_summary && latexmk -f -pdf project_summary.tex

.PHONY: references_cited
references_cited: project_description
	cp project_description/project_description.bbl references_cited/ \
						&& cp project_description/project_description.aux references_cited \
						&& cd references_cited \
						&& latexmk -f -pdf references_cited.tex

files = *.bbl *.aux *.log *synctex.gz *.blg *.fdb_latexmk *.fls
.PHONY: clean
clean:
	cd project_description && rm -f $(files) project_description.pdf
	cd data_management_plan && rm -f $(files) *.pdf
	cd project_summary && rm -f $(files) *.pdf
	cd references_cited && rm -f $(files) *.pdf
