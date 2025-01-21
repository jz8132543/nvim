return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local nls = require "null-ls"
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    nls.setup {
      debounce = 150,
      save_after_format = false,
      sources = {
        nls.builtins.code_actions.gitsigns,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.nixfmt,
        nls.builtins.formatting.terraform_fmt,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.rustfmt,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.asmfmt,
        -- nls.builtins.formatting.clang_format,
        -- nls.builtins.formatting.cmake_format,
        -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
        require "none-ls.diagnostics.eslint",
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
        -- -- nls.builtins.diagnostics.flake8,
      },
      -- root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
      -- on_attach = require("plugins.lsp.utils").on_attach,
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
    }
  end,
}
