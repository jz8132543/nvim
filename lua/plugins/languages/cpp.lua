return {
  {
    "p00f/clangd_extensions.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "cpp", "c" },
    config = function()
      require("clangd_extensions").setup({
        server = {
          capabilities = (function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.offsetEncoding = { "utf-16" }
            return capabilities
          end)(),
          on_attach = function(client, bufnr)
            require("plugins.lsp.utils").on_attach(client, bufnr)
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
