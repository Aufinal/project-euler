function count_len(len, base)
    return (3 * base - 5) * (base - 1)^(len - 1) - (3 * base - 7) * (base - 2)^(len - 1) + (base - 3)^len
end

function count_all(max_len, base)
    return base^max_len - 1 - sum(count_len(len, base) for len in 1:max_len)
end

res = count_all(16, 16)

println(uppercase(string(res, base=16)))