title = paper
latex = pdflatex
bibtex = bibtex
htlatex = htlatex
papers = $(title).tex

export TEXINPUTS:=.:./style:${TEXINPUTS}

all:
	./latexmk.pl -bibtex -pdf $(papers)

complete: once bib
	$(latex) $(papers)

pdf:
	$(latex) $(papers)

bib:
	$(bibtex) $(title)

html:
	$(htlatex) $(papers)

gitclean:
	git clean -xdf

clean:
	./latexmk.pl -c

serve:
	python -m SimpleHTTPServer
