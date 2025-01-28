const n = 1000000

divisors(n) = count(m -> iszero(n % m), 1:ceil(Int, sqrt(n))-1)
divs = divisors.(1:(n÷4))

res_173 = sum(divs)
res_174 = count(≤(10), divs)
println(res_173)
println(res_174)