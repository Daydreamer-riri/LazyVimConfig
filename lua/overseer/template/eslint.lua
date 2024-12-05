return {
  name = "Run ESLint",
  builder = function()
    return {
      cmd = "npx",
      args = { "eslint", "--quiet", "." },
      components = {
        "default",
        { "on_output_parse", problem_matcher = "$eslint-stylish" },
        "on_result_diagnostics",
        { "on_result_diagnostics_quickfix", use_loclist = true },
        "on_result_diagnostics_trouble",
      },
    }
  end,
  condition = {
    filetype = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  desc = "Run ESLint to check for linting errors in the current directory",
}
