local M = {}
local api = vim.api
local keymap = vim.keymap

-- functions we need:
-- vim.keymap.set()
-- vim.api.nvim_get_keymap()

M.push = function(name, mappings) 
end

-- temporarily create debug mode keybinding in normal mode
-- M.push('debug_mode', 'n', {
-- 	["<leader>st"] = "echo 'Hello'",
-- 	["<leader>sz"] = "echo 'Lol'",
-- })

M.pop = function(name)
end

-- reset debug mode keybinding
-- M.pop('debug_mode')

return M

