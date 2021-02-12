include("pell-fermat.jl")

function nugget(target)
    t, u = pell_fermat(5)
    sols = generalized_pf(5, -4)
    l = Set{Int}()

    while length(l) < target
        for i in 1:length(sols)
            a, b = sols[i]
            a, b = t * a + 5 * u * b, u * a + t * b
            if a % 5 == 1
                push!(l, a)
            end
            sols[i] = (a, b)
        end
    end
    return div.(sort(collect(l)) .- 1, 5)[target]
end

println(nugget(15))