-- Loading LuaRocks
pcall(require, 'luarocks.loader')

-- Standard awesome library
local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
-- Loading autofocus
require('awful.autofocus')
-- Loading theme
beautiful.init(require('theme'))
-- Loading titlebars
require('titlebar')
-- Loading window rules
require('rules')
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

local function set_wallpaper(s)
	-- Checking if wallpaper is set
	if beautiful.wallpaper then
		-- Checking if wallpaper is string
		if type(beautiful.wallpaper) == 'string' then
			-- Check if wallpaper is color/image
			if beautiful.wallpaper:sub(1, #'#') == '#' then
				-- Setting color wallpaper
				gears.wallpaper.set(beautiful.wallpaper)
			elseif beautiful.wallpaper:sub(1, #'/') == '/' then
				-- Setting image wallpaper
				gears.wallpaper.maximized(beautiful.wallpaper, s)
			end
		else
			-- Wallpaper is function
			beautiful.wallpaper(s)
		end
	end
end

-- Resetting wallpaper on screen's geometry changes
screen.connect_signal('property::geometry', set_wallpaper)

-- Loading screens
awful.screen.connect_for_each_screen(function(s)
	-- Setting wallpaper
	set_wallpaper(s)

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
