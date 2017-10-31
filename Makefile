title = paper
latex  = pdflatex
papers = $(title).tex

export TEXINPUTS:=.:./template:${TEXINPUTS}

all: pdf

pdf : 
	$(latex) $(papers)
	bibtex $(title) 
	$(latex) $(papers)
	$(latex) $(papers)

once:
	$(latex) $(papers)

clean:
	rm *.aux
	rm *.bbl
	rm *.blg
	rm *.log
	rm *.out
	rm paper.pdf
