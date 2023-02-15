return {
  require("plugins.coc.servers"),
  {
    "neoclide/coc.nvim",
    branch = 'release',
    -- build = "yarn install --frozen-lockfile",
    lazy = false,
  },
  { "rafcamlet/coc-nvim-lua" },
}

