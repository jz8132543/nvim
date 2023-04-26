return {
  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true, -- shows a list of your marks on ' and `
          registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 9, -- how many suggestions should be shown in the list?
          },
          -- the presets plugin, adds help for a bunch of default keybindings in Neovim
          -- No actual key bindings are created
          presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
          },
        },
        icons = {
          breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
          separator = "➜", -- symbol used between a key and it's label
          group = "+", -- symbol prepended to a group
        },
        window = {
          border = "none", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
        },
        layout = {
          height = { min = 1, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 1, -- spacing between columns
          align = "center", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specify a list manually

        triggers_blacklist = {
          -- list of mode / prefixes that should never be hooked by WhichKey
          -- this is mostly relevant for key maps that start with a native binding
          -- most people should not need to change this
          n = { "o", "O" },
        },
      })
      wk.register({
        ["<leader>"] = {
          f = { name = "File" },
          b = { name = "Buffer" },
          c = {
            name = "+code",
            r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
            d = { "<cmd>lua vim.diagnostic.open_float({scope='line'})<CR>", "Line Diagnostics" },
            D = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
            f = {
              { "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", "Format" },
              {
                "<cmd>lua vim.lsp.buf.range_formatting({ timeout_ms = 2000 })<CR>",
                "Range Format",
                mode = "v",
              },
            },
          },
          l = {
            name = "+lsp",
            i = { "<cmd>LspInfo<cr>", "Lsp Info" },
          },
        },
        g = {
          name = "+goto",
          d = { "<cmd>Glance definitions<cr>", "Goto Definition" },
          r = { "<cmd>Glance references<cr>", "References" },
          i = { "<cmd>Glance implementations<CR>", "Goto Implementation" },
          t = { "<cmd>Glance type_definitions<cr>", "Goto Type Definition" },
          D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
        },
        ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
        ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
        ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
        ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Prev Diagnostic" },
        ["[e"] = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Next ERROR" },
        ["]e"] = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev ERROR" },
        ["<F9>"] = { name = "Run" },
      })
    end,
  },
}
