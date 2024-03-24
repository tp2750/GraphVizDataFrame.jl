# GraphVizDataFrame

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://tp2750.github.io/GraphVizDataFrame.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://tp2750.github.io/GraphVizDataFrame.jl/dev/)
[![Build Status](https://github.com/tp2750/GraphVizDataFrame.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/tp2750/GraphVizDataFrame.jl/actions/workflows/CI.yml?query=branch%3Amain)


Quickly generate a graph from a DataFrame.

Use the template.csv in `examples` as template or rename the columns of your dataframe accordingly.

``` julia
using GraphVizDataFrame
using CSV, DataFrames
df1 = CSV.read("examples/01_departments.csv", DataFrame)
plot_dot(df1, "/tmp/dept.png")
```

![dept](docs/src/img/01_dept.png)


## Installation

Not yet registered, so install from github and track main branch:

``` julia
using Pkg
pkg"add https://github.com/tp2750/GraphVizDataFrame.jl#main"
```

## GraphViz

Make sure that edge_label is a string. It currently fails if they are all integers.

###  Edge_type
The column edge_type can be the following as described here: <https://graphviz.org/docs/attr-types/style/>

* "dashed"
* "dotted"
* "solid"
* "invis"
* "bold"
* "tapered"

### Fillcolor

The nodex_fillcolor can be hex RGB, HSV or x11 strings, ad described here: <https://graphviz.org/docs/attr-types/color/>

Examples:

| Color     | RGB       | HSV                 | String      |
| ---       | ---       | ---                 | ---         |
| White     | "#ffffff" | "0.000 0.000 1.000" | "white"     |
| Black     | "#000000" | "0.000 0.000 0.000" | "black"     |
| Red       | "#ff0000" | "0.000 1.000 1.000" | "red"       |
| Turquoise | "#40e0d0" | "0.482 0.714 0.878" | "turquoise" |
| Sienna    | "#a0522d" | "0.051 0.718 0.627" | "sienna"    |

It will always be the last specified color that applies, node2_fillcolor is applied after node1_fillcolor
