local M = {}
local api = vim.api
vim.g.which_key_maps = {}

M.update_which_key_maps = function(maps)
    vim.g.which_key_maps = vim.tbl_deep_extend("force", vim.g.which_key_maps, maps)
end

M.get_which_key_maps = function()
    return vim.g.which_key_maps
end

local function make_leader_map(combo, desc)
    local keymap = {}
    local key = "<leader>"
    if vim.startswith(string.lower(combo), key) then
        local parent_map = keymap
        for i = #key + 1, #combo do
            local current_map = {}
            parent_map[combo:sub(i, i)] = current_map
            parent_map = current_map
        end
        table.insert(parent_map, desc)
    end
    return keymap
end

M.keymap = function(mode, lhs, rhs, ...)
    local opts = (...)
    local desc = opts["desc"]
    opts["desc"] = nil
    api.nvim_set_keymap(mode, lhs, rhs, opts)
    if desc ~= nil and vim.startswith(lhs, "<leader>") then
        local map = make_leader_map(lhs, desc)
        M.update_which_key_maps(map)
    end
end

-- M functions

M.remove_modules = function(modules)
    for _, mod in ipairs(modules) do
        package.loaded[mod] = nil
    end
end

M.require_modules = function(modules)
    for _, mod in ipairs(modules) do
        require(mod)
    end
end

M.install_modules = function(modules, use)
    for _, mod in ipairs(modules) do
        local install = require(mod).install
        if type(install) == "function" then
            install(use)
        end
    end
end

M.configure_modules = function(modules)
    for _, mod in ipairs(modules) do
        local configure = require(mod).configure
        if type(configure) == "function" then
            configure()
        end
    end
end

M.nvim_create_augroups = function(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command("augroup " .. group_name)
        api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
            api.nvim_command(command)
        end
        api.nvim_command("augroup END")
    end
end

local is_windows = _G.jit.os == "Windows"
local path_sep = is_windows and "\\" or "/"

local function path_join(parts)
    local first = true
    local path = ""
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
    local parts = vim.split(path, path_sep)
    parts[#parts] = nil
    return path_join(parts)
end

local function directory_exists(path)
    return vim.fn.isdirectory(path) == 1
end

local pack_location
if is_windows then
    pack_location = os.getenv("LOCALAPPDATA") .. "\\nvim-data\\site\\pack"
else
    pack_location = vim.fn.expand("~/.local/share/nvim/site/pack")
end
local packer_location = path_join({pack_location, "packer", "start", "packer.nvim"})

local function packer_exists()
    return directory_exists(packer_location)
end

local packer_gh = "https://github.com/wbthomason/packer.nvim"
M.install_packer = function()
    if not packer_exists() then
        os.execute("mkdir " .. packer_location)
        local cmd = "git clone " .. packer_gh .. " " .. packer_location
        print("downloading packer ...")
        print(cmd)
        os.execute(cmd)
    end
end

return M
