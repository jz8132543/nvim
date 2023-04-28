return {
  "mawkler/onedark.nvim",
  priority = 999,
  name = "onedark",
  lazy = false,
  config = function()
    require("onedark").setup({})
    vim.cmd.colorscheme("onedark")
  end,
}
