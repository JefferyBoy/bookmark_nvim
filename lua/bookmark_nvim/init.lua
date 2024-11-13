local cur_file = debug.getinfo(1, "S").source:sub(2)
local cur_dir = cur_file:match("(.*)[/\\]")
local lua_guard_file = cur_dir.. "/../lua_guard.dat"
local lua_guard_key = "MDjHddrAo0HQF4O5"
require("liblua_guard").setup(lua_guard_file, lua_guard_key)

local setup = require("bookmark_nvim/setup")
local M = {}
M.setup = setup.setup
return M
