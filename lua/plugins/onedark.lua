return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("onedarkpro").setup({
      options = {
        highlight_inactive_windows = true,
      },
    })
    vim.cmd.colorscheme("onedark_vivid")
  end,
}
