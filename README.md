# GraphVizDataFrame

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://tp2750.github.io/GraphVizDataFrame.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://tp2750.github.io/GraphVizDataFrame.jl/dev/)
[![Build Status](https://github.com/tp2750/GraphVizDataFrame.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/tp2750/GraphVizDataFrame.jl/actions/workflows/CI.yml?query=branch%3Amain)


Quickly generate a graph from a DataFrame.

Use the template.csv in `examples` as template or rename the columns of your dataframe accordingly.

``` julia
df1 = CSV.read("examples/01_departments.csv", DataFrame)
plot_dot(d1, "/tmp/dept.png")
```

![dept](docs/src/img/01_dept.png)


## Installation

Not yet registered, so install from github and track main branch:

``` julia
using Pkg
pkg"add https://github.com/tp2750/GraphVizDataFrame.jl#main"
```
