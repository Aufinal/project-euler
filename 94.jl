s = 0

for m in 1:10
    a = 7 + 4 * sqrt(3)
    b = 2 - sqrt(3)
    n = trunc(Int, (ceil(a^m) + 1) ÷ 3)
    n2 = trunc(Int, (ceil(b * a^m) - 1) ÷ 3)
    if (3 * n + 1) <= 1000000000
        global s += (3 * n + 1)
    end

    if (3 * n2 - 1) <= 1000000000
        global s += (3 * n2 - 1)
    end
end

println(trunc(Int, s - 2))