local read_matrix = require('../common/read_matrix')

local numbers = read_matrix('./input.txt', "%d")

local sum_table = (function()
    local table = {}
    for i = 1, #numbers[1] do
        table[i] = 0
    end
    return table
end)()

for i = 1, #numbers do
    for j = 1, #numbers[i] do
        sum_table[j] = sum_table[j] + numbers[i][j]
    end
end

for i = #sum_table, 2, -1 do
    local remainder = sum_table[i] % 10
    local quotient = sum_table[i] // 10
    sum_table[i] = remainder
    sum_table[i - 1] = sum_table[i - 1] + quotient
end

local result = ''
local i = 1

repeat
    result = result .. sum_table[i]
    i = i + 1
until #result == 10

print(result)
