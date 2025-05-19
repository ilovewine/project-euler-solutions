local script_path = debug.getinfo(1, "S").source:sub(2)
local script_dir = script_path:match("(.*/)")
local file = io.open(script_dir .. 'input.txt', 'r')

if not file then
    error('Could not open the file')
end

local content = file:read('*a'):gsub('%s', '')
file:close()

local pointer = 1
local max_value = 0

local function calculate_max_value(num_string)
    local numbers = {}
    for char in num_string:gmatch('%d') do
        local converted = tonumber(char)
        if not converted then error('This is not a numeric string!') end
        table.insert(numbers, converted)
    end

    local result = (function(acc)
        for _, number in pairs(numbers) do
            acc = acc * number
        end
        return acc
    end)(1)
    return result
end

while pointer < #content - 12 do
    local substring = content:sub(pointer, pointer + 12)
    if not substring:find('0') then
        local possible_val = calculate_max_value(substring)
        if max_value < possible_val then max_value = possible_val end
    end
    pointer = pointer + 1
end

print(max_value)
