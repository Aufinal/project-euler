using Primes

function find_aux(k, cur_set, cur_num, cur_sum, excluded, contains, N)
    new_sum = cur_sum - 1 // cur_num^2
    new_set = union(cur_set, cur_num)
    res = []

    if cur_sum >= 0 && denominator(cur_sum) % k != 0
        res = [(cur_sum, cur_set)]
    end

    if cur_num > N
        return res
    end

    if cur_num ∈ contains
        return find_aux(k, new_set, cur_num + k, cur_sum, excluded, contains, N)
    end

    if any(d -> cur_num % d == 0, excluded)
        return find_aux(k, cur_set, cur_num + k, cur_sum, excluded, contains, N)
    end

    return vcat(find_aux(k, cur_set, cur_num + k, cur_sum, excluded, contains, N), find_aux(k, new_set, cur_num + k, new_sum, excluded, contains, N))
end


function find_eligible(k, cur_sum, contains, N)
    ps = primes(k + 1, N ÷ 2)

    return find_aux(k, BitSet(), 0, cur_sum, ps, contains, N)
end

function complete_sum(cur_sum, cur_set::BitSet, cur_prime, N)
    contains = filter(x -> x % cur_prime == 0, cur_set)
    eligible = find_eligible(cur_prime, cur_sum, contains, N)

    if cur_prime == 2
        return length(filter(x -> x[1] == 0, eligible))
    end

    return sum(complete_sum(s, union(cur_set, set), prevprime(cur_prime - 1), N) for (s, set) in eligible)
end

function find_sum(N)
    p = prevprime(N ÷ 3)
    return complete_sum(1 // 2, BitSet(), p, N)
end

println(find_sum(80))
