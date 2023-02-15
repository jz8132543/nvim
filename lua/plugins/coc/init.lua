return {
  require("plugins.coc.servers"),
  {
    "neoclide/coc.nvim",
    branch = 'release',
    lazy = false,
    keys = {
      -- Diagnostic
      { '[e', '<Plug>(coc-diagnostic-prev)' },
      { ']e', '<Plug>(coc-diagnostic-next)' },

      -- LSP actions
      { '<leader>cr', '<Plug>(coc-rename)', { desc = "Rename" } },
      { '<leader>cf', '<Plug>(coc-fix-current)', { silent = true, desc = "Quickfix" } },
      { '<leader>ca', '<Plug>(coc-codeaction)', { silent = true, desc = "Code Actions" } },
      { '<leader>cf', '<cmd>call CocActionAsync("format")<cr>', desc = "Format" },
      { 'gd', '<Plug>(coc-definition)', desc = "Definition" },
      { 'gt', '<Plug>(coc-type-definition)', desc = "Type Definition" },
      { 'K', "<cmd>call CocActionAsync('doHover')<cr>" },
    },
  },
  { "rafcamlet/coc-nvim-lua" },
}

