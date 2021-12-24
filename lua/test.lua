local function make_leader_map(combo, desc)
    map = {}
    key = '<leader>'
    if vim.startswith(string.lower(combo), key) then
        parent_map = map
        for i = #key+1, #combo do
            current_map = {}
            parent_map[combo:sub(i, i)] = current_map
            parent_map = current_map
        end
        parent_map['name'] = desc
    end
    return map
end

-- local map = make_leader_map('<leader>ada', 'launch ada interpreter')
-- print(vim.inspect(map))



mytable = vim.tbl_deep_extend("force", mytable, {l = true})


print(vim.inspect(mytable))
