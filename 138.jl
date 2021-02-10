function isosceles(target)
    a = 2
    b = 1

    l = []

    while length(l) < target
        a, b = 9a + 20b, 4a+9b
        if (a % 5 == 2) || (a % 5 == 3)
            push!(l, b)
        end
    end

    return sum(l)
end

println(isosceles(12))