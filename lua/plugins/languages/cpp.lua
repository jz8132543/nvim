return {
  {
    "p00f/clangd_extensions.nvim",
    event = "VeryLazy",
    ft = { "cpp", "c" },
    config = function()
      require("clangd_extensions").setup({
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = bufnr })
          end,
        },
      })
    end,
  },
  -- {
  --   "TwIStOy/cpp-toolkit.nvim",
  --   cmd = {
  --     "CppGenDef",
  --     "CppDebugPrint",
  --     "CppToolkit",
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   event = "VeryLazy",
  --   ft = { "cpp", "c" },
  --   config = true,
  -- },
}
