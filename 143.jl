function find_torricelli(N)
    res = Set{Int}()
    for a in 1:isqrt(N)
        for b in (a + 1):(2a - 1)
            if gcd(a, b) == 1
                for k in 1:N ÷ (a^2)
                    p = k * (b^2 - a^2)
                    q = k * (2a * b - b^2)
                    for r in 1:(N - p - q)
                        if isinteger(sqrt(q^2 + q * r + r^2)) && isinteger(sqrt(p^2 + p * r + r^2))
                            push!(res, p + q + r)
                        end
                    end
                end
            end
        end
    end

    return res
end

@time println(sum(find_torricelli(120000)))