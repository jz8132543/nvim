return {
  {
    "iamcco/coc-diagnostic",
    event = "VeryLazy",
    build = "yarn install --frozen-lockfile",
  },
  {
    "xiyaowong/coc-sumneko-lua",
    build = "yarn install --frozen-lockfile",
    ft = "lua",
  },
  {
    "neoclide/coc-json",
    build = "yarn install --frozen-lockfile",
    ft = "json",
  },
  {
    "fannheyward/coc-rust-analyzer",
    build = "yarn install --frozen-lockfile",
    ft = "rust",
  },

}
