function pell_fermat(n)
    x = isqrt(n)
    y, z, r = x, 1, x << 1
    e1, e2 = 1, 0
    f1, f2 = 0, 1

    while true
        y = r * z - y
        z = div(n - y * y, z)
        r = div(x + y, z)

        e1, e2 = e2, e1 + e2 * r
        f1, f2 = f2, f1 + f2 * r

        a, b = f2 * x + e2, f2
        if a * a - n * b * b == 1
            return a, b
        end
    end
end

function generalized_pf(D, N)
    res = Array{Tuple{Int, Int}, 1}()
    t, _ = pell_fermat(D)

    if N > 0
        low = 0
        high = isqrt(N * (t - 1) ÷ (2 * D))
    else
        low = sqrt(abs(N) / D)
        high = sqrt(abs(N) * (t + 1) / (2 * D))
    end

    for y in ceil(Int, low):trunc(Int, high)
        x = isqrt(N + D * y * y)

        if x * x - D * y * y == N
            push!(res, (x, y))
            push!(res, x > sqrt(D) * y ? (x, -y) : (-x, y))
        end
    end

    return res
end