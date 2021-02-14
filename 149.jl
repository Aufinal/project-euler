using LinearAlgebra

function kahane(v)
    cur_best = 0
    tot_best = 0
    for i in v
        cur_best = max(0, cur_best + i)
        tot_best = max(cur_best, tot_best)
    end
    return tot_best
end

function draw_vec(x, y)
    a = 100003
    b = 200003
    c = 300007

    n = 500000

    s = zeros(Int, x * y)
    for k in 1:55
        s[k] = (a - b * k + c * k^3) % (2 * n) - n
    end

    for k in 56:(x * y)
        s[k] = (s[k - 24] + s[k - 55] + 2n) % (2n) - n
    end
    return reshape(s, (x, y))
end

function find_maxsum(arr)
    res = 0
    n = size(arr)[1]
    rarr = reverse(arr, dims=2)
    for k in 1:n
        mline = kahane(arr[k, :])
        mcol = kahane(arr[:, k])
        mpdiag = kahane(diag(arr, k - 1))
        mndiag = kahane(diag(arr, -k + 1))
        mpadiag = kahane(diag(rarr, k - 1))
        mnadiag = kahane(diag(rarr, -k + 1))

        res = max(res, mline, mcol, mpdiag, mndiag, mpadiag, mnadiag)
    end

    return res
end

data = draw_vec(2000, 2000)
println(find_maxsum(data))
