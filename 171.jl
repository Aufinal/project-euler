const mem = Dict{Tuple{Int,Int},Tuple{Int,Int}}()

find_sumsq(n, n_digits) =
    get!(mem, (n, n_digits)) do
        iszero(n) && return (1, 0)
        iszero(n_digits) && return (0, 0)
        c, s = 0, 0
        for i in 0:min(9, isqrt(n))
            ci, si = find_sumsq(n - i * i, n_digits - 1)
            c += ci
            s += si * 10 + ci * i
        end
        return (c, s % 10^9)
    end

find_all(e) = sum(n -> last(find_sumsq(n * n, e)), 1:isqrt(81 * e)) % 10^9

println(find_all(20))
