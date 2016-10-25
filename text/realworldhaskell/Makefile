FILES=bytestring.tex \
	  discussion.tex \
	  haskellListings.tex \
	  intro.tex \
	  xmonad.tex \
	  related.tex \
	  termination.tex \
	  totality.tex \
	  conclusion.tex \
	  evaluation.tex \
	  hscolour.tex \
	  main.tex \
	  memory-safety.tex \
	  results.tex \
	  text.tex \
	  type-classes.tex

all: $(FILES)
	pdflatex main
	pdflatex main
	bibtex main
	pdflatex main
	bibtex main
	pdflatex main

clean:
	$(RM) *.log *.aux *.ps *.dvi *.bbl *.blg *.bak *.fdb_latexmk *.out *~ proofs/*.log

