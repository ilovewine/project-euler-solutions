local function gcd(a, b)
    local numbers = { a, b }
    table.sort(numbers, function(x, y) return x > y end)
    local higher, lower = table.unpack(numbers)
    if lower == 0 then return higher end
    return gcd(lower, higher % lower)
end

return gcd
