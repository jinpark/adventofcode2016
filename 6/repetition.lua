local file = require 'pl.file'
local stringx = require 'pl.stringx'

local input = file.read('./input.txt')
local message_list = stringx.split(input, '\n')
message_list[#message_list] = nil

local common_message = {}

for i = 1, #message_list do
    local message = message_list[i]
    for j = 1, #message do
        local letter = message:sub(j, j)
        if common_message[j] then
            local changed = false
            for k = 1, #common_message[j] do
                local letter_table = common_message[j][k]
                if letter_table[1] == letter then
                    changed = true
                    common_message[j][k][2] = common_message[j][k][2] + 1
                end
            end
            if changed == false then 
                table.insert(common_message[j], {letter, 1})
            end
        else
            common_message[j] = {{letter, 1}}
        end
    end
end



for i = 1, #common_message do 
    local letter_table = common_message[i]
    function sort_by_value (a, b)
        return a[2] > b[2]
    end
    table.sort(letter_table, sort_by_value)
    print(letter_table[1][1])
end
