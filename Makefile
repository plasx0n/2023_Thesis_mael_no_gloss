
MAKE = make

.PHONY: all clean clear
all: main
	@echo
	@echo Main file generated.
	@echo

clean:
	cd figures/tikzpicture && $(MAKE) clean
	cd figures/pgfplots && $(MAKE) clean

clear:
	cd figures/tikzpicture && $(MAKE) clear
	cd figures/pgfplots && $(MAKE) clear

## To compile all subfiles

subfiles: introduction conclusion stateoftheart
	@echo
	@echo Subfiles generated
	@echo


## To compile the complete thesis

main: main.pdf main.gls main.acr
	makeglossaries main
	latexmk main.tex

main.pdf: main.tex
	latexmk main.tex

main.gls main.acr: main.ist  main.glo main.acn
	makeglossaries main


## To compile all latex figures

figures: tikzpictures pgfplots
	@echo
	@echo Figures generated.
	@echo

## To compile only tikz figures

tikzpictures: figures/tikzpicture/.latexmkrc figures/tikzpicture/Makefile
	cd figures/tikzpicture && $(MAKE) -B

## To compile only PGFPlots figures

pgfplots: figures/pgfplots/.latexmkrc figures/pgfplots/Makefile
	cd figures/pgfplots && $(MAKE) -B

## To compile the introduction alone

introduction: Introduction/introduction.pdf Introduction/introduction.bbl
	cd Introduction; lualatex -interaction=nonstopmode -file-line-error -synctex=1 introduction.tex

Introduction/introduction.pdf: Introduction/introduction.tex figures
	cd Introduction; lualatex -interaction=nonstopmode -file-line-error -synctex=1 introduction.tex

Introduction/introduction.bbl: Introduction/introduction.pdf
	biber --output-directory Introduction introduction.bcf


## To compile the conclusion alone

conclusion: Conclusion/conclusion.pdf Conclusion/conclusion.bbl
	cd Conclusion; lualatex -interaction=nonstopmode -file-line-error -synctex=1 conclusion.tex

Conclusion/conclusion.pdf: Conclusion/conclusion.tex figures
	cd Conclusion; lualatex -interaction=nonstopmode -file-line-error -synctex=1 conclusion.tex

Conclusion/conclusion.bbl: Conclusion/conclusion.pdf
	biber --output-directory Conclusion conclusion.bcf


## To compile the state of the art alone

stateoftheart: StateOfTheArt/stateoftheart.pdf StateOfTheArt/stateoftheart.bbl
	cd StateOfTheArt; lualatex -interaction=nonstopmode -file-line-error -synctex=1 stateoftheart.tex

StateOfTheArt/stateoftheart.pdf: StateOfTheArt/stateoftheart.tex figures
	cd StateOfTheArt; lualatex -interaction=nonstopmode -file-line-error -synctex=1 stateoftheart.tex

StateOfTheArt/stateoftheart.bbl: StateOfTheArt/stateoftheart.pdf
	biber --output-directory StateOfTheArt stateoftheart.bcf


## To compile the chapter 1 alone

chapter1: chapter1/chapter1.pdf chapter1/chapter1.bbl
	cd chapter1; lualatex -interaction=nonstopmode -file-line-error -synctex=1 chapter1.tex

chapter1/chapter1.pdf: chapter1/chapter1.tex figures
	cd chapter1; lualatex -interaction=nonstopmode -file-line-error -synctex=1 chapter1.tex

chapter1/chapter1.bbl: chapter1/chapter1.pdf
	biber --output-directory chapter1 chapter1.bcf

## To compile the chapter 2 alone

chapter2: chapter2/chapter2.pdf chapter2/chapter2.bbl
	cd chapter2; lualatex -interaction=nonstopmode -file-line-error -synctex=1 chapter2.tex

chapter2/chapter2.pdf: chapter2/chapter2.tex figures
	cd chapter2; lualatex -interaction=nonstopmode -file-line-error -synctex=1 chapter2.tex

chapter2/chapter2.bbl: chapter2/chapter2.pdf
	biber --output-directory chapter2 chapter2.bcf

## To add others, uncomment and replace NAME by whatever you want

# NAME: NAME/NAME.pdf NAME/NAME.bbl
# 	cd NAME; lualatex -interaction=nonstopmode -file-line-error -synctex=1 NAME.tex

# NAME/NAME.pdf: NAME/NAME.tex figures
# 	cd NAME; lualatex -interaction=nonstopmode -file-line-error -synctex=1 NAME.tex

# NAME/NAME.bbl: NAME/NAME.pdf
# 	biber --output-directory NAME NAME.bcf
