local M = {}
local api = vim.api
local keymap = vim.keymap

-- functions we need:
-- vim.keymap.set()
-- vim.api.nvim_get_keymap()

M.push = function(name, mappings) 
end

-- temporarily create debug mode keybinding to dm
-- M.push('debug_mode', {
-- 	mode: 
-- 	mapping:
-- 	value
-- })

M.pop = function(name)
end

-- reset debug mode keybinding
-- M.pop('debug_mode')

return M

