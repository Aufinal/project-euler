const mem = Dict{Tuple{Int,Int,Int},Vector{Vector{Int}}}()

partitions(n, n_parts, max_part) =
    get!(mem, (n, n_parts, max_part)) do
        if n_parts == 0 && (n > 0)
            return []
        elseif n == 0
            return [[]]
        else
            res = []
            for part in 1:min(n, max_part)
                subparts = partitions(n - part, n_parts - 1, part)
                append!(res, ([part, l...] for l in subparts))
            end
            return res
        end
    end

count_partition(n, d, parts) = (factorial(big(n)) ÷ prod(factorial, parts)) * ((factorial(d) ÷ factorial(d - length(parts))))

println(partitions(18, 10, 3))

count_numbers(n, d, m) = sum(p -> count_partition(n, d, p), partitions(n, d, m))
println(count_numbers(18, 10, 3))