require "pl"

inputs = "R5, L2, L1, R1, R3, R3, L3, R3, R4, L2, R4, L4, R4, R3, L2, L1, L1, R2, R4, R4, L4, R3, L2, R1, L4, R1, R3, L5, L4, L5, R3, L3, L1, L1, R4, R2, R2, L1, L4, R191, R5, L2, R46, R3, L1, R74, L2, R2, R187, R3, R4, R1, L4, L4, L2, R4, L5, R4, R3, L2, L1, R3, R3, R3, R1, R1, L4, R4, R1, R5, R2, R1, R3, L4, L2, L2, R1, L3, R1, R3, L5, L3, R5, R3, R4, L1, R3, R2, R1, R2, L4, L1, L1, R3, L3, R4, L2, L4, L5, L5, L4, R2, R5, L4, R4, L2, R3, L4, L3, L5, R5, L4, L2, R3, R5, R5, L1, L4, R3, L1, R2, L5, L1, R4, L1, R5, R1, L4, L4, L4, R4, R3, L5, R1, L3, R4, R3, L2, L1, R1, R2, R2, R2, L1, L1, L2, L5, L3, L1"

commands = stringx.split(inputs, ", ")
current_location = {0,0}
directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}}
current_direction = 1 -- 1 is north, 2 is east, 3 is south, 4 is west


for key, command in ipairs(commands) do
    direction = string.sub(command, 1, 1)
    length = tonumber(string.sub(command, 2))
    if direction == 'R' then
        if current_direction == 4 then
            current_direction = 1
        else  
            current_direction = current_direction + 1
        end
    elseif direction == 'L' then
        if current_direction == 1 then
            current_direction = 4
        else  
            current_direction = current_direction - 1
        end
    end
    current_location[1] = current_location[1] + directions[current_direction][1] * length 
    current_location[2] = current_location[2] + directions[current_direction][2] * length
end

return math.abs(current_location[1]) + math.abs(current_location[2])
