using Primes

count = 0
target = 25
hits = Array{Int,1}()
n = 4
while length(hits) < target
    if n % 3 != 0 && powermod(10, n - 1, n) == 1 && !isprime(n)
        push!(hits, n)
    end
    if n % 3 == 0
        x = 9
        q = n
        while q % 3 == 0
            x *= 3
            q ÷= 3
        end
        if powermod(10, n - 1, x) == 1 && powermod(10, n - 1, q) == 1
            push!(hits, n)
        end
    end
    global n += 1
end

println(sum(hits))