function make_triangle(seq)
    n = isqrt(2 * length(seq))
    triangle = zeros(Int, n, n)
    i = 1
    for k in 1:n
        for l in 1:k
            triangle[k, l] = seq[i]
            i += 1
        end
    end

    return triangle
end

function min_triangle(tri)
    n = size(tri)[1]
    sums = zeros(Int, n, n, n)
    sums[:,:, 1] = tri

    for k in 2:n
        for i in 1:n - k + 1
            for j in 1:i
                sums[i, j, k] = tri[i, j] + sums[i + 1, j, k - 1] + sums[i + 1, j + 1, k - 1]
                if k > 2
                    sums[i, j, k] -= sums[i + 2, j + 1, k - 2]
                end
            end
        end
    end
    return minimum(sums)
end

function gen_data(n)
    t = 0
    a = 615949
    b = 797807
    m = 2^19
    s = zeros(Int, n)
    for k in 1:n
        t = (a * t + b) % (2m)
        s[k] = t - m
    end

    return s
end

data = make_triangle(gen_data(500500))
println(min_triangle(data))
