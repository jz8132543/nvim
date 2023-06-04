return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("onedarkpro").setup({
      options = {
        highlight_inactive_windows = true,
      },
      styles = {
        comments = "italic",
      },
    })
    vim.cmd.colorscheme("onedark_vivid")
  end,
}
