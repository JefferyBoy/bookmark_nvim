local plugin_path = debug.getinfo(1, "S").source:sub(2)
plugin_path = vim.fn.fnamemodify(plugin_path, ":h")
plugin_path = vim.fn.fnamemodify(plugin_path, ":h")
local modules = {}

--- 导入模块。加载luac文件，如果存在，则加载，否则加载lua文件
--- @param name string
--- @return any
REQUIRE_MODULE = function(name)
  local module = modules[name]
  if module then
    return module
  end
	local file_luac = plugin_path .. '/' .. string.gsub(name, "%.", "/") .. ".luac"
	local f = io.open(file_luac, "rb")
	if f then
	  -- 读取内容
	  local content = f:read("*a")
	  f:close()
	  if content ~= nil then
	  	local func, err = load(content, name)
	  	if func then
        module = func()
        modules[name] = module
	  		return module
	  	else
	  		print("load module from luac failed: " .. err)
	  	end
	  end
	end
	module = require(name)
  modules[name] = module
  return module
end
local t=REQUIRE_MODULE("bookmark_nvim/setup")
local e={}
e.setup=t.setup
return e
