local start_time = os.time()

local sum = 0

local all_multiplies = { [3] = true, [5] = true }

local i = 3

while i < 1000 do
    all_multiplies[i] = true
    i = i + 3
end

i = 5
while i < 1000 do
    all_multiplies[i] = true
    i = i + 5
end

for i, _ in pairs(all_multiplies) do
    sum = sum + i
end

print(sum)

local end_time = os.time()

print(os.difftime(end_time, start_time))
