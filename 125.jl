function sq_sum(a, k)
    return ((k + 1) * (2 * k^2 + 6 * k * a + k + 6 * a^2)) ÷ 6
end

function is_palin(n)
    s = string(n)
    return s == reverse(s)
end

n = 10^8
chosen = Set{Int}()
@time for x in 1:isqrt(n ÷ 2)
    bound = trunc(Int, cbrt(3 * n + x^3)) - x
    for k in 1:bound
        z = sq_sum(x, k)
        if is_palin(z) && z <= n
            push!(chosen, z)
        end
    end
end

println(sum(chosen))