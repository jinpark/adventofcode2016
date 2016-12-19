local pl = require 'pl'

local inputs = file.read('./input.txt')
local valid_triangles = 0
local triangle_list = stringx.split(inputs, '\n')

for key, triangle in ipairs(triangle_list) do 
    local strip_triangle = stringx.strip(triangle)
    if string.len(strip_triangle) > 0 then 
        local triangle_sides = stringx.split(strip_triangle)
        local triangle_number_sides = {}
        for i = 1, #triangle_sides do 
            local side = triangle_sides[i]
            triangle_number_sides[i] = tonumber(side)
        end
        table.sort(triangle_number_sides)
        if triangle_number_sides[1] + triangle_number_sides[2] > triangle_number_sides[3] then
            valid_triangles = valid_triangles + 1
        end
    end
end

return valid_triangles
