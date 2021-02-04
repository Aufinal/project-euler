n = 12000
min_sumprod = [2 * i for i in 1:n]

function fillmin!(s, p, m)
    if m >= 2 && m + p - s <= n
        min_sumprod[m + p - s] = min(min_sumprod[m+p-s], p)
    end
    for i in 2:(2 * n)÷p
        fillmin!(s + i, p * i, m + 1)
    end
end

@time fillmin!(0, 1, 0)

println(sum(Set(min_sumprod[2:end])))