using Primes

function find_max(a, b, c)
    if b >= 2
        return find_max(a, b - 2, c) + 3
    elseif a >= 1 && c >= 1
        return find_max(a - 1, b, c - 1) + 2
    elseif a >= 3
        return find_max(a - 3, b, c) + 2
    elseif a >= 1 && b >= 1
        return find_max(a - 1, b - 1, c) + 1
    else
        return 0
    end
end

function mdrs(n)
    factors = zeros(Int, 9)

    for (p, mult) in factor(n)
        factors[1 + (p - 1) % 9] += mult
    end
    return sum(i * k for (i, k) in enumerate(factors)) + find_max(factors[2], factors[3], factors[4])
end

println(sum(mdrs, 2:(10^6 - 1)))