local M = {}

function M.hl(params)
  local c = params.c
  local light_palette = params.light_palette
  local dark_palette = params.dark_palette

  local set_hl = require("snacks.util").set_hl

  set_hl({
    AzureSelected = { bg = c.active_bg, fg = light_palette.blue },
    BlueSelected = { bg = c.active_bg, fg = light_palette.blue },
    CyanSelected = { bg = c.active_bg, fg = light_palette.aqua },
    GreenSelected = { bg = c.active_bg, fg = light_palette.green },
    OrangeSelected = { bg = c.active_bg, fg = light_palette.orange },
    PurpleSelected = { bg = c.active_bg, fg = light_palette.purple },
    RedSelected = { bg = c.active_bg, fg = light_palette.red },
    YellowSelected = { bg = c.active_bg, fg = light_palette.yellow },
  }, {
    prefix = "BufferLineMiniIcons",
    default = true,
  })

  return {
    fill = { bg = c.bg },
    background = { bg = c.inactive_bg, fg = c.inactive_fg },
    buffer_visible = { bg = c.inactive_bg },
    buffer_selected = { bg = c.active_bg, fg = c.active_fg },
    -- Duplicate
    duplicate_selected = { bg = c.active_bg, fg = c.duplicate_selected },
    duplicate_visible = { bg = c.inactive_bg },
    duplicate = { bg = c.inactive_bg },
    warning = { bg = c.inactive_bg, fg = c.inactive_fg },
    warning_visible = { bg = c.inactive_bg, fg = c.inactive_fg },
    warning_diagnostic = { bg = c.inactive_bg, fg = dark_palette.yellow },
    warning_diagnostic_visible = { bg = c.inactive_bg, fg = dark_palette.yellow },
    warning_selected = { bg = c.active_bg, fg = light_palette.yellow },
    warning_diagnostic_selected = { bg = c.active_bg, fg = light_palette.yellow },
    error = { bg = c.inactive_bg, fg = c.inactive_fg },
    error_visible = { bg = c.inactive_bg, fg = c.inactive_fg },
    error_diagnostic = { bg = c.inactive_bg, fg = dark_palette.red },
    error_diagnostic_visible = { bg = c.inactive_bg, fg = dark_palette.red },
    error_selected = { bg = c.active_bg, fg = light_palette.red },
    error_diagnostic_selected = { bg = c.active_bg, fg = light_palette.red },
    -- Infos
    info = { fg = c.inactive_fg, bg = c.inactive_bg },
    info_visible = { fg = c.inactive_fg, bg = c.inactive_bg },
    info_selected = { fg = light_palette.blue, bg = c.active_bg },
    info_diagnostic = { fg = dark_palette.blue, bg = c.inactive_bg },
    info_diagnostic_visible = { fg = c.inactive_fg, bg = c.inactive_bg },
    info_diagnostic_selected = { fg = light_palette.blue, bg = c.active_bg },
    -- Modified
    modified = { bg = c.inactive_bg },
    modified_visible = { bg = c.inactive_bg },
    modified_selected = { bg = c.active_bg, fg = light_palette.green },
    -- Diagnostics
    diagnostic = { bg = c.inactive_bg },
    diagnostic_visible = { bg = c.inactive_bg },
    diagnostic_selected = { bg = c.active_bg },
    -- Hint
    hint = { fg = c.inactive_fg, bg = c.inactive_bg },
    hint_visible = { fg = c.inactive_fg, bg = c.inactive_bg },
    hint_selected = { fg = light_palette.green, bg = c.active_bg },
    hint_diagnostic = { fg = c.inactive_fg, bg = c.inactive_bg },
    hint_diagnostic_visible = { fg = c.inactive_fg, bg = c.inactive_bg },
    hint_diagnostic_selected = { fg = light_palette.green, bg = c.active_bg },
    -- Pick
    pick = { bg = c.inactive_bg },
    pick_visible = { bg = c.inactive_bg },
    pick_selected = { bg = c.active_bg, fg = light_palette.red },
    -- separators
    separator = { bg = c.inactive_bg, fg = c.bg },
    separator_visible = { bg = c.inactive_bg, fg = c.bg },
    separator_selected = { fg = c.bg, bg = c.active_bg },
    offset_separator = { fg = c.bg, bg = c.bg },
    -- tabs
    tab = { fg = c.inactive_fg, bg = c.inactive_bg },
    tab_selected = { fg = c.active_fg, bg = c.active_bg },
    tab_separator = { fg = c.bg, bg = c.inactive_bg },
    tab_separator_selected = { fg = c.bg, bg = c.active_bg },
  }
end

return M
