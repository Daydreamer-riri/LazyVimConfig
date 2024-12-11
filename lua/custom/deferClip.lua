local M = {}

local augroup = vim.api.nvim_create_augroup("deferClip", {})

local function sync_from()
  vim.fn.jobstart({ "win32yank.exe", "-o", "--lf" }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      local contents = table.concat(data, "\n")
      vim.fn.setreg('"', contents)
      require("yanky.history").push({ regcontents = contents, regtype = "v" })
    end,
  })
end

function M.setup()
  vim.g.clipboard = {
    name = "noop",
    copy = {
      ["*"] = "",
      ["+"] = "",
    },
    paste = {
      ["*"] = "",
      ["+"] = "",
    },
    cache_enabled = false,
  }
  vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
    group = augroup,
    callback = sync_from,
  })
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
      vim.schedule(function()
        vim.fn.system({ "win32yank.exe", "-i" }, vim.fn.getreg('"'))
      end)
    end,
  })
end

return M
