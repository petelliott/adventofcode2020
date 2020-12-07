tree = Dict()

function count_bags(tree, root)
    count = 1
    if get(tree, root, nothing) == nothing
        return count
    end
    for (n, name) in tree[root]
        count += n * count_bags(tree, name)
    end
    return count
end


for line in eachline()
    lhs, rhs = split(line, " contain ")
    lhs = split(lhs, " bag")[1]

    if rhs != "no other bags."
        for v in split(rhs, ", ")
            rhnum, w1, w2, _ = split(v, " ")
            rhnum = parse(Int64, rhnum)
            rhs = w1 * " " * w2;
            if get(tree, lhs, nothing) == nothing
                tree[lhs] = []
            end
            push!(tree[lhs], (rhnum, rhs))
        end
    end
end

println(count_bags(tree, "shiny gold")-1)