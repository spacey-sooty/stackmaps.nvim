local M = {}

-- functions we need:
-- vim.keymap.set()
-- vim.api.nvim_get_keymap()

local find_mappings = function(maps, lhs)
	-- pairs iterates over all keys in table order not guaranteed
	-- ipairs iterates over all numeric values in table order guaranteed
	for _, value in ipairs(maps) do
		if value.lhs == lhs then 
			return value
		end
	end
end

M._stack = {}

M.push = function(name, mode, mappings) 
	local maps = vim.api.nvim_get_keymap(mode)

	local existing_maps = {}
	for lhs, rhs in pairs(mappings) do
		local existing = find_mappings(maps, lhs)

		if existing then
			table.insert(existing_maps, existing)
		end
	end

	M._stack[name] = existing_maps

	for lhs, rhs in pairs(mappings) do
		-- todo: need some way to pass options
		vim.keymap.set(mode, lhs, rhs)
	end
end

-- temporarily create keybindings in normal mode with name debug_mode
-- M.push('debug_mode', 'n', {
-- 	["<leader>pf"] = "echo 'Hello'",
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

