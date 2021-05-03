function vp(n::Int, p::Int)::Int
    if n == 0
        return 0
    end
    max = trunc(Int, log(p, n))

    return sum(n .÷ p.^(1:max))
end

function n_sym(x, y, z)
    if x == y == z
        return 1
    elseif x == y || y == z
        return 3
    else
        return 6
    end
end

function find_div(N, pow)
    vp2::Array{Int} = vp.(0:N, 2)
    vp5::Array{Int} = vp.(0:N, 5)
    res = 0
    @time for x in 0:N ÷ 3
        for y in x:(N - x) ÷ 2
            z = N - x - y
            v2 = vp2[N + 1] - vp2[x + 1] - vp2[y + 1] - vp2[z + 1]
            v5 = vp5[N + 1] - vp5[x + 1] - vp5[y + 1] - vp5[z + 1]

            if v2 >= pow && v5 >= pow
                res += n_sym(x, y, z)
            end
        end
    end

    return res
end

println(find_div(200000, 12))