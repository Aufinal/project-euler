function last_digits(N, k)
    ilog = trunc(Int, log(5, N))
    mod5 = 5^k

    n_zeros = sum(@. N ÷ 5^(1:ilog))
    result = invmod(powermod(2, n_zeros + k, mod5), mod5)

    precomputed = zeros(Int, mod5 + 1)

    fact = 1
    for i in 0:mod5
        if i % 5 != 0
            fact *= i
            fact %= mod5
        end
        precomputed[i + 1] = fact
    end

    for j in 0:ilog
        q, r = divrem(N ÷ 5^j, mod5)
        fac = powermod(precomputed[mod5 + 1], q, mod5) * precomputed[r + 1]
        result *= powermod(precomputed[mod5 + 1], q, mod5) * precomputed[r + 1]
        result %= mod5
    end

    return result * 2^k
end

println(last_digits(10^12, 5))