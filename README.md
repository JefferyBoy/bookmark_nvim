# Bookmark.nvim

Bookmark.nvim is a Neovim plugin that allows you to quickly jump to your bookmarked locations.

## Features

- Bookmark locations in a sidebar
- Group bookmarks together
- Add bookmarks with command
- Add bookmarks group with command
- Change nvim current workspace directory to group directory
- Persist bookmarks to file
- Sidebar features
  - Rename bookmark/group
  - Delete bookmark/group
  - Show information about bookmarks/groups
  - Move bookmarks/groups up/down

## Installation

Use your favorite plugin manager to install Bookmark.nvim. For example, 

with vim-plug:
```vim
Plug 'JefferyBoy/bookmark_nvim'
```
with lazy.nvim:
```lua
use {
	"JefferyBoy/bookmark_nvim",
	config = function()
		require("bookmark_nvim").setup()
	end,
}
```

## Usage

### Global commands

- `:BookmarkToggleSideBar` Toggles the Bookmark sidebar.
- `:BookmarkAddItem` Adds a new bookmark at the current cursor line.
- `:BookmarkAddGroup` Adds a new group of bookmarks.
- `:Telescope bookmarks` Telescope plugin to search and navigate bookmarks.

### Sidebar keymaps

- `<CR>` Focus group.
- `<CR>` Open the bookmark in a new tab.
- `d` Delete the bookmark/group.
- `r` Rename the bookmark/group.
- `i` Show information about the bookmark/group.
- `<C-Up>` Move the bookmark/group up.
- `<C-Down>` Move the bookmark/group down.

You can also custom the keymaps

```lua
-- default configs
local opts = {
	sidebar = {
		-- fix keymaps conflict with other plugins(global keymaps)
		fix_keymap_conflict = true,
		keymaps = {
			-- open bookmark
			bookmark_open = "<CR>",
			-- delete bookmark
			bookmark_delete = "d",
			-- show bookmark info
			bookmark_info = "i",
			-- rename bookmark
			bookmark_rename = "r",
			-- toggle wrap
			bookmark_toggle_wrap = "f",
			-- move bookmark up
			bookmark_move_up = "<C-Up>",
			-- move bookmark down
			bookmark_move_down = "<C-Down>",
			-- cursor and selected next group
			bookmark_group_next = "<Tab>",
			-- cursor and selected previous group
			bookmark_group_prev = "<S-Tab>",
		},
	},
}
require("bookmark_nvim").setup(opts)
```

## Example

SideBar

![Sidebar](https://fastly.jsdelivr.net/gh/JefferyBoy/pictures@master/2024/17257168729722024-09-07_21-25-54.png)

Telescope plugin

![Telescope](https://fastly.jsdelivr.net/gh/JefferyBoy/pictures@master/2024/17258844834162024-09-09_20-18-50.png)
