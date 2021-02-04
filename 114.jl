n = 50

l = zeros(Int, n+1)
l[1] = 1
l[2] = 1
l[3] = 1
l[4] = 2

for i in 5:n+1
    l[i] = 2 * l[i - 1] -l[i-2] + l[i-4]
end

println(l[end])