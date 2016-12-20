local stringx = require 'pl.stringx'
local file = require 'pl.file'
local utils = require 'pl.utils'

local ip_list = file.read('./input.txt')
ip_list = stringx.split(ip_list, '\n')
ip_list[#ip_list] = nil


local valid_ips = 0

function find_abba(str)
    local starting_var = 1
    repeat
        local abba_check = str:sub(starting_var, starting_var + 3)
        if abba_check:sub(1,1) == abba_check:sub(4,4) and abba_check:sub(2,2) == abba_check:sub(3,3) and abba_check:sub(1,1) ~= abba_check:sub(3,3) then
            return true
        end
        starting_var = starting_var + 1
    until starting_var + 2 == #str
    return false
end

function ip_checker(tab) 
    for i = 1, #tab do
        if i % 2 == 0 then
        -- even indicies are within square brackets
            if find_abba(tab[i]) then
                return false
            end
        end
    end
    for i = 1, #tab do
        if i % 2 ~= 0 then
            if find_abba(tab[i]) then
                return true
            end
        end
    end
    return false
end

for i = 1, #ip_list do
    local ip = ip_list[i]
    local split_ip = utils.split(ip, '%p')
    if ip_checker(split_ip) then
        valid_ips = valid_ips + 1
    end
end

print(valid_ips)





