using Primes

function n_divs(n)
    res = 1
    for (p, mult) in factor(n)
        res *= mult + 1
    end

    return res
end

function n_sols(a, b, n)
    res = 0

    num = 2^(n - a) * 5^(n - b) * (2^a + 5^b)
    res += n_divs(num)

    if a > 0 && b > 0
        num = 2^(n - a) * 5^(n - b) * (1 + 2^a * 5^b)
        res += n_divs(num)
    end

    return res
end

function n_sols(n)
    return sum(n_sols(a, b, n) for a in 0:n for b in 0:n)
end

println(sum(n_sols, 1:9))