using Primes

function get_sum(n, k)
    x = k * (10^n - 1) ÷ 9
    s = 0
    for d in 0:9
        for a in 0:(n - 1)
            p = x + (d - k) * 10^a
            s += isprime(p) && p
        end
    end

    if s == 0
        for d in 0:9
            for e in 0:9
                for a in 0:(n - 1)
                    for b in 0:(a - 1)
                        if a == n - 1 && d == 0
                            continue
                        end
                        p = x + (d - k) * 10^a + (e - k) * 10^b
                        s += isprime(p) && p
                    end
                end
            end
        end
    end

    return s
end

function get_zero(n)
    s = 0
    for d in 1:9
        for e in 1:9
            for a in 0:n - 2
                p = 10^(n - 1) * d + 10^a * e
                s += isprime(p) && p
            end
        end
    end
    return s
end

println(sum(get_sum(10, d) for d in 1:9) + get_zero(10))
