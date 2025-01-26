using Combinatorics

const perms = permutations("9876543210")
num(l) = parse(Int, string(l...))
pandigital(x, y, z) = length(string(x, y, z)) == 10 && Set(string(x, y, z)) == Set("0123456789")

function try_split(perm)
    for idx in 2:8
        perm[idx+1] == '0' && continue
        n1, n2 = num(perm[begin:idx]), num(perm[idx+1:end])
        for factor in 3:3:gcd(n1, n2)
            if (n1 % factor == 0) && (n2 % factor == 0) && pandigital(factor, n1 ÷ factor, n2 ÷ factor)
                println(factor, " ", n1 ÷ factor, " ", n2 ÷ factor, " ", n1, " ", n2)
                return true
            end
        end
    end
    return false
end

for perm in perms
    if try_split(perm)
        println(num(perm))
        break
    end
end
