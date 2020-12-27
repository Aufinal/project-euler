lphi = log((1 + sqrt(5)) / 2)

function ispandigi(str)
    return !contains(str, "0") && length(str) == 9 && allunique(str)
end

function firstfib(n)
    x = exp(n * lphi)
    if x < 1e9
        return ""
    end
    return string(x)[begin:begin + 8]
end

function testfib()
    a = 1
    b = 1
    i = 2
    m = 10^9
    while true
        i += 1
        c = a
        a = b
        b = (c + b) % m

        if ispandigi(string(b))
            str = string(fastfib(i))[begin:begin + 8]
            if ispandigi(str)
                println(i)
                break
            end
        end
    end
end

function fastfib(n)
    z = BigInt()
    ccall((:__gmpz_fib_ui, :libgmp), Cvoid, (Ref{BigInt}, Culong), z, n)
    return z
end

testfib()


