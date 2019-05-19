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
