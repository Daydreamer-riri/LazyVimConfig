return {
  { "dmmulroy/ts-error-translator.nvim" },
  {
    "youyoumu/pretty-ts-errors.nvim",
    opts = {
      auto_open = false,
    },
  },
  {
    "dmmulroy/tsc.nvim",
    event = "VeryLazy",
    opts = {
      use_trouble_qflist = true,
      use_diagnostics = false,
    },
  },
  {
    "vuki656/package-info.nvim",
    opts = {
      package_manager = "pnpm",
      autostart = false,
    },
    keys = {
      {
        "<leader>ns",
        function()
          require("package-info").show()
        end,
        mode = { "n" },
        desc = "Show dependency versions",
      },
      {
        "<leader>nc",
        function()
          require("package-info").hide()
        end,
        mode = { "n" },
        desc = "Hide dependency versions",
      },
      {
        "<leader>nt",
        function()
          require("package-info").toggle()
        end,
        mode = { "n" },
        desc = "Toggle dependency versions",
      },
      {
        "<leader>nu",
        function()
          require("package-info").update()
        end,
        mode = { "n" },
        desc = "Update dependency on the line",
      },
      {
        "<leader>nd",
        function()
          require("package-info").delete()
        end,
        mode = { "n" },
        desc = "Delete dependency on the line",
      },
      {
        "<leader>ni",
        function()
          require("package-info").install()
        end,
        mode = { "n" },
        desc = "Install a new dependency",
      },
      {
        "<leader>np",
        function()
          require("package-info").change_version()
        end,
        mode = { "n" },
        desc = "Install a different dependency version",
      },
    },
  },
  {
    "danymat/neogen",
    opts = function(_, opts)
      local ts = require("custom.neogen.typescript")
      opts.languages = opts.languages or {}
      opts.languages.typescript = ts
      opts.typescriptreact = ts
      opts["typescript.tsx"] = ts

      return opts
    end,
  },
}
