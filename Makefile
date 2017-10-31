# Commands
latex = pdflatex
bibtex = bibtex
htlatex = htlatex
chktex = chktex

# Variables
title = paper
papers = $(title).tex

# Environment variables
export TEXINPUTS:=.:./style:${TEXINPUTS}

#########################################
all:
	./latexmk.pl -bibtex -pdf $(papers)

complete: once bib
	$(latex) $(papers)

pdf:
	$(latex) $(papers)

bib:
	$(bibtex) $(title)

lint:
	$(chktex) *.tex sections/*.tex

html:
	$(htlatex) $(papers)

clean:
	git clean -xdf

latexclean:
	./latexmk.pl -c

serve:
	python -m SimpleHTTPServer
