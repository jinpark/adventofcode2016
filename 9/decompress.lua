local stringx = require 'pl.stringx'
local seq = require 'pl.seq'
local file = require 'pl.file'

local raw_input = file.read('./input.txt')
-- local raw_input = 'ADVENTA(1x5)BC(3x3)XYZA(2x2)BCD(2x2)EFG(6x1)(1x3)AX(8x2)(3x3)ABCY'
local input = stringx.strip(raw_input)

-- put in string from (
function find_within_paren(str)
    for i = 1, #str do
        local char = str:sub(i, i)
        if char == ')' then
            local marker = str:sub(2, i - 1)
            local split_markers = stringx.split(marker, 'x')
            local rep_table =  {num_of_char = tonumber(split_markers[1]), repeat_val = tonumber(split_markers[2]), start_from = i }
            return rep_table
        end
    end 
end

local final_string = ''

local i = 1

repeat
    local char = input:sub(i, i)
    if char ~= '(' then
        final_string = final_string .. char 
        i = i + 1
    else
        local marker_table = find_within_paren(input:sub(i, #input))
        local repeat_chars = input:sub(i + marker_table['start_from'], i + marker_table['start_from'] + marker_table['num_of_char'] - 1)
        final_string = final_string .. string.rep(repeat_chars, marker_table['repeat_val'])
        i = i + marker_table['start_from'] + marker_table['num_of_char']
    end
until i > #input

-- print(final_string)
print(#final_string)
