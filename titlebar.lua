-- Standard awesome library
local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local wibox = require('wibox')

-- Disabling tooltips for titlebar buttons
awful.titlebar.enable_tooltip = false

local function create_click_events(client)
	return gears.table.join(
		-- TODO: implement double click events
		-- Left click to move
		awful.button({}, 1, function()
			awful.mouse.client.move(client)
		end),
		-- Right click to resize
		awful.button({}, 3, function()
			awful.mouse.client.resize(client)
		end)
	)
end

local function create_vertical_bar(client, position, background, size)
	-- Creating titlebar
	awful.titlebar(
		client,
		{ position = position, bg = background, size = size }
	):setup({
		{
			-- At the top of bar we have close, minimize and maximize
			awful.titlebar.widget.closebutton(client),
			awful.titlebar.widget.minimizebutton(client),
			awful.titlebar.widget.maximizedbutton(client),
			-- Spacing
			spacing = 5,
			-- Vertical layout
			layout = wibox.layout.fixed.vertical
		},
		{
			-- Bar, which you can drag with left/right mouse button to move/resize
			buttons = create_click_events(client),
			-- Vertical layout with taking all free space
			layout = wibox.layout.flex.vertical
		},
		{
			-- At the bottom of bar we have ontop and sticky button
			awful.titlebar.widget.ontopbutton(client),
			awful.titlebar.widget.stickybutton(client),
			-- Spacing
			spacing = 5,
			-- Vertical layout
			layout = wibox.layout.fixed.vertical
		},
		-- Vertical align
		layout = wibox.layout.align.vertical
	})
end

client.connect_signal('request::titlebars', function(c)
	create_vertical_bar(
		c,
		beautiful.titlebar_position,
		beautiful.titlebar_bg,
		beautiful.titlebar_size
	)
end)
