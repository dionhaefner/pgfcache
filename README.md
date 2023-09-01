# The pgfcache LaTeX package

## What does it do?

pgfcache compiles PGF images to PDF only when needed (i.e., after you made changes to a figure). Otherwise, the static PDF is served, severely cutting compilation time for figure-heavy documents (think tikz-externalize for PGF images). Also, I have specifically designed it to play well with figures that were created with Matplotlib's PGF backend.

## Usage

Using the package is easy. A minimal example would be:

```latex
\documentclass{article}
\usepackage{pgfcache}

\setpgfpreamble{%
  \usepackage{amsmath}
  <other packages that are needed to compile your PGF images, e.g. fonts>
}

\begin{document}
	\importpgf{path/to/pgffile}{myfigure.pgf}
\end{document}

```

Your file then has to be compiled with the option `-shell-escape` to `pdflatex`, e.g.:

```bash
pdflatex -synctex=1 -shell-escape -interaction=nonstopmode "yourfile".tex
```

You will also have to create a folder called `_pgfcache` in the parent folder of your TeX document. This is where all the pre-compiled figures will go.

If you specify an output directory (by adding `-output-directory=<output>` to the `pdflatex` command above), you should create the `_pgfcache` folder in that output directory. Additionally, you have to add `\setoutputdir{<output>}` to the preamble of your LaTeX document.

## Troubleshooting

The package has only rudimentary error checks. If you run into errors, you should first check whether your figures are compiled correctly (by looking at the logs in the `_pgfcache` folder). Chances are, you just need to specify additional packages with `\setpgfpreamble`, or delete the cache and try again. Otherwise, feel free to contact me or raise an issue.

Also note that pgfcache only works with PDFLaTeX (no XeLaTeX or LuaLaTeX support).
