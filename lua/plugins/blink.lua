return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type fun(_: any, opts: blink.cmp.Config):blink.cmp.Config
  opts = function(_, opts)
    opts.keymap["<C-n>"] = {
      "show",
      "select_next",
    }

    opts.keymap["<C-p>"] = {
      "show",
      "select_prev",
    }

    opts.completion.accept.auto_brackets = { enabled = false }
    opts.completion.menu.min_width = 24
    opts.completion.ghost_text.show_with_menu = false

    return opts
  end,
}
