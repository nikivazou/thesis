TARGET= main

URL=nvazou@goto.ucsd.edu:~/public_html/lazytechreport.pdf

STY = liquidHaskell.sty commands.sty
TEX = main.tex abstract.tex evaluation.tex haskellListings.tex intro.tex overview.tex related.tex results.tex rules.tex
BIB = main.bbl
CLS = sigplanconf.cls
SRCFILES = Makefile ${TEX} ${STY} ${CLS}


all: ${SRCFILES}
	pdflatex main
	bibtex main
	pdflatex main
	bibtex main
	pdflatex main

clean:
	$(RM) *.log *.aux *.ps *.dvi *.bbl *.blg *.bak *.fdb_latexmk *.out *~ proofs/*.log

reallyclean: clean
	$(RM) *.ps *.pdf

distclean: reallyclean

pdfshow: $(TARGET).pdf
	xpdf $(TARGET).pdf

acroshow: $(TARGET).pdf
	acroread $(TARGET).pdf

pack: reallyclean
	tar cvfz liquidHaskell_tex.tar.gz ${SRCFILES}

PHONY : ps all clean reallyclean distclean
