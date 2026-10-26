local M = {}

local augroup = vim.api.nvim_create_augroup("deferClip", {})

local function is_ssh()
  return vim.env.SSH_TTY ~= nil or vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_CLIENT ~= nil
end

local function is_kero()
  return vim.env.KERO_SESSION ~= nil
end

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
  -- SSH / kero 连接下 pbcopy / win32yank 写的是 nvim 所在机器的剪贴板，统一走 OSC 52 交给终端
  local use_osc52 = is_ssh() or is_kero()

  if IS_MAC and not use_osc52 then
    vim.opt.clipboard = "unnamedplus"
    return
  end

  vim.opt.clipboard = ""
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
  if not use_osc52 then
    vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
      group = augroup,
      callback = sync_from,
    })
  end
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
      vim.schedule(function()
        if use_osc52 then
          require("vim.ui.clipboard.osc52").copy("+")(vim.fn.getreg('"', 1, true))
        else
          vim.fn.system({ "win32yank.exe", "-i" }, vim.fn.getreg('"'))
        end
      end)
    end,
  })
end

return M
