return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        integrations = {
          coc_nvim = true,
          gitsigns = true,
          which_key = true,
          nvimtree = true,
          telescope = true,
          notify = true,
          mini = true,
          noice = true,
        },
      })
      vim.cmd.colorscheme('catppuccin')
    end,
  },
}
