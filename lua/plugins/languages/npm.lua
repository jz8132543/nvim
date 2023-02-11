return {
  {
    "vuki656/package-info.nvim",
    event = "VeryLazy",
    config = true,
    keys = {
      {
        "<leader>ns",
        "<cmd>lua require('package-info').show({ force = true })<cr>",
        desc = "Display Latest Package Version",
      },
      {
        "<leader>nd",
        "<cmd>lua require('package-info').delete()<cr>",
        desc = "Delete Dependency",
      },
      {
        "<leader>ni",
        "<cmd>lua require('package-info').install()<cr>",
        desc = "Install Dependency",
      },
      {
        "<leader>np",
        "<cmd>lua require('package-info').change_version()<cr>",
        desc = "Change Version",
      },
    },
  },
}
