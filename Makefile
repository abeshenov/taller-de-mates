TEX_FILES = $(wildcard *.tex)
PDF_FILES = $(TEX_FILES:.tex=.pdf)
SOL_PDF_FILES = $(TEX_FILES:.tex=-soluciones.pdf)

all: $(PDF_FILES) $(SOL_PDF_FILES)

%-soluciones.pdf: %.tex
	pdflatex -jobname=$(<:.tex=-soluciones) '\let\solutions=1 \input' $<

%.pdf: %.tex
	pdflatex $<

clean:
	rm -f *.aux *.log *.pdf

.PHONY: clean
