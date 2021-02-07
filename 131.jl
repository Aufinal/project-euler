using Primes

N = 10^6
bound = isqrt(N ÷ 3)
hits = 0

for i in 1:bound
    p = 3 * i^2 + 3 * i + 1
    if p < N && isprime(p)
        global hits += 1
    end
end

println(hits)