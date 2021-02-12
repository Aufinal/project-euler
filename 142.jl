function check_until(n)
    res = 10 * n^2
    for a in 1:n
        for b in 1:n
            if !isinteger(sqrt(a^2 + b^2))
                continue
            end
            for c in b:2:n
                if isinteger(sqrt(a^2 + c^2)) && isinteger(sqrt(a^2 + b^2 + c^2))
                    x = a^2 + (b^2 + c^2) ÷ 2
                    y = (b^2 + c^2) ÷ 2
                    z = (c^2 - b^2) ÷ 2
                    res = min(res, x + y + z)
                end
            end
        end
    end

    return res
end

println(check_until(10^3))