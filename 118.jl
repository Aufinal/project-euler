using Primes

function n_completions(digits, cur_max, cur_num)
    if isempty(digits) && cur_num == 0
        return 1
    end

    res = 0
    if isprime(cur_num) && cur_num > cur_max
        res += n_completions(digits, cur_num, 0)
    end
    for digit in digits
        res += n_completions(setdiff(digits, digit), cur_max, 10 * cur_num + digit)
    end

    return res
end

println(n_completions(1:9, 0, 0))