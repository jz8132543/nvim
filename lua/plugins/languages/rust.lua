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
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    },
  },
}
