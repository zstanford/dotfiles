local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Sonokai (Gogh)"

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 22

config.window_padding = {
	left = 1,
	right = 1,
	top = 1,
	bottom = 1,
}

config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.77
config.macos_window_background_blur = 10

return config
