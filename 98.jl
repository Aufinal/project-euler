using Combinatorics

function get_squares(maxlength::Int)
    squares = fill(Int[], maxlength)
    prevsup = 0
    for i in 1:maxlength
        sup = isqrt(10^i - 1)
        squares[i] = (prevsup + 1:sup).^2
        prevsup = sup
    end

    return squares
end

function issquare(n::Int)
    a = isqrt(n)
    return a * a == n
end

function match(int::Int, word::String)
    subst = Dict{Char,Int}()
    taken = zeros(Int, 10)
    for (d, c) in zip(reverse(digits(int)), collect(word))
        if haskey(subst, c)
            if subst[c] == d
                continue
            else
                return nothing
            end
        else
            if taken[d + 1] != 0
                return nothing
            else
                subst[c] = d
                taken[d + 1] = 1
            end
        end
    end
    return subst
end

function substitute(word::String, subst::Dict{Char,Int})
    a = replace(collect(word), subst...)
    if a[1] == 0
        return nothing
    else
        return parse(Int, reduce(string, a))
    end
end

function test_pair(w1, w2, int_list)
    res = 0
    for int in int_list
        subst = match(int, w1)
        if !isnothing(subst)
            n = substitute(w2, subst)
            if !isnothing(n) && issquare(n)
                res = max(res, int, n)
            end
        end
    end

    return res
end

@time open("p098_words.txt") do file
    s = split(read(file, String), ",")
    s = strip.(s, '\"')

    d = Dict{String,Array{String,1}}()
    for word in s
        sword = string(sort(collect(word)))
        push!(get!(d, sword, Array{String,1}()), word)
    end
    anagrams = filter(a -> length(a) >= 2, collect(values(d)))

    res = 0
    len = 0
    squares = get_squares(max(length.(s)...))
    for words in anagrams
        k = length(words[1])
        if k < len
            continue
        end
        for (w1, w2) in combinations(words, 2)
            m = test_pair(w1, w2, squares[k])
            if m > res
                len = k
                res = m
            end
        end
    end

    println(res)
end    