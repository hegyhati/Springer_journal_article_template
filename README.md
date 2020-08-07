Instructions for using this repository as a template for writing a manuscript in LaTeX for Springer journals.

# Directory structure

The thesis related files:

File/Directory  |  Purpose
----|----
[`manuscript.tex`](manuscript.tex)  |  The "master" LaTeX file, that is compiled, provided by Springer
[`references.bib`](references.bib) | BibTeX file for references
`Springer_LaTeX_Info/` | Directory for user guide, change history and readme provided by Springer

Other files related for easy building, CI workflow:

File/Directory  |  Purpose
----|----
[`Makefile`](Makefile)  |  Simple makefile to build the project
[`.gitignore`](.gitignore) | Typical LaTeX gitignore
[`Docker/Dockerfile`](Docker/Dockerfile) | Dockerfile for the `hegyhati/journal-latex` image
[`.github/workflows`](.github/workflows/) | [GitHub Actions workflow](https://github.com/hegyhati/Springer_journal_article_template/actions) configuration files

# Compiling the manuscript

## Regular way

If you have a Linux-based system, simply run `make`, and it will:
 - run `pdflatex`
 - run `bibtex`
 - run `pdflatex` twice

To get rid of the generated files (pdf included) simply run `make clean`.

In order to have the necessary commands executed my `make`, several packages need to be installed, which can differ for each distribution. 

## The Docker way

If you don't want to install these packages on your host system, but have `docker`, simply mount this directory into a container and do it there:
```
docker run --rm -v ${PWD}:/project -w /project hegyhati/journal-latex:latest make
```
You can similarly run `make clean` as well, although it only uses `rm` so there isn't much reason to do so.

To make building in docker a bit easier, `docker-all` is specified in the makefile target, with the command above. So you can just run the following if you have `make` and `docker` but not the LaTeX packages.
```
make docker-all
```

## The "GitHub way" 

Just push the changes to the repository, and [this simple workflow](.github/workflows/build.yml) will build it for you, and `manuscriptr.pdf` will be available as an artifact.

# Extending the build environment

If your thesis requires additional LaTeX packages, either create a new docker image (preferred), or extend the [workflow](.github/workflows/build.yml) with installing those packages.

