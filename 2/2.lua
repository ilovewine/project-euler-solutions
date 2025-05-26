local fibonnaci_values = { 1, 2 }

local i = 2

while fibonnaci_values[i] < 4000000 do
    fibonnaci_values[i + 1] = fibonnaci_values[i] + fibonnaci_values[i - 1]
    i = i + 1
end

local sum = 0

for _, v in pairs(fibonnaci_values) do
    if v % 2 == 0 then
        sum = sum + v
    end
end

print(sum)
