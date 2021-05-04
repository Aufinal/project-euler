function count_d(i, n)
    res = 0

    for (k, d) in enumerate(digits(n))
        l = k - 1
        res += l == 0 ? 0 : l * d * 10^(l - 1)
        if d == i
            res += 1 + n % 10^l
        elseif d > i
            res += 10^l
        end
    end

    return res
end


function update_remainder(rem, d, i, k, n_equal)
    mult = k == 0 ? 1 : 10
    new = k * d + n_equal * d * mult
    
    if d > i
        new += mult
    end

    new = rem - new + d * mult

    return new ÷ mult
end

function solve(rem, d, i, k, n_equal, n_digits, current_number)
    current_number += d * 10^k
    if d == i
        n_equal -= 1
        if n_equal < 0
            return 0
    end
    end

    # println("Current state : $current_number, $k, $n_equal")

    new_rem = update_remainder(rem, d, i, k, n_equal)
    
    # println("Remainder : $new_rem")

    if k == n_digits - 1
        return (new_rem == 0 && n_equal == 0) ? current_number : 0
    end
    possible_digits = inv_10(k + 1, mod(new_rem, 10))

    if isempty(possible_digits)
        return 0
    end

    # println("Possible digits : $possible_digits")
    
    return sum(solve(new_rem, new_d, i, k + 1, n_equal, n_digits, current_number) for new_d in possible_digits)
end

            
function inv_10(k, m)
    # Solving k * x = m (mod 10)
    if k % 10 == 0
        if m == 0
            return 0:9
        else
            return []
        end
    end
    if k % 2 == 0
        if m % 2 == 0
            sol = (invmod(k ÷ 2, 5) * (m ÷ 2)) % 10
            return [sol, (sol + 5) % 10]
        else
            return []
        end

    elseif k == 5
        if m == 0
            return [0, 2, 4, 6, 8]
        elseif m == 5
            return [1, 3, 5, 7, 9]
        else
            return []
    end
else
        return [invmod(k, 10) * m % 10]
    end
    end

function find_all(d0, i, n_equal, n_digits)
    return solve(-n_equal, d0, i, 0, n_equal, n_digits, 0)
end

@time println(sum(find_all(i, j, k, 11) for i in 0:9 for j in 0:9 for k in 0:10))