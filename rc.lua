-- Loading LuaRocks
pcall(require, 'luarocks.loader')

-- Standard awesome library
local gears = require('gears')
local awful = require('awful')
-- Loading autofocus
require('awful.autofocus')
-- Keybindings module
local keys = require('keys')

-- Default terminal and editor
terminal		= os.getenv('TERMINAL') or 'st'
editor			= os.getenv('EDITOR') or 'nano'
editor_cmd	= ('%s -e %s'):format(terminal, editor)

-- Default modkey
modkey = 'Mod4' -- For now... In future shouldn't be used at all

-- Table of layouts
awful.layout.layouts = {
	awful.layout.suit.floating,
}

-- Loading screens
awful.screen.connect_for_each_screen(function(s)
	awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, s, awful.layout.layouts[1])
end)

-- Setting up keybindings
local keybindings = {
	-- Root keymap
	{ 'Control' }, 't',
	name = 'Root',
	trigger = true,
	map = {
		{ {}, 'c', 'Terminal', action = function() awful.spawn(terminal) end },
		{
			-- First submap
			{ 'Control'}, 'r',
			name = 'First submap',
			map = {
				{
					-- Second submap
					{}, 'w',
					name = 'Second submap',
					map = {
						{ {}, 'k', 'Terminal', action = function() awful.spawn(terminal) end },
					}
				},
			},
		}
	},
}
-- Global keybindings
globalkeys = gears.table.join(
	-- awful.key({ 'Control' }, 'Return', function() awful.spawn(terminal) end),
	keys.create(keybindings)
)
-- Setting keys
root.keys(globalkeys)
