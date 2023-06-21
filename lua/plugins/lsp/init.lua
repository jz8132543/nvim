local servers = require("plugins.lsp.servers")

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", config = true },
      { "williamboman/mason.nvim", config = true, cmd = "Mason" },
      { "williamboman/mason-lspconfig.nvim", config = true },
      { "WhoIsSethDaniel/mason-tool-installer.nvim", config = true },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- diagnostics
      local diagnostics = require("plugins.lsp.diagnostics")
      diagnostics.apply()

      -- lspconfig
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      for server, opts in pairs(servers) do
        opts.capabilities = capabilities
        opts.on_attach = require("plugins.lsp.utils").on_attach
        require("lspconfig")[server].setup(opts)
      end
    end,
  },
  -- Winbar
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
  },
  -- UI
  {
    "dnlhc/glance.nvim",
    event = "BufRead",
    config = true,
  },
  {
    "folke/trouble.nvim",
    event = "BufRead",
    config = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "TroubleToggle" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "workspace diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "document diagnostics" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "quickfix" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "loclist" },
      { "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "References" },
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      handler_opts = {
        border = "none", -- double, rounded, single, shadow, none, or a table of borders
      },
      hint_prefix = "💡",
      max_height = 4,
      toggle_key = [[<M-x>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
      select_signature_key = [[<M-c>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
    },
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    config = function()
      local nls = require("null-ls")
      -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      nls.setup({
        debounce = 150,
        save_after_format = false,
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.rustfmt,
          nls.builtins.formatting.terraform_fmt,
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.asmfmt,
          nls.builtins.formatting.alejandra,
          -- nls.builtins.formatting.clang_format,
          -- nls.builtins.formatting.cmake_format,
          -- nls.builtins.formatting.prettierd.with({
          --   filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
          -- }),
          -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
          -- nls.builtins.formatting.eslint_d,
          -- nls.builtins.diagnostics.luacheck,
          -- nls.builtins.diagnostics.shellcheck,
          -- nls.builtins.diagnostics.cmake_lint,
          -- nls.builtins.diagnostics.markdownlint,
          -- nls.builtins.diagnostics.selene.with({
          --   condition = function(utils)
          --     return utils.root_has_file({ "selene.toml" })
          --   end,
          -- }),
          nls.builtins.code_actions.gitsigns,
          -- -- nls.builtins.diagnostics.flake8,
        },
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
        on_attach = require("plugins.lsp.utils").on_attach,
      })
    end,
  },
}
