api = vim.api

local remove_modules = function(modules) 
    for _, module in ipairs(modules) do
        package.loaded[module] = nil
    end
end

local require_modules = function(modules)
    for _, module in ipairs(modules) do
        require(module)
    end
end

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

local pack_location, packer_location, path_sep, is_windows, packer_gh
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

local function dirname(path)
    parts = vim.split(path, path_sep)
    parts[#parts]=nil
    return path_join(parts)
end

local function directory_exists(path)
	return vim.fn.isdirectory(path) == 1
end


if is_windows then
    pack_location = os.getenv('LOCALAPPDATA') .. '\\nvim-data\\site\\pack'
else
    pack_location = '~/.local/share/nvim/site/pack'
end
packer_location = path_join({pack_location, 'packer', 'start', 'packer.nvim'})

local function packer_exists()
    return directory_exists(packer_location)
end

packer_gh = 'https://github.com/wbthomason/packer.nvim'
local function install_packer()
    if not packer_exists() then
		os.execute('mkdir ' .. packer_location)
        local cmd='git clone ' .. packer_gh .. ' ' .. packer_location
        print('downloading packer ...')
        print(cmd)
        os.execute(cmd)
    end
end

return {
    nvim_create_augroups = nvim_create_augroups,
    install_packer = install_packer,
    remove_modules = remove_modules,
    require_modules = require_modules
}
