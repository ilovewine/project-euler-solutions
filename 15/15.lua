local binomial = require('../common/binomial');

--[[
    The solution is calculable by the following formula: x = {2n \choose n} = (2n)!/((n!)^2)
    where:
    - 2n is the length of a route
    - we choose n chunks of vertical routes from the 2n length
]] --

local function routes(grid_number)
    return binomial(2 * grid_number, grid_number)
end

print(routes(20))
