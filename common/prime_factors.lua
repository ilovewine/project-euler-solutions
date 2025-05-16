local script_path = debug.getinfo(1, "S").source:sub(2)
local script_dir = script_path:match("(.*/)")
local is_prime = require(script_dir .. './is_prime')

return function(number)
    if is_prime(number) then return { [number] = 1 } end
    local result = {}
    local division_remainder = number
    for i = 2, number // 2 do
        if is_prime(i) and division_remainder % i == 0 then
            while division_remainder % i == 0 do
                if result[i] then
                    result[i] = result[i] + 1
                else
                    result[i] = 1
                end
                division_remainder = division_remainder // i
            end
        end
    end
    return result
end
