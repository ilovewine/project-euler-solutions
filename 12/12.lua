local function get_number_of_divisors(n)
    local count = 1
    local temp = n

    local power = 0
    while temp % 2 == 0 do
        power = power + 1
        temp = temp / 2
    end
    count = count * (power + 1)

    local sqrt = math.sqrt(temp)
    for i = 3, sqrt, 2 do
        power = 0
        while temp % i == 0 do
            power = power + 1
            temp = temp / i
        end
        count = count * (power + 1)
    end

    if temp > 2 then
        count = count * 2
    end

    return count
end

local function find_triangle_number_with_divisors(target)
    local n = 1
    local triangle_number = 1

    while true do
        n = n + 1
        triangle_number = (n * (n + 1)) / 2

        local divisors = get_number_of_divisors(triangle_number)

        if divisors > target then
            return triangle_number
        end
    end
end

print(find_triangle_number_with_divisors(500))
