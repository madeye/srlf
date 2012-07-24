# Makefile for LFSR paper.
# Copyright (c) 2012 Max Lv
TEX = latex
DVI2PDF = dvipdf
doc = lfsr
source = $(doc).tex
pdf = $(doc).pdf
dvi = $(doc).dvi

all: $(pdf)

#env = TEXINPUTS=../texlive-common:../texlive-en:; export TEXINPUTS;
env = 

$(dvi): $(source)
	$(env) $(TEX) $<

$(pdf): $(dvi)
	$(env) $(DVI2PDF) $<

clean:
	rm -f *.aux *.log *.blg *.toc *.out *.lot tex4ht.ps *.4*
	rm -f *.xref* *.lg *.idv *.out *.otc *.tmp tmp.*
	rm -f $(doc).dvi $(doc).ps

realclean: clean
	rm -f $(doc).pdf
	rm -f *.html *.htm $(doc).css *.gif *.jpg
