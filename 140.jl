include("pell-fermat.jl")

function nugget(target)
    t, u = pell_fermat(5)
    sols = generalized_pf(5, 44)
    println(sols)
    l = Set{Int}()

    stop = false
    while !stop
        for (i, (a, b)) in enumerate(sols)
            if a % 5 == 2 && a > 7
                push!(l, a)
                if length(l) > target
                    stop = true
                end
            end
            sols[i] = (t * a + 5 * u * b, t * b + u * a)
        end
    end
    l = div.(sort(collect(l)) .- 7, 5)
    return sum(l[1:target])
end

println(nugget(30))