# polydoc

This project documents examples of using `knitr`, `rmarkdown`, and `bookdown` to write single-source static documentation using both R and Python code.

The intent of the project is to create something similar to `nbsphinx` (the plugin that allows you to mix jupyter notebooks in with .rst source files), but for `.Rmd` files.

The flow for writing documentation in this project looks like this:

* individual pages written as `.Rmd` files
* edit `docs/index.rst` to change document order
* build the full site with `cd docs/ && make html`

To generate the docs, run this

```
./run.sh
```

This run script will do the following things:

* for each file `rmd/filename.Rmd`, create `html/filename.html`
* knit the existings Sphinx docs in `docs`, which will create `docs/_build/`
* move contents of `html` into `docs/_build`

## Reasons the current version of this project sucks

* the files from .Rmd sources aren't indexed in Sphinx's built-in search index (so people searching for keywords don't benefit from them)
* not as fully-baked as a proper sphinx add-in like `nbsphinx`, so you have to do a lot of manual stuff
    - touch `Makefile`
    - paste a lot of code into `conf.py`
* requires you to put R in whatever environment is generating your docs (e.g. the servers run by Read The Docs), which is pretty expensive. This is needed even if your `.Rmd` files are only unevaluated code blocks and text

## Links

* [sphinx-build events](http://www.sphinx-doc.org/en/stable/extdev/appapi.html#sphinx-core-events)
* [nbsphinx source](https://github.com/spatialaudio/nbsphinx/tree/master/src)
