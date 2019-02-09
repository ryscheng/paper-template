# Commands
latex = pdflatex
bibtex = bibtex
latexmk = latexmk
htlatex = htlatex
chktex = chktex

# Variables
title = paper
papers = $(title).tex

# Environment variables
export TEXINPUTS:=.:./style:${TEXINPUTS}

#########################################
all:
	$(latexmk) -bibtex -pdf $(papers)

complete: pdf bib
	$(latex) $(papers)

pdf:
	$(latex) $(papers)

bib:
	$(bibtex) $(title)

lint:
	$(chktex) *.tex sections/*.tex

html:
	$(htlatex) $(papers)

deepclean:
	git clean -xdf

clean:
	$(latexmk) -c

serve:
	python -m SimpleHTTPServer
