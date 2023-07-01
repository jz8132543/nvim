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
    tag = "legacy",
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
    opts = function()
      local signs = require("config.icons").git.signs
      return {
        signs = {
          add = { text = signs.add },
          change = { text = signs.change },
          delete = { text = signs.delete },
          topdelete = { text = signs.topdelete },
          changedelete = { text = signs.changedelete },
          untracked = { text = signs.untracked },
        },
        preview_config = {
          border = require("config.icons").borders.outer.all,
          style = "minimal",
          relative = "cursor",
          width = 88,
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local map = vim.keymap.set
          map("n", "<Leader>gp", ":Gitsigns prev_hunk<CR>", { desc = "Plug Gitsigns: jump to prev hunk" })
          map("n", "<Leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Plug Gitsigns: jump to next hunk" })
          map("n", "<Leader>gs", ":Gitsigns preview_hunk<CR>", { desc = "Plug Gitsigns: preview hunk" })
          map("n", "<Leader>gd", ":Gitsigns diffthis<CR>", { desc = "Plug Gitsigns: open diffmode" })
          map("n", "<Leader>ga", ":Gitsigns stage_hunk<CR>", { desc = "Plug Gitsigns: stage current hunk" })
          map("n", "<Leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Plug Gitsigns: reset current hunk" })
          map("n", "<Leader>gA", ":Gitsigns stage_buffer<CR>", { desc = "Plug Gitsigns: stage current buffer" })
          map("n", "<Leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Plug Gitsigns: reset current buffer" })
        end,
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewToggleFiles",
      "DiffviewRefresh",
      "DiffviewLog",
    },
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
    event = "VimEnter",
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        relculright = true,
        setopt = true,
        segments = {
          {
            sign = {
              name = {
                "Dap",
                "neotest", --[[ "Diagnostic" ]]
              },
              maxwidth = 2,
              colwidth = 2,
              auto = true,
            },
            click = "v:lua.ScSa",
          },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          { text = { " " } },
          {
            sign = {
              name = { "GitSigns" },
              maxwidth = 1,
              colwidth = 1,
              auto = false,
              -- fillchar = require("config.icons").borders.outer.all[8],
              fillcharhl = "StatusColumnSeparator",
            },
            click = "v:lua.ScSa",
          },
        },
        ft_ignore = {
          "help",
          "vim",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "noice",
          "lazy",
          "toggleterm",
        },
      }
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
