return {
  {
    -- "simrat39/rust-tools.nvim",
    "Ciel-MC/rust-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = "rust",
    opts = {
      tools = {
        runnables = {
          use_telescope = true,
        },
      },
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            features = "all",
          },
          checkOnSave = true,
          check = {
            command = "clippy",
            features = "all",
            extraArgs = { "--all", "--", "-W", "clippy::all" },
          },
          procMacro = {
            enable = true,
          },
        },
      },
      server = {
        on_attach = function(client, bufnr)
          require("plugins.lsp.utils").on_attach(client, bufnr)
          vim.keymap.set("n", "K", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set(
            "n",
            "<leader>ca",
            require("rust-tools").code_action_group.code_action_group,
            { buffer = bufnr }
          )
          vim.keymap.set("n", "<F5>", require("rust-tools").runnables.runnables, { buffer = bufnr })
          vim.keymap.set("n", "<F6>", require("rust-tools").debuggables.debuggables, { buffer = bufnr })
        end,
      },
    },
  },
}
