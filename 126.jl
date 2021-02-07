function compute_layer(a, b, c, k)
    return 2 * (a * b + b * c + a * c) + 4 * (k - 1) * (a + b + c) + 4 * (k - 1) * (k - 2)
end

function next(a, b, c)
    if c > b
        return (a, b + 1, b + 1)
    elseif b > a
        return 
    end
end

function aux_ns!(results, a, b, c, k, limit)
    res = compute_layer(a, b, c, k)
    cont = true
    while cont
        if res <= limit
            results[res] += 1
            aux_ns!(results, a, b, c, k + 1, limit)
        elseif k > 1
            aux_ns!(results, a, b, c + 1, 1, limit)
        elseif c > b + 1
            aux_ns!(results, a, b + 1, b + 1, 1, limit)
        elseif b > a + 1
            aux_ns!(results, a + 1, a + 1, a + 1, 1, limit)
        else
            return
        end
    end
end

function fill_results(limit)
    results = zeros(Int, limit)
    a = 1
    b = 1
    c = 1
    k = 1
    cont = true
    while cont
        res = compute_layer(a, b, c, k)
        if res <= limit
            results[res] += 1
            k += 1
        elseif k > 1
            c += 1
            k = 1
        elseif c > b + 1
            b += 1
            c = b
            k = 1
        elseif b > a + 1
            a += 1
            b = a
            c = a
            k = 1
        else
            cont = false
        end
    end
    return results
end

results = fill_results(30000)

println(findfirst(isequal(1000), results))