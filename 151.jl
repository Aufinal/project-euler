function next(s, sum_s, i)
    t = copy(s)
    t[i] -= 1
    for k in (i + 1):5
        t[k] += 1
    end
    return t, sum_s + 4 - i
end

function compute_exp(s, sum_s)
    if s == [0, 0, 0, 0, 1]
        return 0
    end
    res = 0
    if sum_s == 1
        res += 1
    end
    for i in 1:5
        if s[i] != 0
            new_s, new_sum = next(s, sum_s, i)
            res += s[i] // sum_s * compute_exp(new_s, new_sum)
        end
    end

    return res
end

println(float(compute_exp([1, 0, 0, 0, 0], 1)))