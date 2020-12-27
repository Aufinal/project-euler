function sum_minsum(n, m)
    k = n ÷ 9
    l = n % 9   

    return (l * (l + 3) ÷ 2 + 6) * powermod(10, k, m) - (n + 6)
end

a = 0
b = 1
s = 0
m = 10^9 + 7
for _ in 2:90
    c = a
    global a = b
    global b += c
    global s = mod(s + sum_minsum(b, m), m)
end
println(s)