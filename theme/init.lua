-- Standard awesome library
local gears = require('gears')
-- Filesystem variables
local theme_dir = gears.filesystem.get_configuration_dir() .. 'theme/'
local icon_path = theme_dir .. 'icons/'
-- Theme table
local theme = {}

theme.wallpaper = '~/.wallpaper.jpg'

-- Titlebar
theme.titlebar_bg       = '#FF00FF33'
theme.titlebar_position = 'left'
theme.titlebar_size     = 16
-- Titlebar buttons
theme.titlebar_close_button_normal              = icon_path .. 'close.svg'
theme.titlebar_close_button_normal_hover        = icon_path .. 'close.svg'
theme.titlebar_close_button_focus               = icon_path .. 'close.svg'
theme.titlebar_close_button_focus_hover         = icon_path .. 'close.svg'
theme.titlebar_minimize_button_normal           = icon_path .. 'minimize.svg'
theme.titlebar_minimize_button_normal_hover     = icon_path .. 'minimize.svg'
theme.titlebar_minimize_button_focus            = icon_path .. 'minimize.svg'
theme.titlebar_minimize_button_focus_hover      = icon_path .. 'minimize.svg'
theme.titlebar_maximized_button_normal_active   = icon_path .. 'maximized.svg'
theme.titlebar_maximized_button_normal_inactive = icon_path .. 'maximized.svg'
theme.titlebar_maximized_button_focus_active    = icon_path .. 'maximized.svg'
theme.titlebar_maximized_button_focus_inactive  = icon_path .. 'maximized.svg'
theme.titlebar_ontop_button_normal_active       = icon_path .. 'ontop.svg'
theme.titlebar_ontop_button_normal_inactive     = icon_path .. 'ontop.svg'
theme.titlebar_ontop_button_focus_active        = icon_path .. 'ontop.svg'
theme.titlebar_ontop_button_focus_inactive      = icon_path .. 'ontop.svg'
theme.titlebar_floating_button_normal_active    = icon_path .. 'floating.svg'
theme.titlebar_floating_button_normal_inactive  = icon_path .. 'floating.svg'
theme.titlebar_floating_button_focus_active     = icon_path .. 'floating.svg'
theme.titlebar_floating_button_focus_inactive   = icon_path .. 'floating.svg'
theme.titlebar_sticky_button_normal_active      = icon_path .. 'sticky.svg'
theme.titlebar_sticky_button_normal_inactive    = icon_path .. 'sticky.svg'
theme.titlebar_sticky_button_focus_active       = icon_path .. 'sticky.svg'
theme.titlebar_sticky_button_focus_inactive     = icon_path .. 'sticky.svg'

-- Returning theme
return theme
