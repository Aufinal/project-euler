function cc_aux(score, n_darts, cur_mult, cur_min)
    if n_darts == 0 || score <= 0
        return 0
    end

    res = 0
    # Last double
    if score <= 40 && iseven(score)
        res += 1
    end

    # Bullseye
    if score == 50
        res += 1
    end

    for mult in cur_mult:3
        zmin = (mult == cur_mult) ? cur_min : 1
        zrange = collect(zmin:20)
        if mult != 3
            append!(zrange, 25)
        end
        for zone in zrange
            res += cc_aux(score - mult * zone, n_darts - 1, mult, zone)
        end
    end

    return res
end

function count_checkout(score)
    return cc_aux(score, 3, 1, 1)
end

println(sum(count_checkout.(1:99)))