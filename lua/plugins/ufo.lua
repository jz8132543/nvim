return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    keys = {
      { "<leader>zR", "<cmd>lua require('ufo').openAllFolds<cr>", desc = "Open All Folds" },
      { "<leader>zM", "<cmd>lua require('ufo').closeAllFolds<cr>", desc = "Close All Folds" },
    },
    opts = true,
  },
}
