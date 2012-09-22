# Makefile for LFSR paper.
# Copyright (c) 2012 Max Lv
TEX = latex
DVI2PDF = dvipdf
BIBTEX = bibtex
doc = lfsr
source = $(doc).tex
pdf = $(doc).pdf
dvi = $(doc).dvi
aux = $(doc).aux
blb = $(doc).blb

all: $(pdf)

#env = TEXINPUTS=../texlive-common:../texlive-en:; export TEXINPUTS;
env = 

$(aux): $(source)
	$(env) $(TEX) $<

$(blb): $(aux)
	$(env) $(BIBTEX) $<

$(dvi): $(blb)
	$(env) $(TEX) $(source)
	$(env) $(TEX) $(source)

$(pdf): $(dvi)
	$(env) $(DVI2PDF) $<

clean:
	rm -f *.aux *.bbl *.log *.blg *.toc *.out *.lot tex4ht.ps *.4*
	rm -f *.xref* *.lg *.idv *.out *.otc *.tmp tmp.* *.brf
	rm -f $(dvi) $(doc).ps $(blb)

realclean: clean
	rm -f $(doc).pdf
	rm -f *.html *.htm $(doc).css *.gif *.jpg
