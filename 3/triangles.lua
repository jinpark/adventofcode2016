local pl = require 'pl'

inputs = file.read('./input.txt')
valid_triangles = 0
triangle_list = stringx.split(inputs, '\n')

for key, triangle in ipairs(triangle_list) do 
    strip_triangle = stringx.strip(triangle)
    if string.len(strip_triangle) > 0 then 
        triangle_sides = stringx.split(strip_triangle)
        triangle_number_sides = {}
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
