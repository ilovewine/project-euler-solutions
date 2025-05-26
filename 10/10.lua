local function range(lower_limit, upper_limit)
    local result = {}
    for i = lower_limit, upper_limit do result[i] = i end
    return result
end

local function all_primes_below(upper_limit)
    local index = 2
    local numbers = range(index, upper_limit)
    local initial_length = #numbers

    repeat
        local value_from_numbers = numbers[index]
        local remove_continue = true
        if not value_from_numbers then remove_continue = false end
        if remove_continue then
            for i = value_from_numbers * 2, initial_length, value_from_numbers do
                numbers[i] = nil
            end
        end
        index = index + 1
    until index > math.sqrt(initial_length)
    local result = {}
    for prime, is_prime in pairs(numbers) do
        if is_prime then
            table.insert(result, prime)
        end
    end
    return result
end

local solution = (function()
    local result = 0
    for _, prime in pairs(all_primes_below(2000000)) do
        result = result + prime
    end
    return result
end)()

print(solution)
