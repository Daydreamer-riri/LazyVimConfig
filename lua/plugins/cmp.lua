local function deprio(kind)
  return function(e1, e2)
    if e1:get_kind() == kind then
      return false
    end
    if e2:get_kind() == kind then
      return true
    end
  end
end

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local types = require("cmp.types")
      opts.mapping["<C-N>"] = nil
      opts.mapping["<C-P>"] = nil

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-n>"] = function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            cmp.complete()
          end
        end,
        ["<C-p>"] = function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            cmp.complete()
          end
        end,
      })

      local compare = require("cmp.config.compare")

      opts.sorting.comparators = {
        deprio(types.lsp.CompletionItemKind.Snippet),
        deprio(types.lsp.CompletionItemKind.Text),
        compare.offset,
        compare.exact,
        -- compare.scopes,
        compare.score,
        compare.recently_used,
        compare.locality,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      }

      opts.window = opts.window or {}
      opts.window.documentation = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
      }
    end,
  },
}
