return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        term_colors = false,
        transparent_background = false,
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          coc_nvim = false,
          lsp_trouble = false,
          cmp = true,
          lsp_saga = false,
          gitgutter = false,
          gitsigns = true,
          leap = false,
          telescope = true,
          nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
          },
          neotree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
          },
          dap = {
            enabled = false,
            enable_ui = false,
          },
          which_key = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          dashboard = true,
          neogit = false,
          vim_sneak = false,
          fern = false,
          barbar = false,
          bufferline = true,
          markdown = true,
          lightspeed = false,
          ts_rainbow = true,

          hop = false,
          notify = true,
          telekasten = false,
          symbols_outline = false,
          mini = false,
          aerial = false,
          vimwiki = true,
          beacon = false,

          navic = false,
          overseer = false,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
