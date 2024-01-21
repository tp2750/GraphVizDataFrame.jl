using GraphVizDataFrame
using Documenter

DocMeta.setdocmeta!(GraphVizDataFrame, :DocTestSetup, :(using GraphVizDataFrame); recursive=true)

makedocs(;
    modules=[GraphVizDataFrame],
    authors="Thomas Poulsen <ta.poulsen@gmail.com> and contributors",
    repo="https://github.com/tp2750/GraphVizDataFrame.jl/blob/{commit}{path}#{line}",
    sitename="GraphVizDataFrame.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://tp2750.github.io/GraphVizDataFrame.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/tp2750/GraphVizDataFrame.jl",
    devbranch="main",
)
