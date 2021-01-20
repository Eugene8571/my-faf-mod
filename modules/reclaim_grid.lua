--[[

L размер клетки
N количество шагов по стороне

обследует квадрат со стороной L*N с центором в точке location

Возвращает таблицу координат центров клеток с количеством реклейма в них.
pos
mass
{pos={x,0,z}, mass=int}

]]

function mass_grid(L,N, location)
    -- if N % 2 ~= 0 then
    --     N = N + 1 
    -- end
    local x,y
    -- local pos = location
    local grid = {}
    local d_location = {0,0,0}
    d_location[1] = location[1] - L*N/2
    d_location[3] = location[3] - L*N/2
    local mass
    math.randomseed(os.time())
    for col=1,N do
        for row=1,N do
            pos = {0,0,0}
            mass = math.random(1,100)
            pos[1] = L*col - L/2 + d_location[1]
            pos[3] = L*row - L/2 + d_location[3]
            table.insert(grid, {pos, mass})
        end
    end
    return grid    
end


-- local example_grid = {
--     {5,0,5},
--     {5,0,15},
--     {15,0,5},
--     {15,0,15}
-- }
-- -- print(example_grid[1][1],example_grid[1][2],example_grid[1][3])
-- -- require 'pl.pretty'.dump(example_grid)

-- grid = mass_grid(10,4, {10,0,10})
-- -- require 'pl.pretty'.dump(grid)
-- for i=1,#grid do
--     print(grid[i][2])
-- end

