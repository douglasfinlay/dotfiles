local wezterm = require "wezterm"

local config = wezterm.config_builder()
local act = wezterm.action

local is_windows = wezterm.target_triple:find("windows") ~= nil
local is_macos = wezterm.target_triple:find("apple") ~= nil

-- Shell
if is_windows then
    config.default_prog = { "pwsh.exe", "-NoLogo" }
end

-- Appearance
config.color_scheme = "Solarized Dark (Gogh)"
config.font = wezterm.font("Iosevka Term")
config.font_size = is_windows and 13 or 15
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"

config.window_close_confirmation = "NeverPrompt"
config.use_fancy_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.audible_bell = "Disabled"
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.75 }
config.scrollback_lines = 10000

config.window_padding = {
    left = 4,
    right = 4,
    top = 4,
    bottom = 4,
}

config.visual_bell = {
    fade_in_duration_ms = 0,
    fade_out_duration_ms = 150,
    target = 'BackgroundColor',
}

if is_macos then
    config.window_background_opacity = 0.85
    config.macos_window_background_blur = 16
end

if is_windows then
    config.launch_menu = {
        { label = "PowerShell 7",       args = { "pwsh.exe",       "-NoLogo" } },
        { label = "Windows PowerShell", args = { "powershell.exe", "-NoLogo" } },
        { label = "Command Prompt",     args = { "cmd.exe" } },
        { label = "Git Bash",           args = { "C:\\Program Files\\Git\\bin\\bash.exe", "-l" } },
    }
elseif is_macos then
    config.launch_menu = {
        { label = "Zsh",  args = { "/bin/zsh",  "-l" } },
        { label = "Bash", args = { "/bin/bash", "-l" } },
    }
end

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
    { key = "h",  mods = "LEADER", action = act.ActivatePaneDirection "Left" },
    { key = "j",  mods = "LEADER", action = act.ActivatePaneDirection "Down" },
    { key = "k",  mods = "LEADER", action = act.ActivatePaneDirection "Up" },
    { key = "l",  mods = "LEADER", action = act.ActivatePaneDirection "Right" },

    { key = "\\", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "-",  mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "p",  mods = "LEADER", action = act.ShowLauncherArgs { flags = "FUZZY|LAUNCH_MENU_ITEMS" } },
    { key = "z",  mods = "LEADER", action = act.TogglePaneZoomState },
    { key = "f",  mods = "LEADER", action = act.ActivateKeyTable { name = "resize_font", one_shot = false } },
    { key = "r",  mods = "LEADER", action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },
}

config.key_tables = {
    resize_font = {
        { key = "k",      action = act.IncreaseFontSize },
        { key = "j",      action = act.DecreaseFontSize },
        { key = "r",      action = act.ResetFontSize },
        { key = "Escape", action = act.PopKeyTable },
    },
    resize_pane = {
        { key = "h",      action = act.AdjustPaneSize { "Left",  1  } },
        { key = "j",      action = act.AdjustPaneSize { "Down",  1  } },
        { key = "k",      action = act.AdjustPaneSize { "Up",    1  } },
        { key = "l",      action = act.AdjustPaneSize { "Right", 1  } },
        { key = "H",      action = act.AdjustPaneSize { "Left",  5 } },
        { key = "J",      action = act.AdjustPaneSize { "Down",  5 } },
        { key = "K",      action = act.AdjustPaneSize { "Up",    5 } },
        { key = "L",      action = act.AdjustPaneSize { "Right", 5 } },
        { key = "Escape", action = act.PopKeyTable },
    },
}

-- Status bar
local mode_labels = {
    resize_pane = "RESIZE PANE",
    resize_font = "RESIZE FONT",
}

wezterm.on("update-status", function(window)
    local name = window:active_key_table()
    window:set_right_status(name and wezterm.format {
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Olive" } },
        { Text = " === " .. (mode_labels[name] or name) .. " === " },
    } or "")
end)

-- Load local config
local local_config_path = wezterm.config_dir .. "/wezterm.local.lua"
local ok, apply = pcall(dofile, local_config_path)
if ok then apply(config) end

return config
