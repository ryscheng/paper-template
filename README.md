# Publication LaTeX template

This repo stores a LaTeX template for conference publications. The template is currently supports ACM, IEEE, and USENIX formatting. Tested for the following conferences:
- ACM CCS
- ACM SOCC
- ACM SOSP
- Eurosys
- IEEE S&P
- USENIX ATC
- USENIX NSDI
- USENIX OSDI
- USENIX Security

## Dependencies

Your system will need to be configured with the following programs:
- `pdflatex` - for compiling LaTeX to PDF
- `bibtex` - for compiling a bibliography
- `latexmk` - for incremental compilation of LaTeX
- `htlatex` - for compiling LaTeX to HTML (see 
- `chktex` - linting your .tex files

Your OS will probably have a meta-package that installs all of these at once.

On Ubuntu:
```bash
$ sudo apt-get install texlive-full
```

On MacOS:
```bash
$ brew cask install mactex
```

## Organization

- `paper.tex` is the root document that gets compiled.
- `paper.bib` is the master BibTeX file of all references.
- `sections/` is where paper text is stored
- `style/` contains styling macros

## Usage

### systemname Variable

For convenience, `\systemname{}` is a variable used to abstract the system's name. Please use this instead of hard-coding the system name in text. This will make it much easier to change the name down the line.

`\systemname{}` is defined in `paper.tex`.

### Common Macros

Please put all common packages, macros, and commands in `style/head-common.tex`.
This will always be included regardless of target conference.

### Conference Formatting
Depending on the conference, you'll need to make 3 changes to update formatting in `paper.tex`.

1. Include the corresponding header file (e.g. `\input{style/head-usenix}`)
2. Include the corresponding author list (e.g. `\input{author-usenix}`)
3. Uncomment the corresponding bibliography style

### Writing Sections

To separate content from everything else, please create a new file in `sections/` for every new section in the paper. Then include it in the appropriate position in `paper.tex`.
```latex
...
\input{sections/abstract}
\input{sections/introduction}
\input{sections/background}
\input{sections/design}
\input{sections/implementation}
\input{sections/evaluation}
\input{sections/discussion}
\input{sections/related}
\input{sections/conclusion}
...
```

### Compiling

For most purposes, use the incremental compiler
```bash
$ make all
```

If you want to manually compile:
```bash
$ make complete   # Run pdflatex, bibtex, then pdflatex again
$ make pdf        # Run pdflatex once
$ make bib        # Run bibtex once
```

### Automated Checks

It is recommended to follow all of the following steps before final submission

### chktex

Go through every file in `sections/` and run `chktex`:

```bash
$ chktex <filename>
```

As a shorthand, this will run it on all `.tex` files in `sections/`
```bash
$ make lint
```

### aspell

Go through every file in `sections/` and run `aspell`:

```bash
$ aspell -c <filename>
```

### Microsoft Word

Like it or not, MS Word is probably still the best grammar and spellchecker out there. To open your publication in MS Word, first compile it to HTML
```bash
$ make html
```

Then open MS Word with the generated HTML document and run spell check. You'll have to manually translate all the changes back into your original `.tex` files. 

You can also view the HTML file in a browser by running the following and navigating to `http://localhost:8000`.
```bash
$ make serve
```

See the following section to cleanup all the intermediate files generated.

### Clean

To delete all files that are not version controlled (e.g. as specified by `.gitignore`)
```bash
$ make clean
```

To only cleanup intermediate files from LaTeX
```bash
$ make latexclean
```

## Contributing

Feel free to fork and use for other papers. If you end up making any improvements, please email [me@raymondcheng.net](mailto:me@raymondcheng.net) to submit changes upstream. Thanks!

