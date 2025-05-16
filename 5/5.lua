local prime_factors = require('../common/prime_factors')

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
