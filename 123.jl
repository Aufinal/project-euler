using Primes

primelist = primes(3 * 10^5)

b = false
for (n, p) in enumerate(primelist)
    if 2 * n * p > 10^10 && isodd(n) && !b
        println("$n $p")
        global b = true
    end
end