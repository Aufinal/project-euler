using Combinatorics

function in_distinct(d1, d2, a, b)
    if b == 6 || b == 9
        in1 = 6 ∈ d1 || 9 ∈ d1
        in2 = 6 ∈ d2 || 9 ∈ d2
    else
        in1 = b ∈ d1
        in2 = b ∈ d2
    end
    return (a ∈ d1 && in2) || (a ∈ d2 && in1)
end

function test_die(d1, d2)
    return all(in_distinct(d1, d2, a, b) for (a, b) in [(0, 1), (0, 4), (0, 9), (1, 6), (2, 5), (3, 6), (4, 9), (8, 1)])
end

s = 0
for d1 in combinations(0:9, 6)
    for d2 in combinations(0:9, 6)
        if test_die(d1, d2)
            global s += 1
        end
    end
end

println(s / 2)