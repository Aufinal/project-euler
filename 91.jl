function n_right(bound)
    n = bound^2
    
    for x1 in 0:bound
        for y1 in 0:bound
            if x1 == 0 && y1 == 0
                continue
            end

            d = gcd(x1, y1)
            x = x1 ÷ d
            y = y1 ÷ d

            s = 1
            t = 1
            while (0 <= x1 + s * y <= bound) && (0 <= y1 - s * x <= bound)
                n += 1
                s += 1
            end
            while (0 <= x1 - t * y <= bound) && (0 <= y1 + t * x <= bound)
                n += 1
                t += 1
            end
        end
    end
    return(n)
end

println(n_right(50))