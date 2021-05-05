function count_strings(k)
    return binomial(26, k) * (2^k - k - 1)
end

println(maximum(count_strings, 1:26))