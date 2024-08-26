return {
  { "nvim-neotest/neotest-jest", commit = "e80fb97b0230d00cc9b564dee29870a421e17466" },
  { "marilari88/neotest-vitest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestConfigFile = function(file)
            if string.find(file, "/packages/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end
            if string.find(file, "/projects/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          cwd = function(file)
            if string.find(file, "/packages/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            if string.find(file, "/projects/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            return vim.fn.getcwd()
          end,
        },
        ["neotest-vitest"] = {
          vitestCommand = "npx vitest run",
          filter_dir = function(name, rel_path, root)
            return name ~= "node_modules"
          end,
        },
      },
    },
  },
}
