return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "tsakirist/telescope-lazy.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
      { "<leader>fl", "<cmd>Telescope lazy<cr>", desc = "Lazy Files" },
      { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "Lazy Browser" },
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
      require("telescope").setup({
        defaults = {
          mappings = mappings,
        },
        extensions = {
          lazy = {},
          file_browser = {
            mappings = mappings,
          },
        },
      })
      require("telescope").load_extension("lazy")
      require("telescope").load_extension("file_browser")
    end,
  },
}
