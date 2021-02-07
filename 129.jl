using Primes

function multorder(a, m)
    phi = totient(m)
    t = phi
    if gcd(a, m) != 1
        return 0
    end
    for (p, e) in factor(phi)
        t ÷= p^e
        b = powermod(a, t, m)
        while b != 1
            b = powermod(b, p, m)
            t *= p
        end
    end

    return t
end

function find_next(n)
    p = n + 1
    while true
        if p % 3 == 0
            q = p
            x = 9
            while q % 3 == 0
                q ÷= 3
                x *= 3
            end
            if lcm(multorder(10, x), multorder(10, q)) > n
                return p
            end
        end
        if multorder(10, p) > n
            return p
        end
        p += 2
    end
end

println(find_next(10^6))