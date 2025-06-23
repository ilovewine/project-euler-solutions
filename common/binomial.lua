local function binomial(n, k)
    if n < k then return 0 end
    if n == k or k == 0 then return 1 end
    local result = 1
    for i = 1, k do
        result = result * (n - k + i) / i
    end

    return math.floor(result)
end

return binomial
