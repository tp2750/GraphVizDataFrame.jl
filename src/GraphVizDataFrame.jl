module GraphVizDataFrame

using DataFrames
using DataFramesMeta

export df2dot, plot_dot

"""
    Generate dot-file of relations based on DataFrame
"""
function df2dot(df) ## convention over configuration: node1, node2; node1_label=missing, node2_label=missing, edge_label=missing, node1_fillcolor, node2_fillcolor, edge_type)
    df2 = @subset(df, .!ismissing.(:node1) .& .!ismissing(:node2))
    dot = String[]
    nodes = Dict{String,String}()
    for row in eachrow(df2)
        n1 = escapequote(row.node1)
        n2 = escapequote(row.node2)
        col1 = colorstring(row.node1_fillcolor)
        col2 = colorstring(row.node2_fillcolor)
        nodes[n1] = """  "$n1" [label="$(n1)" $(col1)] """
        nodes[n2] = """  "$n2" [label="$(n2)" $(col2)] """
        edge_type = edge_style_string(row.edge_type)
        edge_name = edge_name_string(row.edge_label)
        label = """ [label="$(edge_name)" $(edge_type) ] """
        dot_line = """ "$n1" -> "$n2"  $label """
        push!(dot, dot_line)
    end
    lines = join([collect(values(nodes)); dot], "\n")
    "digraph { \n $lines \n }"
end

function plot_dot(x::String, filename)
    dotfilename=tempname()*".dot"
    write(dotfilename, x)
    run(`dot -Tpng -o$filename $dotfilename`)
    @info "Wrote $filename from $dotfilename"
end

plot_dot(df::DataFrame, filename::String) = plot_dot(df2dot(df), filename)

colorstring(x) = ismissing(x) ? "" : """ , fillcolor="$x" , style="filled" """
edge_style_string(x) =  ismissing(x) ? "" : """ style="$x" """ 
edge_name_string(x) =  ismissing(x) ? "" : escapequote(x)


escapequote(x) = replace(x, "\"" => "'")
 
end
