using GraphVizDataFrame
using Test

@testset "GraphVizDataFrame.jl" begin
    df1 = CSV.read("examples/01_departments.csv", DataFrame)
    d1 = df2dot(df1)
    @test d1 == "digraph { \n   \"Peter\" [label=\"Peter\" ] \n  \"Thomas\" [label=\"Thomas\" ] \n  \"Morten\" [label=\"Morten\" ] \n  \"Lars\" [label=\"Lars\" ] \n  \"Michael\" [label=\"Michael\" ] \n  \"Sune\" [label=\"Sune\" ] \n \"Thomas\" -> \"Lars\"   [label=\"\"  ]  \n \"Michael\" -> \"Lars\"   [label=\"\"  ]  \n \"Morten\" -> \"Peter\"   [label=\"\"  ]  \n \"Lars\" -> \"Sune\"   [label=\"\"  ]  \n \"Peter\" -> \"Sune\"   [label=\"\"  ]   \n }"

end
