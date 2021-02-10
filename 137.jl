function nugget(target)
    a = 11
    b = 5

    c = 1
    d = 1

    e = 4
    f = 2

    l = [11]

    while length(l) < target
        a, b = 9a + 20b, 4a+9b
        c, d = 9c + 20d, 4c+9d
        e, f = 9*e+20f, 4*e+9f
        to_add = [a, c, e]
        append!(l, filter(x -> x % 5 == 1, to_add))
    end

    return div.(sort(l) .- 1, 5)[target]
end

println(nugget(15))