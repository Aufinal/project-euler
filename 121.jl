using Combinatorics

function probwin(n)
    m = n ÷ 2 + 1
    res = 0
    for k in m:n
        for s in combinations(1:n, k)
            comp = setdiff(1:n, s)
            res += prod(@. 1 / (1 + s)) * prod(@. 1 - 1 / (1 + comp))
        end
    end
    
    return res
end

println(1 / probwin(15))