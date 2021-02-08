using Primes

plist = primes(7, nextprime(10^6))

function find_n(p, q)
    k = length(string(p))
    a = mod(- p * invmod(10^k, q), q)
    return a * 10^k + p
end

p = 5
s = 0
for q in plist
    global s += find_n(p, q)
    global p = q
end

println(s)