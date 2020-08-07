TEX = pdflatex -interaction nonstopmode
BIB = bibtex
DOCKERIMAGE = hegyhati/journal-latex:latest


MAINDOCUMENT = manuscript
BIBFILE = references.bib
FIGURES = $(shell find *.eps *.png *.jpg)

all: $(MAINDOCUMENT).tex $(MAINDOCUMENT).bbl $(FIGURES)
	$(TEX) $(MAINDOCUMENT)
	$(TEX) $(MAINDOCUMENT)

spell::
	ispell *.tex

clean::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.loa $(MAINDOCUMENT).pdf *-converted-to.pdf

$(MAINDOCUMENT).bbl: $(MAINDOCUMENT).tex $(BIBFILE)
	$(TEX) $(MAINDOCUMENT)
	$(BIB) $(MAINDOCUMENT)

docker-all::
	docker run --rm -v ${PWD}:/project -w /project $(DOCKERIMAGE)  make all
