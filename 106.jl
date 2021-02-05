using Combinatorics

function needs_test(s)
    prev = 0
    p1 = 0
    p2 = 0
    b12 = false
    b21 = false
    for i in s
        p1 += 1
        p2 += (i - prev - 1)
        prev = i
        if p1 > p2
            b12 = true
        else
            b21 = true
        end
    end

    return b12 && b21
end

function n_tests(n)
    res = sum(needs_test(s) for s in combinations(1:2n, n))
    return res
end

function tot_tests(n)
    return sum(n_tests(k) * binomial(n, 2 * k) for k in 1:n ÷ 2)
end

println(tot_tests(12) ÷ 2)