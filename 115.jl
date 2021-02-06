function first_exceeds(m, n)
    a = ones(Int, m + 1)
    a[1] = 2
    i = m
    while a[1] < n
        x = 2 * a[1] - a[2] + a[end]
        a = circshift(a, 1)
        a[1] = x
        i += 1
    end
    return i
end

println(first_exceeds(50, 10^6))