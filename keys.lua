local gears = require('gears')
local awful = require('awful')

local keys = {}

local function build_grabber(screen, options)
	-- Configuration of exit keybinding
	local exit = options.exit or { mod = { 'Control' }, key = 'g' }
	local exit_mod = exit.mod
	local exit_key = exit.key
	-- Creating keygrabber
	local grabber = awful.keygrabber({ stop_key = 'Escape' })
	-- Adding exit keybinding
	grabber:add_keybinding(
		exit_mod, exit_key,
		function() grabber:stop() end,
		{ description = 'Exit the map', group = options.name }
	)
	-- Adding specified keymappings
	for _, mapping in ipairs(options.map) do
		-- Checking if key binding is not another map (then it must have action)
		if mapping.action then
			-- We have an action. Just creating keybinding for it
			grabber:add_keybinding(
				mapping[1], mapping[2],
				function() grabber:stop() mapping.action() end,
				{ description = mapping[3], group = options.name }
			)
		elseif mapping.map then
			--  We have another map. We need to create new grabber, and make the same
			-- procedure for it
			local subgrabber = build_grabber(
				screen,
				gears.table.join(mapping, { exit = exit })
			)
			-- Adding keybinding to start subgrabber
			grabber:add_keybinding(
				mapping[1], mapping[2],
				function() grabber:stop() subgrabber:start() end,
				{ description = mapping[3], group = options.name }
			)
		end
	end

	return grabber
end

function keys.start()
	-- Getting grabber from screen
	local grabber = mouse.screen.keys
	-- Starting grabber
	grabber:start()
end

function keys.create(options)
	local trigger_mod = options[1] or { 'Control' }
	local trigger_key = options[2] or 't'

	-- Registering keys for each screen
	awful.screen.connect_for_each_screen(function(s)
		s.keys = build_grabber(screen, options)
	end)

	return awful.key(
		trigger_mod, trigger_key,
		function() keys.start() end,
		{ description = 'Start keymap', group = 'keys' }
	)
end

return keys
