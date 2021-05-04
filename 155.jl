function find_capacities(N::Int)
    caps_ar = Array{Set{Rational},1}()
    push!(caps_ar, Set([1]))

    for n in 2:N
        caps = Set()
        for k in 1:n ÷ 2
            for c1 in caps_ar[k]
                for c2 in caps_ar[n - k]
                    union!(caps, [c1 + c2, (c1 * c2) / (c1 + c2)])
                end
            end
        end
        push!(caps_ar, caps)
    end

    return union(caps_ar...)
end      

@time println(length(find_capacities(18)))