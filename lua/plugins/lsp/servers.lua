return {
  -- TODO
  {
    'puremourning/vimspector',
    event = 'VeryLazy',
  },
  {
    'neoclide/coc-git',
    event = 'VeryLazy',
    build = 'yarn install --frozen-lockfile',
  },
  {
    'iamcco/coc-diagnostic',
    lazy = false,
    -- event = 'VeryLazy',
    build = 'yarn install --frozen-lockfile',
  },
  {
    'xiyaowong/coc-sumneko-lua',
    build = 'yarn install --frozen-lockfile',
    ft = 'lua',
  },
  {
    'neoclide/coc-json',
    build = 'yarn install --frozen-lockfile',
    ft = 'json',
  },
  {
    'kkiyama117/coc-toml',
    build = 'yarn install --frozen-lockfile',
    ft = 'toml',
  },
  {
    'neoclide/coc-prettier',
    build = 'yarn install --frozen-lockfile',
    ft = {
      'javascript',
      'typescript',
      'flow',
      'jsx',
      'json',
      'css',
      'scss',
      'less',
      'html',
      'vue',
      'ember',
      'glimmer',
      'graphql',
      'markdown',
      'yaml',
    },
  },
  {
    'kkiyama117/coc-toml',
    build = 'yarn install --frozen-lockfile',
    ft = 'toml',
  },
  {
    'fannheyward/coc-rust-analyzer',
    build = 'yarn install --frozen-lockfile',
    ft = 'rust',
  },
}
