const mem = Dict{Tuple{Int,Int,Int},Vector{Dict{Int,Int}}}()

partitions(n, n_parts, max_part) =
    get!(mem, (n, n_parts, max_part)) do
        if n_parts == 0 && (n > 0)
            return []
        elseif n == 0
            return [Dict()]
        else
            res = []
            for part in 1:min(n, max_part)
                subparts = deepcopy(partitions(n - part, n_parts - 1, part))
                foreach(l -> l[part] = get(l, part, 0) + 1, subparts)
                append!(res, subparts)
            end
            return res
        end
    end

function count_partition(d, parts)
    n = sum(prod, parts)
    places = factorial(big(n)) ÷ (prod(p -> factorial(p.first)^p.second, parts) * prod(factorial, values(parts)))
    digits = ((factorial(d) ÷ factorial(d - sum(values(parts)))))

    return places * digits * (d - 1) ÷ d
end

count_numbers(n, d, m) = sum(p -> count_partition(d, p), partitions(n, d, m))
println(count_numbers(18, 10, 3))