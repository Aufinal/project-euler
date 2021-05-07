Piece = Tuple{Tuple{Int,Int},Tuple{Int,Int}}

function check(lines, x, n_lines, piece)
    return all(1 ≤ x + i ≤ size(lines, 1) && j + 1 ≤ n_lines && lines[x + i, j + 1] == 0 
    for (i, j) in piece)
end

function place!(lines, x, piece)
    lines[x, 1] = 1
    for (i, j) in piece
        lines[x + i, j + 1] = 1
    end
end

function remove!(lines, x, piece)
    lines[x, 1] = 1
    for (i, j) in piece
        lines[x + i, j + 1] = 0
    end
end


function solve(m, n)
    m, n = min(m, n), max(m, n)

    memo = Dict{Tuple{Int,Int},Int}()
    memo[(0, 0)] = 1


    pieces::Array{Piece} = [
        ((0, 1), (0, 2)), # horizontal bar
        ((1, 0), (2, 0)), # vertical bar
        ((0, 1), (1, 0)), # upper left corner
        ((0, 1), (-1, 1)), # lower right corner
        ((1, 0), (1, 1)) , # lower left corner
        ((0, 1), (1, 1)) , # upper right corner
    ]

    function solve(n_lines, state)
        if haskey(memo, (n_lines, state))
            return memo[(n_lines, state)]
        end
        lines = reshape(digits(state, base=2, pad=6 * m), m, 6)

        x = findfirst(iszero, lines[:, 1])

        res = 0
        for piece in pieces
            if check(lines, x, n_lines, piece)
                new_lines = n_lines
                place!(lines, x, piece)
                y = 1
                while all(isequal(1), lines[:, y])
                    y += 1
                    new_lines -= 1
                end
                flattened = reshape(lines[:, y:y + 2], 3 * m)
                new_state = sum(d * 2^(k - 1) for (k, d) in enumerate(flattened))

                res += solve(new_lines, new_state)
                remove!(lines, x, piece)
            end
        end

        memo[(n_lines, state)] = res
        return res
    end

    return solve(n, 0)
end

@time println(solve(9, 12))