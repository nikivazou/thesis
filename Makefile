## all:
## 	latexmk -pdf main.tex

all: 
	pdflatex main
	bibtex main 
	pdflatex main
	pdflatex main


.PHONY: clean
clean:
	$(RM) *.log *.aux *.ps *.dvi *.bbl *.blg *.bak *.fdb_latexmk *~
