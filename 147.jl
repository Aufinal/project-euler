function count_rectangles(a, b)
    straight = a * (a + 1) * b * (b + 1) ÷ 4
    oo = a * (a + 1) * (2 * a * b + b - a^2 - 2) ÷ 6
    oe = a * (a + 1) * (a - 1) * (2b - a) ÷ 3
    ee = a * (a - 1) * (2 * a * b - b - a^2 + 1) ÷ 6

    return straight + oo + oe + ee
end

println(sum(count_rectangles(min(a, b), max(a, b)) for a in 1:47 for b in 1:43))