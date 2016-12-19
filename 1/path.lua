require "pl"

first = "cpy 41 a"
register = {a = nil, b = nil, c = nil, d = nil}
command = stringx.split(first, " ")

if command[0] == 'cpy' then
    if register[command[1]] ~= nil then
        register[command[2]] = register[command[1]]
    else
        register[command[2]] = command[1]
    end
elseif command[0] == 'inc' then

elseif command[0] == 'dec' then

elseif command[0] == 'jnz' then

