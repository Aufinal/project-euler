using Primes

N = 150 * 10^6

function test(n)
    return (isprime(n + 1) && isprime(n + 3) && isprime(n + 7) && isprime(n + 9) 
        && isprime(n + 13) && !isprime(n + 19) && !isprime(n + 21) && isprime(n + 27))
end

function sum_until(N)
    res = 0
    for k in 0:(N ÷ 30)
        u = (30 * k + 10)^2
        v = (30 * k + 20)^2
        if test(u)
            res += 30k + 10
        end
        if test(v)
            res += 30k + 20
        end
    end

    return res
end

@time println(sum_until(150 * 10^6))

