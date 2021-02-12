include("pell-fermat.jl")

function right_triangles(N)
    a = 1
    b = 1
    res = 0

    while true
        a, b = 3a + 4b, 2a + 3b
        if a + b > N
            break
        else
            res += div(N, a + b)
        end
    end

    return res
end

println(right_triangles(10^8))