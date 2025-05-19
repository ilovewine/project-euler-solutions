--[[
    a != 0 and d != 0

    (100a + 10b + c) * (100d + 10e + f) =
    10000ad + 1000(ae + bd) + 100(af + be + cd) + 10(bf + ce) + cf

    100000x + 10000y + 1000z + 100z + 10y + x =
    100001x + 10010y + 1100z =
    11(9091x + 910y + 100z)

]] --

local function is_palindrome(number)
    local stringified_number = tostring(number);
    local length = #stringified_number
    if length % 2 ~= 0 then return false end
    for i = 1, length // 2, 1 do
        if string.sub(stringified_number, i, i) ~= string.sub(stringified_number, length - i + 1, length - i + 1) then return false end
    end
    return true
end


local divisible_factors = (function()
    local result = {}
    local i = 110

    while i < 999 do
        table.insert(result, i)
        i = i + 11
    end
    table.sort(result, function(a, b) return a > b end)
    return result
end)()

local divisible_numbers = (function()
    local result = {}
    local i = 100000

    repeat
        i = i + 1
    until i % 11 == 0

    while i < 999999 do
        if is_palindrome(i) then
            result[i] = true
        end
        i = i + 11
    end
    return result
end)()


for j = 999, 100, -1 do
    for _, i in pairs(divisible_factors) do
        if i * j > 900000 and divisible_numbers[i * j] then
            print(i * j)
            return
        end
    end
end
