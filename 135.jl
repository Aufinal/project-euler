function test_sol(n)
    res = 0
    if n % 4 == 3
        for b in 1:2:isqrt(3 * n - 1)
            if n % b == 0
                res += 1
                if res > 10
                    return false
                end
            end
        end
    elseif n % 4 == 0
        for b in 2:2:isqrt(3 * n - 1)
            if n % b == 0 &&  (b + div(n, b)) % 4 == 0
                res += 1
                if res > 10
                    return false
                end
            end
        end
    end
    return res == 10
end

N = 10^6
s = 0
for i in 3:N
    if test_sol(i)
        global s += 1
    end
end

println(s)