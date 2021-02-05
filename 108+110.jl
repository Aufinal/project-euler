using Primes

function findmin(target, sigma, n, cur_max, cur_prime, cur_min)
    if sigma >= target
        println(cur_prime)
        return n
    end

    bound = (target ÷ sigma - 1) ÷ 2 + 1
    new_n = n
    res = cur_min
    for i in 1:min(cur_max, bound)
        new_n *= cur_prime
        if new_n > res
            return res
        end

        tentative = findmin(target, sigma * (2 * i + 1), new_n, i, nextprime(cur_prime + 1), res)
        res = min(tentative, res)
    end

    return res
end

function find_result(target)
    return findmin(2 * target - 1, 1, 1, 63, 2, typemax(Int))
end

println(find_result(1000))
println(find_result(4000000))