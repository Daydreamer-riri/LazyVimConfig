return {
  { "nvim-neotest/neotest-jest" },
  -- { "Daydreamer-riri/neotest-jest" },
  { "marilari88/neotest-vitest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestConfigFile = function(file)
            if string.find(file, "/packages/") then
              return string.match(file, "(.-/[^/]+/)(src|__tests__)") .. "jest.config.js"
            end
            if string.find(file, "/projects/") then
              local configFile = string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
              return configFile
            end

            return vim.fn.getcwd() .. "/jest.config.js"
          end,
          -- cwd = function(file)
          --   if string.find(file, "/packages/") then
          --     return string.match(file, "(.-/[^/]+/)(src|__tests__)")
          --   end
          --   if string.find(file, "/projects/") then
          --     return string.match(file, "(.-/[^/]+/)(src|__tests__)")
          --   end
          --   return vim.fn.getcwd()
          -- end,
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
