p(x) = 1 - x + x^2 - x^3 + x^4 - x^5 + x^6 - x^7 + x^8 - x^9 + x^10
q(x) = x^3

function fit(f::Function, n::Int)
    return sum((-1)^(n - k) * binomial(n, k) * k ÷ (n + 1 - k) * f(k) for k in 1:n)
end

println(sum(fit(p, n) for n in 1:10))
