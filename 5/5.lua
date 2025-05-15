local function is_prime(number)
    for i = 2, math.floor(math.sqrt(number)) do
        if number % i == 0 then return false end
    end
    return true
end

local function prime_factors(number)
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

local numbers = (function(res)
    for i = 2, 20 do res[i] = prime_factors(i) end
    return res
end)({})

local max_factors = (function()
    local result = {}
    for i = 2, #numbers do
        for prime, exponent in pairs(numbers[i]) do
            if result[prime] then
                if result[prime] < exponent then result[prime] = exponent end
            else
                result[prime] = exponent
            end
        end
    end
    return result
end)()

local lcm = (function()
    local result = 1
    for prime, exponent in pairs(max_factors) do
        result = result * prime ^ exponent
    end
    return math.floor(result)
end)()

print(lcm)
