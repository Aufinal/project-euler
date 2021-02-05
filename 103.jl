using Combinatorics

function test_set(S)
    k = length(S)

    for i in 1:(k - 1) ÷ 2
        if sum(S[1:(i + 1)]) <= sum(S[end - i + 1:end])
            return false
        end
    end

    for j in 1:k ÷ 2
        for subset in combinations(S, 2 * j)
            total = sum(subset)
            if isodd(total)
                continue
            end

            for subsub in combinations(subset, j)
                if 2 * sum(subsub) == total
                    return false
                end
            end
        end
    end

    return true
end

function find_minsum(size, lower, upper)
    minsum = size * upper
    minset = []
    for S in combinations(lower:upper, size)
        s = sum(S)
        if s < minsum && test_set(S)
            minsum = s
            minset = S
        end
    end

    return minset
end

res = find_minsum(7, 20, 50)
println(reduce(string, res))