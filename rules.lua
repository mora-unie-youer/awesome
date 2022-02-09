-- Standard awesome library
local awful = require('awful')

awful.rules.rules = {
	{
		-- Rules for each client
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			floating = false,
			maximized = false,
			above = false,
			below = false,
			ontop = false,
			sticky = false,
			maximized_horizontal = false,
			maximized_vertical = false,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen
		}
	},
	{
		-- Titlebar rules
		rule_any = { type = { 'normal', 'dialog' } },
		properties = { titlebars_enabled = true }
	},
}
