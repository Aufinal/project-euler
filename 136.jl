using Primes

function n_hits(N)
    res = 2
    for p in 3:4:N
        if isprime(p)
            res += 1
        end
    end
    for k in 1:2:div(N, 4)
        if isprime(k)
            res += 1
            if 16 * k <= N
                res += 1
            end
        end
    end

    return res
end

println(n_hits(50 * 10^6))