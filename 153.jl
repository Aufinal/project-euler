function sum_divs(a, b, N)
    norm = a^2 + b^2
    d_max = N ÷ norm
    
    return a * sum(d * (N ÷ (norm * d)) for d in 1:d_max)
end

function sum_sum_divs(N)
    return sum(sum_divs(a, b, N) for a in 1:isqrt(N) for b in -isqrt(N-a^2):isqrt(N-a^2) if gcd(a, b) == 1)
end

println(sum_sum_divs(10^8))