local get_prime_factors = require('../common/prime_factors')

local function generate_pythagorean_triple(m, n)
    if m <= 0 or n <= 0 then error('Wrong parameters') end
    return m ^ 2 - n ^ 2, 2 * m * n, m ^ 2 + n ^ 2
end

--[[
a + b + c = 1000
from Euclid's formula: (a = m^2 - n^2, b = 2mn, c = m^2 + n^2)
m^2 + n^2 + 2mn + m^2 - n^2 = 1000
(m + n)^2 + (m - n)(m + n) = 1000
(m + n)(m + n + m - n) = 1000
(m + n)2m = 1000
m^2 + mn - 500 = 0
n = (500 - m^2) / m
m and n in N_+

so 500 | m
so m must be a factor of 500
]] --

local factors_of_500 = (function()
    local result = { 1, 500 }
    local prime_factors = get_prime_factors(500)
    for prime, _ in pairs(prime_factors) do
        local i = prime
        repeat
            if 500 % i == 0 then table.insert(result, i) end
            i = i + prime
        until i >= 500
    end
    return result
end)()

local the_pythagorean_triple = (function()
    local k = 0
    local have_found_solution = false

    local a, b, c
    repeat
        k = k + 1
        local m = factors_of_500[k]
        local n = (500 - m ^ 2) / m
        if n > 0 then
            a, b, c = generate_pythagorean_triple(m, n)
            if a + b + c == 1000 and a > 0 and b > 0 and c > 0 then have_found_solution = true end
        end
    until have_found_solution
    return { a, b, c }
end)()

local solution = (function()
    local multiplier = 1
    for _, pythagorean_element in pairs(the_pythagorean_triple) do
        multiplier = multiplier * pythagorean_element
    end
    return multiplier
end)()

print(solution)
