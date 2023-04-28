return {
  {
    "simrat39/rust-tools.nvim",
    event = "VeryLazy",
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
          },
          procMacro = {
            enable = true,
          },
        },
      },
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "K", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set(
            "n",
            "<leader>ca",
            require("rust-tools").code_action_group.code_action_group,
            { buffer = bufnr }
          )
          vim.keymap.set("n", "<F5>", require("rust-tools").runnables.runnables, { buffer = bufnr })
        end,
      },
    },
  },
}
