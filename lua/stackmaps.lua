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
			existing_maps[lhs] = existing
		end
	end

	M._stack[name] = {
		mode = mode,
		existing = existing_maps,
		mappings = mappings,
		}

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

M.pop = function(name)
	local state = M._stack[name]
	M._stack[name] = nil

	for lhs, rhs in pairs(state.mappings) do
		if state.existing[lhs] then
			-- handle mappings that existed
			local og = state.existing[lhs]
			-- TODO: Handle options from the table
			vim.keymap.set(state.mode, lhs, og_mapping.rhs)
		else
			-- handle mappings that didnt existed
			vim.keymap.del(state.mode, lhs)
		end
	end
	
end

-- reset keybindings under debug mode 
-- M.pop('debug_mode')

return M

