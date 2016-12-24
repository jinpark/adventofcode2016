local array2d = require 'pl.array2d'
local stringx = require 'pl.stringx'
local seq = require 'pl.seq'
local file = require 'pl.file'

local input = file.read('./input.txt')
local command_list = stringx.split(input, '\n')
command_list[#command_list] = nil

local display = array2d.new(6, 50, 0)

function print_array2d(arr)
    for i = 1, #arr do
        seq.printall(arr[i])
    end
end

function move_row (arr, row_num, value)
    local row = arr[row_num]
    local new_row = {}
    for i = 1, #row do
        local new_i = i + value
        if new_i > #row then
            new_i = new_i - #row
        end
        new_row[new_i] = row[i]
    end
    arr[row_num] = new_row
end

function move_col (arr, col_num, value)
    local col = array2d.column(arr, col_num)
    local new_col = {}
    for i = 1, #col do
        local new_i = i + value
        if new_i > #col then
            new_i = new_i - #col
        end
        new_col[new_i] = col[i]
    end
    for i = 1, #arr do
        arr[i][col_num] = new_col[i]
    end
end 

for i = 1, #command_list do 
    local command = command_list[i]
    if stringx.startswith(command, "rect") then
        local square = stringx.lstrip(command, "rect ")
        local coordinates = stringx.split(square, 'x')
        array2d.set(display, 1, 1, 1, tonumber(coordinates[2]), tonumber(coordinates[1]))
    elseif stringx.startswith(command, "rotate row") then
        local row_raw_string = stringx.lstrip(command, "rotate row y= ")
        local row_rotate_vals = stringx.split(row_raw_string, " by ")
        move_row(display, tonumber(row_rotate_vals[1] + 1), tonumber(row_rotate_vals[2]))
    elseif stringx.startswith(command, "rotate column") then
        local col_raw_string = stringx.lstrip(command, "rotate column x= ")
        local col_rotate_vals = stringx.split(col_raw_string, " by ")
        move_col(display, tonumber(col_rotate_vals[1] + 1), tonumber(col_rotate_vals[2]))
    end
end

local lights_on = 0
for val in array2d.iter(display) do
    lights_on = lights_on + val
end

print(lights_on)

-- print_array2d(display)
