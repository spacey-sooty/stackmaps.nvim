local M = {}
local api = vim.api
local keymap = vim.keymap

-- functions we need:
-- vim.keymap.set()
-- vim.api.nvim_get_keymap()

local find_mapping = function(maps, lhs)
	-- pairs iterates over all keys in table order not guaranteed
	-- ipairs iterates over all numeric values in table order guaranteed
	for _, value in ipairs(maps) do
		if value.lhs == lhs
			return value
		end
	end

M.push = function(name, mode, mappings) 
	local maps = api.nvim_get_keymap(mode)

	find_mapping(maps, " pf")
end

-- temporarily create keybindings in normal mode with name debug_mode
-- M.push('debug_mode', 'n', {
-- 	["<leader>st"] = "echo 'Hello'",
-- 	["<leader>sz"] = "echo 'Lol'",
-- })

-- test
M.push('debug_mode', 'n', {
	[" pf"] = "echo 'Hello'",
 	[" sz"] = "echo 'Lol'",
})

M.pop = function(name)
end

-- reset debug mode keybinding
-- M.pop('debug_mode')

return M

