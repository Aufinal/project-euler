function test_num(N)
    res = Set{Int}()
    for b in 1:trunc(Int, N^(1/4))
        for a in (b+1):trunc(Int, cbrt(N / b))
            for c in 1:isqrt(N ÷ (a^3 * b))
                x = b * c * (a^3 * c + b)
                if isinteger(sqrt(x))
                    push!(res, x)
                    break
                end
            end
        end
    end

    return sum(res)
end

function test_all(N)
    res = 0
    for n in 2:isqrt(N)
        if test_num(n^2)
            println(n^2)
            res += n^2
        end
    end

    return res
end

@time println(test_num(10^12))
