using Primes

N = 120000
const plist = primes(nextprime(isqrt(N) + 1))
const rad = ones(Int, N)

for n in 2:N
    for p in plist
        if p * p > n
            rad[n] = n
            break
        elseif n % p == 0
            k = n ÷ p
            if k % p == 0
                rad[n] = rad[k]
            else
                rad[n] = p * rad[k]
            end
            break
        end
    end
end

function find_hit(c, rad_c, a, rad_a, p)
    next_p = nextprime(p + 1)
    if c % p == 0
        return find_hit(c, rad_c, a, rad_a, next_p)
    end

    if rad_a * p > isqrt(c ÷ rad_c)
        return 0
    end
    res = 0
    res += find_hit(c, rad_c, a, rad_a, next_p)
    while a * p <= c
        a *= p
        if rad[a] < rad[c - a] && p * rad_a * rad_c * rad[c - a] < c
            res += 1
        end
        res += find_hit(c, rad_c, a, rad_a * p, next_p)
    end

    return res
end

# @time println(sum_hit(N))
s = 0
@time for c in 1:N
    k = rad[c]
    if k < c ÷ 6
        global s += c * find_hit(c, k, 1, 1, 2)
    end
    if k < c ÷ 2 && rad[c - 1] * k < c
        global s += c
    end
end


println(s)