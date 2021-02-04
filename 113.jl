function count_nonbouncy(n)
    return binomial(n+9, 9) + binomial(n+10, 10) - 10 * n - 2
end

println(count_nonbouncy(100))