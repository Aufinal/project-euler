function get_max(k)
    i = 1
    while 9 * (1 + k * log10(i)) >= i
        i += 1
    end

    return i
end

l = []
@time for k in 2:9
    for n in Int(ceil(10^(1/k))):get_max(k)
        x = n^k
        if sum(digits(x)) == n
            append!(l, x)
        end
    end
end

println(sort(l)[30])