# This problem is bruteforceable in ~300s

# function is_rev(i)
#     d = digits(i)
#     n = length(d)
#     if d[1] == 0  || d[n] == 0
#         return false
#     end
#     r = 0
#     for j in 1:n
#         if (d[j] + d[n+1-j] + r) % 2 != 1
#             return false
#         end
#         r = (d[j] + d[n+1-j]) ÷ 10
#     end
#     return true
# end


function count_reversible(n)
    # Count pairs of digits satisfying the specified conditions:
    # zero/nonzero, sum even/odd, sum above/below 10
    oa = 20
    ob = 30
    nzob = 20
    eb = 25

    or = zeros(Int, n+1)
    nzo = zeros(Int, n + 1)
    o = zeros(Int, n+1)
    e = zeros(Int, n+1)
    o[1] = 1
    e[2] = 5
    for i in 3:(n+1)
        o[i] = ob * o[i - 2]
        or[i] = oa * e[i - 2]
        e[i] = eb * or[i - 2]
        nzo[i] = nzob * o[i-2] + oa * e[i-2]
    end
    println("$o $or $e $nzo")
    return sum(nzo)
end

@time println(count_reversible(9))
