function find_dir((x, y), (u, v))
    n1, n2 = -4x, -y
    normsq = 16x^2 + y^2

    sp = n1 * u + n2 * v

    return (u - 2 * sp * n1 / normsq, v - 2 * sp * n2 / normsq)
end

function find_intersect((x, y), (u, v))
    t = - (8 * u * x + 2 * v * y) / (4u^2 + v^2)
    return (x + t * u, y + t * v)
end

function bounce((x, y), (prec_x, prec_y))
    u, v = x - prec_x, y - prec_y

    return find_intersect((x, y), find_dir((x, y), (u, v)))
end

function bounce_until((x, y), (prec_x, prec_y), s)
    res = 0
    while !(abs(x) <= s && y >= 0)
        tmp_x, tmp_y = bounce((x, y), (prec_x, prec_y))
        prec_x, prec_y = x, y
        x, y = tmp_x, tmp_y
        println(x, y)
        res += 1
    end

    return res
end

println(bounce_until((1.4, -9.6), (0.0, 10.1), 0.01))