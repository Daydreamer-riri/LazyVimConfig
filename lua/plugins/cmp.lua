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
    dependencies = {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
      opts = {},
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local types = require("cmp.types")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<c-n>"] = function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          else
            cmp.complete()
          end
        end,
        ["<c-p>"] = function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          else
            cmp.complete()
          end
        end,
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

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
  {
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
      },
    },
  },
}
