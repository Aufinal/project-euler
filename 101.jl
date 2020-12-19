using Combinatorics

function binom(n, pad)
    if n == 0
        return vcat([1],  zeros(Rational{Int64}, pad - 1))
    else
        return [stirlings1(n, n + 1 - k, true) for k in 0:pad - 1] .// factorial(n)
    end
end

function fits(a)
    n = length(a)

    basis = fill(0, n)

    for i in 0:(n - 1)
        coeffs = binom(i, n)
        println(coeffs)
    end
end

fits([0, 0, 0, 1])