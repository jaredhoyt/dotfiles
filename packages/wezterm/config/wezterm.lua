local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config.color_scheme = 'Banana Blueberry'
-- config.color_scheme = 'Blue Matrix'
config.color_scheme = 'Bright Lights'
-- config.color_scheme = 'carbonfox'
-- config.color_scheme = 'tokyonight_night'

config.colors = {
  cursor_border = '#c7c7c7',
  cursor_bg = '#c7c7c7',
  cursor_fg = 'white',
}

config.enable_tab_bar = false

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 500

config.font_size = 15
config.font = wezterm.font_with_fallback({
    { family = "JetBrains Mono", weight = "DemiBold" },
    { family = "Symbols Nerd Font Mono", scale = 0.60 },
})

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.keys = {
  {
    key = 'r',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ReloadConfiguration,
  },
}

return config
