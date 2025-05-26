local function read_matrix(rel_path, read_match)
    -- Get the path of the script that required this module
    local caller_info = debug.getinfo(2, "S")
    local caller_path = caller_info.source:sub(2) -- Remove the @ prefix
    local caller_dir = caller_path:match("(.*/)")

    -- Construct the absolute path to the input file
    local file_path = caller_dir .. rel_path

    local file = io.open(file_path, 'r')
    if not file then
        error('File not found: ' .. file_path)
    end

    local matrix = {}
    local content = file:read("l")
    while content do
        local row = {}
        for cell in content:gmatch(read_match) do
            table.insert(row, tonumber(cell))
        end
        table.insert(matrix, row)
        content = file:read("l")
    end
    file:close()

    return matrix
end

return read_matrix
