local script_path = debug.getinfo(1, "S").source:sub(2)
local script_dir = script_path:match("(.*/)")

local file = io.open(script_dir .. './input.txt', 'r')

if not file then
    error('File not found')
end

local matrix = {}

local content = file:read("l")
while content do
    local row = {}

    for cell in content:gmatch("%d+") do
        table.insert(row, tonumber(cell))
    end
    table.insert(matrix, row)
    content = file:read("l")
end
file:close()

local MAX_VECTOR_LENGTH = 4
local solution = 0

local function reassess_solution(boundaryCb, getItemCb)
    if boundaryCb() then
        local numbers, should_calculate = {}, true
        for idx = 0, MAX_VECTOR_LENGTH - 1 do
            local value = getItemCb(idx)
            if value == 0 then
                should_calculate = false
                break
            else
                table.insert(numbers, value)
            end
        end
        if should_calculate then
            local possible_solution = 1
            for _, number in pairs(numbers) do
                possible_solution = possible_solution * number
            end
            if possible_solution > solution then solution = possible_solution end
        end
    end
end

local row_length = #matrix + 1
local column_length = #matrix[1] + 1

for j = 1, column_length - 1 do
    for i = 1, row_length - 1 do
        -- horizontal
        reassess_solution(function()
            return j <= column_length - MAX_VECTOR_LENGTH
        end, function(idx)
            return matrix[i][j + idx]
        end)

        -- vertical
        reassess_solution(function()
            return i <= row_length - MAX_VECTOR_LENGTH
        end, function(idx)
            return matrix[i + idx][j]
        end)

        -- diagonal right
        reassess_solution(function()
            return i <= row_length - MAX_VECTOR_LENGTH and j <= column_length - MAX_VECTOR_LENGTH
        end, function(idx)
            return matrix[i + idx][j + idx]
        end)

        -- diagonal left
        reassess_solution(function()
            return i <= row_length - MAX_VECTOR_LENGTH and j >= MAX_VECTOR_LENGTH
        end, function(idx)
            return matrix[i + idx][j - idx]
        end)
    end
end

print(solution)
