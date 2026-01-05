local M = {}

-- 辅助函数：返回非 nil 的颜色配置
local function if_not_nil(color)
  local bg = color.bg
  local fg = color.fg
  local result = {}
  if bg then
    result.bg = bg
  end
  if fg then
    result.fg = fg
  end
  return next(result) and result or nil
end

function M.hl(params)
  local c = params.c
  local light_palette = params.light_palette
  local dark_palette = params.dark_palette

  local set_hl = require("snacks.util").set_hl

  if light_palette then
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
  end

  light_palette = light_palette or {}
  dark_palette = dark_palette or {}

  return {
    fill = if_not_nil({ bg = c.bg }),
    background = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    buffer_visible = if_not_nil({ bg = c.inactive_bg }),
    buffer_selected = if_not_nil({ bg = c.active_bg, fg = c.active_fg }),
    -- Duplicate
    duplicate_selected = if_not_nil({ bg = c.active_bg, fg = c.duplicate_selected }),
    duplicate_visible = if_not_nil({ bg = c.inactive_bg }),
    duplicate = if_not_nil({ bg = c.inactive_bg }),
    warning = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    warning_visible = if_not_nil({ bg = c.inactive_bg, fg = c.inactive_fg }),
    warning_diagnostic = if_not_nil({ fg = dark_palette.yellow, bg = c.inactive_bg }),
    warning_diagnostic_visible = if_not_nil({ bg = c.inactive_bg, fg = dark_palette.yellow }),
    warning_selected = if_not_nil({ bg = c.active_bg, fg = light_palette.yellow }),
    warning_diagnostic_selected = if_not_nil({ bg = c.active_bg, fg = light_palette.yellow }),
    error = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    error_visible = if_not_nil({ bg = c.inactive_bg, fg = c.inactive_fg }),
    error_diagnostic = if_not_nil({ fg = dark_palette.red }),
    error_diagnostic_visible = if_not_nil({ bg = c.inactive_bg, fg = dark_palette.red }),
    error_selected = if_not_nil({ bg = c.active_bg, fg = light_palette.red }),
    error_diagnostic_selected = if_not_nil({ bg = c.active_bg, fg = light_palette.red }),
    -- Infos
    info = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    info_visible = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    info_selected = if_not_nil({ fg = light_palette.blue, bg = c.active_bg }),
    info_diagnostic = if_not_nil({ fg = dark_palette.blue, bg = c.inactive_bg }),
    info_diagnostic_visible = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    info_diagnostic_selected = if_not_nil({ fg = light_palette.blue, bg = c.active_bg }),
    -- Modified
    modified = if_not_nil({}),
    modified_visible = if_not_nil({ bg = c.inactive_bg }),
    modified_selected = if_not_nil({ bg = c.active_bg, fg = light_palette.green }),
    -- Diagnostics
    diagnostic = if_not_nil({ bg = c.inactive_bg }),
    diagnostic_visible = if_not_nil({ bg = c.inactive_bg }),
    diagnostic_selected = if_not_nil({ bg = c.active_bg }),
    -- Hint
    hint = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    hint_visible = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    hint_selected = if_not_nil({ fg = light_palette.green, bg = c.active_bg }),
    hint_diagnostic = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    hint_diagnostic_visible = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    hint_diagnostic_selected = if_not_nil({ fg = light_palette.green, bg = c.active_bg }),
    -- Pick
    pick = if_not_nil({}),
    pick_visible = if_not_nil({ bg = c.inactive_bg }),
    pick_selected = if_not_nil({ bg = c.active_bg, fg = light_palette.red }),
    -- separators
    separator = if_not_nil({ bg = c.inactive_bg, fg = c.bg }),
    separator_visible = if_not_nil({ bg = c.inactive_bg, fg = c.bg }),
    separator_selected = if_not_nil({ fg = c.bg, bg = c.active_bg }),
    offset_separator = if_not_nil({ fg = c.bg, bg = c.bg }),
    -- tabs
    tab = if_not_nil({ fg = c.inactive_fg, bg = c.inactive_bg }),
    tab_selected = if_not_nil({ fg = c.active_fg, bg = c.active_bg }),
    tab_separator = if_not_nil({ fg = c.bg, bg = c.inactive_bg }),
    tab_separator_selected = if_not_nil({ fg = c.bg, bg = c.active_bg }),
  }
end

return M
