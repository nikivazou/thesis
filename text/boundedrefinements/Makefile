TEXINPUTS=.:Styles//::
BSTINPUTS=.:Styles//::

TARGET=main
STY = liquidHaskell.sty mathpartir.sty commands.sty
TEX = main.tex abstract.tex database.tex conclusion.tex files.tex intro.tex overview.tex related.tex rules.tex syntax.tex translation.tex state.tex 
BIB = sw
SRCFILES = Makefile  ${TEX} ${STY} ${BIB}.bib  

all: ${SRCFILES}
	pdflatex main
	bibtex main
	pdflatex main
	bibtex main
	pdflatex main

clean:
	$(RM) *.log *.aux *.ps *.dvi *.bbl *.blg *.bak *.fdb_latexmk *~

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
