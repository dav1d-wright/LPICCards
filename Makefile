SHELL=bash
TARGET=LPICCards.pdf
FLAGS= --shell-escape
SRC= ./*.tex ./header/*.tex  ./chapters/*/*.tex ./chapters/*/*/*.tex
TIKZ= ./tikz/*.tex
LL= pdflatex


all: $(TARGET)

$(TARGET): $(TARGET:%.pdf=%.tex) $(SRC) $(TIKZ)
	@$(LL) $(FLAGS) $<

open: $(TARGET)
	xdg-open $(TARGET)&

clean: 
	rm $(TARGET)
