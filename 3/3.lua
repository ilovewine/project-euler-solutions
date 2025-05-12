local number = 600851475143

local prime_factors = {}

for i = 2, math.sqrt(number) do
    if number % i == 0 then
        table.insert(prime_factors, i)
    end
    while number % i == 0 do
        number = number // i
    end
end

print(math.max(table.unpack(prime_factors)))
