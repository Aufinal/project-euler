function parse_sudokus(filename)
    nlines = countlines(filename)
    n_sudokus = nlines ÷ 10
    sudokus = zeros(Int, n_sudokus, 9, 9)
    open(filename) do file
        lines = readlines(file)
        grids = [lines[i + 1:i + 9] for i in 1:10:length(lines)]

        for (i, grid) in enumerate(grids)
            for (j, line) in enumerate(grid)
                for (k, char) in enumerate(line)
                    sudokus[i, j, k] = parse(Int, char)
                end
            end
        end  
    end

    return sudokus
end

function next(x, y)
    if x == 9
        return (1, y + 1)
    else
        return (x + 1, y)
    end
end

function solve!(grid, (x, y))
    if y > 9
        return true
    end

    if grid[x, y] != 0
        return solve!(grid, next(x, y))
    end

    for digit in 1:9
        row_ok = all(grid[x1, y] != digit for x1 in 1:9)
        col_ok = all(grid[x, y1] != digit for y1 in 1:9)
        xs = (x - 1) ÷ 3
        ys = (y - 1) ÷ 3
        square_ok = all(grid[x1, y1] != digit for x1 in (3xs + 1):(3xs + 3) for y1 in (3ys + 1):(3ys + 3))
        if row_ok && col_ok && square_ok
            grid[x, y] = digit
            if solve!(grid, next(x, y))
                return true
            end
        end
    end

    grid[x, y] = 0

    return false
end

sudokus = parse_sudokus("p096_sudoku.txt")

for i in 1:50
    solve!((@view sudokus[i, :, :]), (1, 1))
end

println(sum(sudokus[i, 1, j] * 10^(3 - j) for j in 1:3 for i in 1:50))