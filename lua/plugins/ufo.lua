return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    keys = {
      { "<leader>zo", "<cmd>lua require('ufo').openAllFolds<cr>", desc = "Open All Folds" },
      { "<leader>zc", "<cmd>lua require('ufo').closeAllFolds<cr>", desc = "Close All Folds" },
    },
    opts = true,
  },
}
