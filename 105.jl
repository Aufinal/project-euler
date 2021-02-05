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

open("p105_sets.txt") do file
    res = 0
    for line in eachline(file)
        S = parse.(Int, split(line, ","))
        if test_set(sort(S))
            res += sum(S)
        end
    end

    println(res)
end