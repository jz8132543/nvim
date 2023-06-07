return {
  { "MunifTanjim/nui.nvim" },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        indicator = {
          icon = "▎",
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "NvimTree", text = "File Explorer" } },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thick",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = {
      char = "▏",
      show_end_of_line = true,
      buftype_exclude = { "terminal", "nofile" },
    },
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "notify" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "google/executor.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    opts = true,
    keys = {
      { "<leader>ee", "<cmd>ExecutorRun<cr>", desc = "Run Command" },
      { "<leader>ev", "<cmd>ExecutorToggleDetail<cr>", desc = "Toggle Run Detail" },
      { "<leader>er", "<cmd>ExecutorReset<cr>", desc = "Reset Command" },
    },
  },
  {
    "SmiteshP/nvim-navbuddy",
    event = "VeryLazy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("nvim-navbuddy").setup({
        lsp = { auto_attach = true },
      })
    end,
    keys = {
      { "<leader>cs", "<cmd>Navbuddy<cr>", desc = "Navbuddy Symbol" },
    },
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    enabled = true,
    config = true,
  },
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup()
      -- require("scrollbar.handlers.search").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    keys = { "<C-;>" },
    config = function()
      local toggleterm = require("toggleterm")
      toggleterm.setup({
        size = 10,
        open_mapping = [[<C-;>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 3,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
      })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local map = vim.keymap.set
      map("n", "<Leader>gp", ":Gitsigns prev_hunk<CR>", { desc = "Plug Gitsigns: jump to prev hunk" })
      map("n", "<Leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Plug Gitsigns: jump to next hunk" })
      map("n", "<Leader>gs", ":Gitsigns preview_hunk<CR>", { desc = "Plug Gitsigns: preview hunk" })
      map("n", "<Leader>gd", ":Gitsigns diffthis<CR>", { desc = "Plug Gitsigns: open diffmode" })
      map("n", "<Leader>ga", ":Gitsigns stage_hunk<CR>", { desc = "Plug Gitsigns: stage current hunk" })
      map("n", "<Leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Plug Gitsigns: reset current hunk" })
      map("n", "<Leader>gA", ":Gitsigns stage_buffer<CR>", { desc = "Plug Gitsigns: stage current buffer" })
      map("n", "<Leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Plug Gitsigns: reset current buffer" })

      require("gitsigns").setup()
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({ delay = 200 })
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    lazy = "VeryLazy",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        thousands = false, -- or line number thousands separator string ("." / ",")
        relculright = false, -- whether to right-align the cursor line number with 'relativenumber' set
        setopt = true, -- whether to set the 'statuscolumn', providing builtin click actions
        ft_ignore = nil, -- lua table with filetypes for which 'statuscolumn' will be unset
        segments = {
          { text = { "%C" }, click = "v:lua.ScFa" },
          {
            text = { builtin.lnumfunc },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          { text = { "%s" }, click = "v:lua.ScSa" },
        },
        clickhandlers = {
          Lnum = builtin.lnum_click,
          FoldClose = builtin.foldclose_click,
          FoldOpen = builtin.foldopen_click,
          FoldOther = builtin.foldother_click,
          DapBreakpointRejected = builtin.toggle_breakpoint,
          DapBreakpoint = builtin.toggle_breakpoint,
          DapBreakpointCondition = builtin.toggle_breakpoint,
          DiagnosticSignError = builtin.diagnostic_click,
          DiagnosticSignHint = builtin.diagnostic_click,
          DiagnosticSignInfo = builtin.diagnostic_click,
          DiagnosticSignWarn = builtin.diagnostic_click,
          GitSignsTopdelete = builtin.gitsigns_click,
          GitSignsUntracked = builtin.gitsigns_click,
          GitSignsAdd = builtin.gitsigns_click,
          GitSignsChangedelete = builtin.gitsigns_click,
          GitSignsDelete = builtin.gitsigns_click,
        },
      })
    end,
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8

      if vim.bo[0].filetype == "lazy" then
        vim.notify("Missing plugins installed!", vim.log.levels.INFO, { title = "LazyVim" })
        vim.cmd.close()
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
