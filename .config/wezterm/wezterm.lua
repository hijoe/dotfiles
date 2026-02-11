-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local projects = require("projects")

-- This is where you actually apply your config choices

config.font = wezterm.font("MesloLGS Nerd Font Mono", { weight = "Regular" })
config.font_size = 12

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 5,
	right = 5,
	top = 10,
	bottom = 10,
}

config.inactive_pane_hsb = {
	brightness = 0.9,
	saturation = 1.0,
	hue = 1.0,
}

config.hide_tab_bar_if_only_one_tab = true

-- Tab bar styling to match Gruvbox light theme
config.window_frame = {
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),
	font_size = 12.0,
	active_titlebar_bg = "#fbf1c7",
	inactive_titlebar_bg = "#fbf1c7",
}

config.colors = {
	tab_bar = {
		background = "#fbf1c7",
		active_tab = {
			bg_color = "#ebdbb2",
			fg_color = "#282828",
		},
		inactive_tab = {
			bg_color = "#f2e5bc",
			fg_color = "#665c54",
		},
		inactive_tab_hover = {
			bg_color = "#ebdbb2",
			fg_color = "#3c3836",
		},
		inactive_tab_edge = "#d5c4a1",
		inactive_tab_edge_hover = "#d5c4a1",
		new_tab = {
			bg_color = "#f2e5bc",
			fg_color = "#665c54",
		},
		new_tab_hover = {
			bg_color = "#ebdbb2",
			fg_color = "#282828",
		},
	},
}

config.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

config.keys = {
	{
		-- I'm used to tmux bindings, so am using the quotes (") key to
		-- split horizontally, and the percent (%) key to split vertically.
		key = '"',
		-- Note that instead of a key modifier mapped to a key on your keyboard
		-- like CTRL or ALT, we can use the LEADER modifier instead.
		-- This means that this binding will be invoked when you press the leader
		-- (CTRL + A), quickly followed by quotes (").
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Left", 15 }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Down", 15 }),
	},
	{ key = "k", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 15 }) },
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Right", 15 }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "p",
		mods = "LEADER",
		-- Present in to our project picker
		action = projects.choose_project(),
	},
	{
		key = "f",
		mods = "LEADER",
		-- Present a list of existing workspaces
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	{
		-- Rotate panes clockwise to rearrange layout
		key = "r",
		mods = "LEADER",
		action = wezterm.action.RotatePanes("Clockwise"),
	},
	{
		-- Rotate panes counter-clockwise to rearrange layout
		key = "R",
		mods = "LEADER",
		action = wezterm.action.RotatePanes("CounterClockwise"),
	},
}

config.color_scheme = "Gruvbox light, soft (base16)"

-- and finally, return the configuration to wezterm
return config
