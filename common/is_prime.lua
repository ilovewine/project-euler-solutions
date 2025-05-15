return function(number)
    for i = 2, math.floor(math.sqrt(number)) do
        if number % i == 0 then return false end
    end
    return true
end
