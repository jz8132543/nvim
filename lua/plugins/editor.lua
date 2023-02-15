vim.g.neo_tree_remove_legacy_commands = 1

return {
  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
  },

}
