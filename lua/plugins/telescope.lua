return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "tsakirist/telescope-lazy.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "gbrlsnchs/telescope-lsp-handlers.nvim",
    },
    keys = {
      { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>tr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
      { "<leader>td", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>tl", "<cmd>Telescope lazy<cr>", desc = "Lazy Files" },
      { "<leader>tb", "<cmd>Telescope file_browser<cr>", desc = "Lazy Browser" },
    },
    config = function()
      local actions = require("telescope.actions")
      local mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["q"] = actions.close,
        },
      }
      require("telescope").load_extension("lazy")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("lsp_handlers")
      require("telescope").setup({
        defaults = {
          mappings = mappings,
        },
        extensions = {
          lazy = {},
          file_browser = {
            mappings = mappings,
          },
          lsp_handlers = {},
        },
      })
    end,
  },
}
