local M = {
	setup = function(encrypt_key)
		local cur_file = debug.getinfo(1, "S").source:sub(2)
    local cur_dir = cur_file:match("(.*)[/\\]")
		local lua_guard = require("liblua_guard")
		if encrypt_key == nil or #encrypt_key == 0 then
			encrypt_key = "MDjHddrAo0HQF4O5"
		end
		local success = lua_guard.init(cur_dir .. "/lua_guard.dat", encrypt_key)
		if not success then
			print("Failed to initialize lua_guard")
			return
		end
		table.insert(package.searchers or package.loaders, function(modname)
			local m = lua_guard.get_module(modname)
			local result = function()
				return m
			end
			if m == nil then
				return nil, result
			end
			return result
		end)
	end,
}

return M
