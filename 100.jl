top = 1e12
a = 3 + 2 * sqrt(2)
b = sqrt(2) - 1
c = 2 - sqrt(2)

m = 1
while true
    n = (ceil(b * a^m) + 1) / 4
    k = (ceil(c * a^m) + 4) / 8
    if n > top
        println(trunc(Int, k))
        break
    end
    global m += 1
end