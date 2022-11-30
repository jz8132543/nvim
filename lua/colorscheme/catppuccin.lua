local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
  vim.notify "Could not load catppuccin"
  return
end

catppuccin.setup {
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = false,
  term_colors = false,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
    suffix = "_compiled",
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    aerial = true,
    barbar = false,
    beacon = false,
    cmp = true,
    coc_nvim = false,
    dashboard = false,
    fern = false,
    fidget = true,
    gitgutter = false,
    gitsigns = true,
    hop = true,
    illuminate = true,
    leap = false,
    lightspeed = false,
    lsp_saga = false,
    lsp_trouble = false,
    mason = true,
    markdown = true,
    mini = false,
    neogit = true,
    notify = true,
    nvimtree = true,
    overseer = true,
    pounce = false,
    symbols_outline = false,
    telekasten = false,
    telescope = true,
    treesitter = true,
    treesitter_context = false,
    ts_rainbow = true,
    vim_sneak = false,
    vimwiki = false,
    which_key = true,

    -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
    dap = {
      enabled = true,
      enable_ui = true,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
    neotree = {
      enabled = false,
      show_root = true,
      transparent_panel = false,
    },
  },
  color_overrides = {},
  highlight_overrides = {},
}

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "catppuccin.lua",
  command = "source <afile> | CatppuccinCompile",
})

vim.g.catppuccin_flavour = "mocha"
