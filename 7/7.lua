local primes = { 2, 3 }

local function find_nth_prime(index)
    local i = 5
    while #primes < index do
        local should_save_as_prime = true
        for _, prime in pairs(primes) do
            if i % prime == 0 then
                should_save_as_prime = false
                break
            end
        end
        if should_save_as_prime then table.insert(primes, i) end
        i = i + 2
    end
    return primes[index]
end

print(find_nth_prime(10001))
