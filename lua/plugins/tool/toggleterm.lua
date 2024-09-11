local custom = require "custom"

---@type LazyPluginSpec
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    shell = vim.uv.os_uname().sysname == "Windows_NT" and "pwsh" or "fish",
    float_opts = {
      border = custom.border,
    },
    winbar = {
      enabled = true,
    },
  },
  keys = function()
    local float_opts = {
      border = custom.border,
    }
    local on_create = function(t)
      local bufnr = t.bufnr
      vim.keymap.set("t", "<Esc>", "<Nop>", { buffer = bufnr })
    end

    local lazygit
    local lazydocker
    local gh_dash
    local lf

    return {
      { "<C-\\>" },
      {
        "<leader>tt",
        "<Cmd>ToggleTermToggleAll<CR>",
        mode = "n",
        desc = "All Terminal",
      },

      -- External programs
      {
        "<leader>gl",
        function()
          if not lazygit then
            lazygit = require("toggleterm.terminal").Terminal:new {
              cmd = "lazygit",
              hidden = true,
              direction = "float",
              float_opts = float_opts,
              on_create = on_create,
            }
          end
          lazygit:toggle()
        end,
        desc = "LazyGit",
      },
      {
        "<leader>pd",
        function()
          if not lazydocker then
            lazydocker = require("toggleterm.terminal").Terminal:new {
              cmd = "lazydocker",
              hidden = true,
              direction = "float",
              float_opts = float_opts,
              on_create = on_create,
            }
          end
          lazydocker:toggle()
        end,
        desc = "Lazy Docker",
      },
      {
        "<leader>pg",
        function()
          if not gh_dash then
            gh_dash = require("toggleterm.terminal").Terminal:new {
              -- https://github.com/dlvhdr/gh-dash/issues/316
              env = { LANG = "en_US.UTF-8" },
              cmd = "gh-dash",
              hidden = true,
              direction = "float",
              float_opts = float_opts,
              on_create = on_create,
            }
          end
          gh_dash:toggle()
        end,
        desc = "GitHub Dash",
      },
      {
        "<leader>N",
        function()
          if not lf then
            lf = require("toggleterm.terminal").Terminal:new {
              cmd = "lf",
              hidden = true,
              direction = "float",
              float_opts = float_opts,
              on_create = on_create,
            }
          end
          lf:toggle()
        end,
        desc = "File Navigator",
      },
    }
  end,
}
