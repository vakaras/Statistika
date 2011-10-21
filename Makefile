PARTS    := ./part1
# Iš trijų dalių atrodytų taip.
# PARTS    := ./part1:./part2:./part3
TEXINPUTS := .:./config:./common:./deps:${PARTS}:
export TEXINPUTS

all: config/main.pdf

%.pdf: %.tex
	echo ${TEXINPUTS} ${PATH}
	xelatex -shell-escape -output-directory dist "\input{$*.tex}"

show:
	xdg-open dist/main.pdf
