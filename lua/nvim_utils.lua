api = vim.api

local function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup '..group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

local pack_location, packer_location, path_sep, is_windows, packer_git
is_windows = _G.jit.os == "Windows"
path_sep = isWindows and '\\' or '/'

local function path_join(parts)
    local first = true
    path = ''
    for _, part in pairs(parts) do
        if not first then
            path = path .. path_sep
        else
            first = false
        end
        path = path .. part
    end
    return path
end


if is_windows then
    pack_location = os.getenv('LOCALAPPDATA') .. '\\nvim-data\\site\\pack'
else
    pack_location = '~/.local/share/nvim/site/pack'
end
packer_location = path_join({pack_location, 'packer', 'start', 'packer.nvim'})

print(
    is_windows, path_sep, packer_location,
    pack_location,
    vim.fn.isdirectory(packer_location))

local function packer_exists()
    return vim.fn.isdirectory(packer_location) == 1
end

packer_git = 'https://github.com/wbthomason/packer.nvim'
local function install_packer()
    if not packer_exists() then
        local cmd='git clone ' .. packer_git .. ' ' .. packer_location
        print('downloading packer ...')
        print(cmd)
        os.execute(cmd)
    end
end

return {
    nvim_create_augroups = nvim_create_augroups,
    install_packer = install_packer
}
