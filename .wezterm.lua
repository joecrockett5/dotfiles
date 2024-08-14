local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 23

-- further config here
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.color_scheme = "Catppuccin Frappe"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

return config
