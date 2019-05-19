# polydoc

This project documents examples of using `knitr`, `rmarkdown`, and `bookdown` to write single-source static documentation using both R and Python code.

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

Links:

* [sphinx-build events](http://www.sphinx-doc.org/en/stable/extdev/appapi.html#sphinx-core-events)
