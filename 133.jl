using Primes

function multorder(a, p)
    t = p - 1
    if gcd(a, p) != 1
        return 0
    end
    for (q, e) in factor(p - 1)
        t ÷= q^e
        b = powermod(a, t, p)
        while b != 1
            b = powermod(b, q, p)
            t *= q
        end
    end

    return t
end

plist = primes(7, 10^5)
s = 0

for p in plist
    o = multorder(10, p)
    while o % 2 == 0
        o ÷= 2
    end
    while o % 5 == 0
        o ÷= 5
    end
    if o != 1
        global s += p
    end
end
println(s + 10)