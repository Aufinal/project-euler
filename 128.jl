using Primes;

function hexa(n)
    return 1 + n * (n - 1) * 3
end

n = 2
count = 0
tiles = [1, 2]
target = 2000
while length(tiles) < target
    if isprime(6 * n - 1)
        if isprime(6 * n + 1) && isprime(12 * n + 5)
            push!(tiles, hexa(n) + 1)
        end
        if isprime(6 * (n + 1) - 1) && isprime(12 * n - 7)
            push!(tiles, hexa(n + 1))
        end
    end
    global n += 1
end

println(tiles[target])