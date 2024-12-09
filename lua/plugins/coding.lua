return {
  { "dmmulroy/ts-error-translator.nvim" },
  {
    "dmmulroy/tsc.nvim",
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
      local tsdoc = require("neogen.templates.tsdoc")
      local ts = require("neogen.configurations.typescript")

      local normalTemp = {
        { nil, "/**", { no_results = true, type = { "normal" } } },
        { nil, " * $1", { no_results = true, type = { "normal" } } },
        { nil, " */", { no_results = true, type = { "normal" } } },
      }
      for _, value in ipairs(normalTemp) do
        table.insert(tsdoc, value)
      end

      local normalNode = { "property_signature", "enum_declaration", "property_identifier" }
      ts.parent.normal = normalNode
      ts.data.normal = {
        [table.concat(normalNode, "|")] = {
          ["0"] = {
            extract = function()
              return {}
            end,
          },
        },
      }

      opts.languages = opts.languages or {}
      opts.languages.typescript = ts

      return opts
    end,
  },
}
