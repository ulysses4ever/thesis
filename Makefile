all: build

clean:
	rm -rf *.log *.aux *.bbl *.blg *~

build:
	latexmk -pdf main.tex
build_fast:
	pdflatex -interaction=nonstopmode main.tex
build_pp:
	pplatex -interaction=nonstopmode main.tex
build_clean:
	latexmk -c

gen_appx:
	cabal run -v0 ./gen-figs-appx.hs > figs/all-package-graphs.tex

# outdated:
changes:
	pandoc -s -V geometry:margin=1in ./oopsla21-2nd-response.md -o changes.pdf
