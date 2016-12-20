local md5 = require 'md5'

local input = 'ojvtpuvg'
local current_int = 0
local password = ''

repeat
    local new_input = input .. current_int
    local md5string = md5.sumhexa(new_input)
    if md5string:sub(1, 5) == '00000' then
        password = password .. md5string:sub(6,6)
    end
    current_int = current_int + 1
until password:len() == 8

print(password)
