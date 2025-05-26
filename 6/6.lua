local square_sum = (function()
    local result = 0
    for i = 1, 100 do
        result = result + i
    end
    return result ^ 2
end)()

local sum_square = (function()
    local result = 0
    for i = 1, 100 do
        result = result + i ^ 2
    end
    return result
end)()

print(square_sum - sum_square)
