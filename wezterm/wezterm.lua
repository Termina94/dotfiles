local wezterm = require 'wezterm';

return {
  
  -- Window

  window_decorations = "NONE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  -- Status Bar
  
  use_fancy_tab_bar=true,
  tab_bar_at_bottom=false,
  hide_tab_bar_if_only_one_tab=true,
  -- enable_tab_bar=false,

  -- Theme
  
  -- window_background_opacity = 0.97,
  -- color_scheme = "Darkside",
  font = wezterm.font("JetBrains Mono"),
  
  colors = {
    background = "#1e1e1e"
  },

  -- Keybindings
  
  keys = {
    { key = "LeftArrow", mods = "CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
    { key = "DownArrow", mods = "CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
    { key = "UpArrow", mods = "CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
    { key = "RightArrow", mods = "CTRL|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
    
    { key = "LeftArrow", mods = "CTRL", action=wezterm.action{ActivatePaneDirection = "Left"}},
    { key = "RightArrow", mods = "CTRL", action=wezterm.action{ActivatePaneDirection = "Right"}},
    { key = "UpArrow", mods = "CTRL", action=wezterm.action{ActivatePaneDirection = "Up"}},
    { key = "DownArrow", mods = "CTRL", action=wezterm.action{ActivatePaneDirection = "Down"}},

    {key = "\\", mods = "CTRL|SHIFT", action=wezterm.action{SplitVertical={
      domain = "CurrentPaneDomain"
    }}},
    {key = "\\", mods = "CTRL", action=wezterm.action{SplitHorizontal={
      domain = "CurrentPaneDomain"
    }}},
    {key = "w", mods = "CTRL", action=wezterm.action{CloseCurrentPane={confirm=true}}},
  },
}

