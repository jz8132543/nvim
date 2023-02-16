return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local lsp = vim.lsp
      -- For mode, only show the first char (or first two chars to distinguish
      -- different VISUALs) plus a fancy icon
      local function simplifiedMode(str)
        return " " .. (str == "V-LINE" and "VL" or (str == "V-BLOCK" and "VB" or str:sub(1, 1)))
      end

      require("lualine").setup({
        options = {
          theme = "catppuccin",
          icons_enabled = true,
          component_separators = '|',
          section_separators = { left = '', right = '' },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          -- Left
          lualine_a = {
            { 'mode',  fmt = simplifiedMode, separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = {
            {
              "branch",
              icon = "",
            },
          },
          lualine_c = {
            -- {
            --   "diff",
            --   symbols = { added = "+", modified = "~", removed = "-" },
            -- },
            { "b:coc_current_function" },
          },
          -- Right
          lualine_x = {
            {
              "diagnostics",
              sources = { "coc" },
              -- symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              -- symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
          },
          lualine_y = {
            { function() return vim.pesc(vim.g.coc_status or '') end },
          },
          lualine_z = {
            { "bo:filetype", separator = { right = '' }, left_padding = 2 },
          },
        },

        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {
          "aerial",
          "fugitive",
          "man",
          "quickfix",
          "fzf",
          "nvim-tree"
        },
      })
    end,
  },
}
