using Primes

N = 10^9
target = 40
s = 0
p = 5
count = 0
while count < target
    if powermod(10, N, p) == 1
        global s += p
        global count += 1
    end
    global p = nextprime(p + 1)
end

println(s)