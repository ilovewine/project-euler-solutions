local sequence_lengths = {}

local function sequence(n)
    if n % 2 == 0 then
        return n // 2
    else
        return 3 * n + 1
    end
end

local function sequence_length(n)
    local length = 0
    local sequenced = n
    repeat
        if sequence_lengths[sequenced] then
            length = length + sequence_lengths[sequenced]
            break
        end
        sequenced = sequence(sequenced)
        length = length + 1
    until sequenced == 1
    sequence_lengths[n] = length
    return n, length
end

local max_length = 0
local max_sequence_number = 0

for i = 2, 1000000 do
    local number, possible_max_length = sequence_length(i)
    if possible_max_length > max_length then
        max_length = possible_max_length
        max_sequence_number = number
    end
end

print(max_sequence_number)
