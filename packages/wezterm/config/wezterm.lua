local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config.color_scheme = 'Banana Blueberry'
-- config.color_scheme = 'Blue Matrix'
-- config.color_scheme = 'Bright Lights'
config.color_scheme = 'carbonfox'
-- config.color_scheme = 'tokyonight_night'
-- config.color_scheme = 'One Dark (Gogh)'

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

config.font_dirs = { 'fonts' }
config.font_locator = 'ConfigDirsOnly'

config.font_size = 15
config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMonoNL Nerd Font Mono", weight = "DemiBold" },
  { family = "Symbols Nerd Font Mono" }
})

config.max_fps = 120

config.keys = {
  {
    key = 'r',
    mods = 'CTRL|CMD',
    action = wezterm.action.ReloadConfiguration,
  },
}

-- CTRL+CMD+(1-8) to move tab to that position
for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|CMD',
    action = wezterm.action.MoveTab(i - 1),
  })
end

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
