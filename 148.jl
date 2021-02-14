function non_div(n)
    return prod(1 .+ digits(n - 1, base=7))
end

function sum_until(d, p)
    if length(d) == 1
        return (d[1] * (d[1] + 1)) ÷ 2
    else
        m = length(d) - 1
        k = d[end]
        s = (p * (p + 1)  ÷ 2)^m * k * (k + 1) ÷ 2
        return s + (k + 1) * sum_until(d[1:end - 1], p)
    end
end

println(sum_until(digits(10^9, base=7), 7))