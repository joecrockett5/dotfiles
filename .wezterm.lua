local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 15

config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"

config.color_scheme = "Catppuccin Frappe"

config.window_background_opacity = 0.9

return config
