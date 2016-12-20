local stringx = require 'pl.stringx'
local file = require 'pl.file'


local inputs = file.read('./input.txt')
local room_list = stringx.split(inputs, '\n')
room_list[#room_list] = nil
local valid_sector_sum = 0

for i = 1, #room_list do 
    local room = room_list[i]

    local checksum = room:match("%[(%a+)%]")
    local sector = room:match("%d+")

    local no_dash = room:gsub('-', '')
    local no_number = no_dash:gsub('%d+', '')
    local only_string = no_number:gsub('%[(%a+)%]', '')

    local string_table = {}
    for i = 1, #only_string do 
        local letter = only_string:sub(i, i)
        local changed = false
        for key, letter_table in ipairs(string_table) do
            if letter_table[1] == letter then
                changed = true
                string_table[key][2] = letter_table[2] + 1
            end
        end
        if changed == false then 
            table.insert(string_table, {letter, 1})
        end
    end

    function multi_sort (a, b)
        if a[2] > b[2] then
            return true
        elseif a[2] < b[2] then
            return false
        elseif a[2] == b[2] then 
            if a[1] < b[1] then
                return true
            else
                return false
            end
        end
    end

    table.sort(string_table, multi_sort)

    local top5 = ""
    for i = 1, 5 do 
        top5 = top5 .. string_table[i][1]
    end
    if top5 == checksum then 
        valid_sector_sum = valid_sector_sum + tonumber(sector)
    end
end

print(valid_sector_sum)

