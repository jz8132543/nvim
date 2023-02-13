return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = true,
    keys = {
      { "<leader>zR", require("ufo").openAllFolds, desc = "Open All Folds" },
      { "<leader>zM", require("ufo").closeAllFolds, desc = "Close All Folds" },
    },
  },
}
