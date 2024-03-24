using GraphVizDataFrame, CSV, DataFrames
using Test

@testset "GraphVizDataFrame.jl" begin
    df1 = CSV.read("../examples/01_departments.csv", DataFrame)
    d1 = df2dot(df1)
    r1 = """
digraph { 
   "Peter" [label="Peter
Boy" ] 
  "Thomas" [label="Thomas"  , fillcolor="red" , style="filled" ] 
  "Morten" [label="Morten"  , fillcolor="#40e0d0" , style="filled" ] 
  "Lars" [label="Lars"  , fillcolor="blue" , style="filled" ] 
  "Michael" [label="Michael"  , fillcolor="white" , style="filled" ] 
  "Sune" [label="Sune
Boss"  , fillcolor="yellow" , style="filled" ] 
 "Thomas" -> "Lars"   [label="L1"  style="solid"  ]  
 "Michael" -> "Lars"   [label="L2"  style="dotted"  ]  
 "Morten" -> "Peter"   [label="L3"  style="bold"  ]  
 "Lars" -> "Sune"   [label="4"  style="tapered"  ]  
 "Peter" -> "Sune"   [label="5"  ]   
 }"""
    @test d1 == r1
    ## "digraph { \n   \"Peter\" [label=\"Peter\" ] \n  \"Thomas\" [label=\"Thomas\" ] \n  \"Morten\" [label=\"Morten\" ] \n  \"Lars\" [label=\"Lars\" ] \n  \"Michael\" [label=\"Michael\" ] \n  \"Sune\" [label=\"Sune\" ] \n \"Thomas\" -> \"Lars\"   [label=\"\"  ]  \n \"Michael\" -> \"Lars\"   [label=\"\"  ]  \n \"Morten\" -> \"Peter\"   [label=\"\"  ]  \n \"Lars\" -> \"Sune\"   [label=\"\"  ]  \n \"Peter\" -> \"Sune\"   [label=\"\"  ]   \n }"

end
