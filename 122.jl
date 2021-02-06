n = 200
maxlength = 2 * trunc(Int, log2(n)) - 1
mins = zeros(Int, n)

function update_lists(lists, mins, n, k)
    res = Array{Array{Int,1},1}()
    template = zeros(Int, k + 1)
    for l in lists
        template[1:k] = l
        for i in l
            endpoint = l[end] + i
            if endpoint <= n
                if mins[endpoint] == 0
                    mins[endpoint] = k
                end
                if mins[endpoint] == k
                    template[end] = endpoint
                    push!(res, copy(template))
                end
            end
        end
    end

    return res
end

lists = [[1]]
for k in 1:maxlength
    global lists = update_lists(lists, mins, n, k)
end

println(sum(mins))