-- telescope_bookmarks.lua
local telescope = require("telescope")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local bookmark = require("bookmark_nvim.bookmark")

local function bookmark_picker(opts)
	opts = opts or {}
	local items = {}
	local groups = bookmark.get_bookmark_items()
	for _, group in pairs(groups) do
		for _, item in pairs(group.subitems) do
			item.group_name = group.name
			table.insert(items, item)
		end
	end
	pickers
		.new(opts, {
			prompt_title = "Bookmarks",
			finder = finders.new_table({
				results = items,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.group_name .. ": " .. entry.line_str,
						ordinal = entry.line_str,
					}
				end,
			}),
			sorter = sorters.get_generic_fuzzy_sorter(),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					if selection then
						local file = selection.value.file
						local line = selection.value.line
						vim.api.nvim_command("tabnew " .. file)
						vim.api.nvim_win_set_cursor(0, { line, 0 })
					end
				end)
				return true
			end,
		})
		:find()
end

return telescope.register_extension({
	exports = {
		bookmarks = bookmark_picker,
	},
})
