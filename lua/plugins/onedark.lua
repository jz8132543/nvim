-- https://github.com/isaksamsten/nvim-config
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function(_, opts)
    local theme = require("catppuccin")
    theme.setup(opts)
    vim.cmd([[colorscheme catppuccin]])
  end,
  opts = function()
    local Color = require("helpers.color")
    local overrides = function(lighten, darken)
      local function override(colors)
        local fg_border = lighten(colors.base, 3)
        local telescope_prompt = darken(colors.base, 3)
        local telescope_results = darken(colors.base, 4)
        local telescope_preview = darken(colors.base, 6)
        local telescope_selection = darken(colors.base, 8)
        local faded_yellow = Color.mix(colors.base, colors.yellow, 0.1)
        local faded_red = Color.mix(colors.base, colors.red, 0.1)
        local faded_purple = Color.mix(colors.base, colors.mauve, 0.1)
        local neotree_cursorline_bg = Color.mix(colors.mantle, colors.text, 0.01)

        local gray = colors.subtext0
        local fg = colors.text
        local purple = colors.mauve
        local green = colors.green
        local blue = colors.blue
        local yellow = colors.yellow
        local red = colors.red
        local cyan = colors.sky
        local float_bg = colors.mantle

        return {
          ToggleTermNormal = { bg = colors.mantle },
          IndentBlanklineContextChar = { fg = colors.surface1 },
          IndentBlanklineChar = { fg = colors.surface1 },

          TelescopeBorder = {
            fg = telescope_results,
            bg = telescope_results,
          },
          TelescopePromptBorder = {
            fg = telescope_prompt,
            bg = telescope_prompt,
          },
          TelescopePromptCounter = { fg = fg },
          TelescopePromptNormal = { fg = fg, bg = telescope_prompt },
          TelescopePromptPrefix = {
            fg = purple,
            bg = telescope_prompt,
          },
          TelescopePromptTitle = {
            fg = telescope_prompt,
            bg = purple,
          },
          TelescopePreviewTitle = {
            fg = telescope_results,
            bg = green,
          },
          TelescopeResultsTitle = {
            fg = telescope_results,
            bg = telescope_results,
          },
          TelescopeMatching = { fg = blue },
          TelescopeNormal = { bg = telescope_results },
          TelescopeSelection = { bg = telescope_selection },
          TelescopePreviewNormal = { bg = telescope_preview },
          TelescopePreviewBorder = { fg = telescope_preview, bg = telescope_preview },
          NeoTreeCursorLine = { bg = neotree_cursorline_bg, bold = true },
          NeoTreeTabActive = { bg = colors.mantle, bold = true },
          NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
          NeoTreeTabInactive = { bg = colors.mantle, fg = colors.overlay0 },
          NeoTreeTabSeparatorInactive = { fg = colors.mantle, bg = colors.mantle },
          NeoTreeNormal = { fg = colors.text, bg = colors.mantle },
          NeoTreeNormalNC = { fg = colors.text, bg = colors.mantle },

          LineNr = { fg = colors.overlay0 },
          CursorLineNr = { fg = colors.lavender, bold = true },
          -- Cmp
          CmpItemAbbrMatch = { fg = blue, bold = true },
          CmpItemAbbrMatchFuzzy = { fg = blue, underline = true },
          CmpItemMenu = { fg = colors.surface1, italic = true },
          -- CmpItemAbbr = { fg = colors.surface2 },

          -- Neotest
          NeotestAdapterName = { fg = purple, bold = true },
          NeotestFocused = { bold = true },
          NeotestNamespace = { fg = blue, bold = true },

          -- Neotree
          NeoTreeRootName = { fg = purple, bold = true },
          NeoTreeFileNameOpened = { fg = purple, italic = true },

          -- DAP
          -- DebugBreakpoint = { fg = "${red}", bold = true },
          -- DebugHighlightLine = { fg = "${purple}", italic = true },
          NvimDapVirtualText = { fg = cyan, italic = true },

          -- DAP UI
          DapUIBreakpointsCurrentLine = { fg = yellow, bold = true },

          DiagnosticUnderlineError = { sp = red, undercurl = true },
          DiagnosticUnderlineWarn = { sp = yellow, undercurl = true },
          DiagnosticUnderlineInfo = { sp = blue, undercurl = true },
          DiagnosticUnderlineHint = { sp = cyan, undercurl = true },

          DiagnosticFloatingSuffix = { fg = gray },
          DiagnosticFloatingHint = { fg = fg },
          DiagnosticFloatingWarn = { fg = fg },
          DiagnosticFloatingInfo = { fg = fg },
          DiagnosticFloatingError = { fg = fg },

          ModeMsg = { fg = fg, bg = colors.mantle },
          MsgArea = { fg = fg, bg = colors.mantle },

          NoiceMini = { link = "NonText" },
          NoiceVirtualText = { link = "NonText" },
          NoiceCmdline = { fg = fg, bg = colors.mantle },
          NoiceCmdlinePopup = { link = "PopupNormal" },
          NoiceCmdlinePopupBorder = { link = "PopupBorder" },
          NoiceCmdlinePrompt = { link = "PopupNormal" },
          NoiceConfirm = { link = "PopupNormal" },
          NoiceConfirmBorder = { link = "PopupBorder" },

          EdgyTitle = { fg = colors.text, bg = colors.mantle },
          Winbar = { bg = colors.mantle },
          AIHighlight = { link = "NonText" },
          AIIndicator = { link = "DiagnosticSignInfo" },

          PopupNormal = { bg = float_bg },
          PopupBorder = { bg = float_bg, fg = fg_border },
          Pmenu = { link = "PopupNormal" },
          PmenuSel = { bold = true, bg = "none" },
          PmenuBorder = { link = "PopupBorder" },
          PmenuDocBorder = { bg = float_bg, fg = fg_border },
          NormalFloat = { bg = float_bg },
          FloatNormal = { link = "NormalFloat" },
          DapUINormalFloat = { link = "FloatNormal" },
          FloatBorder = { bg = float_bg, fg = fg_border },
          DapUIFloatBorder = { link = "FloatBorder" },
          FloatTitle = { fg = colors.lavender, bg = float_bg },
          BqfPreviewBorder = { link = "PopupBorder" },
          BqfPreviewFloat = { link = "PopupNormal" },
          DebugLogPoint = { fg = purple, bg = faded_purple },
          DebugLogPointLine = { fg = purple, bg = faded_purple },
          DebugStopped = { fg = yellow, bg = faded_yellow },
          DebugStoppedLine = { fg = yellow, bg = faded_yellow },
          DebugBreakpoint = { fg = red, bg = faded_red },
          DebugBreakpointLine = { fg = red, bg = faded_red },
          WinSeparator = { fg = colors.mantle, bg = colors.mantle },

          StatusColumnSeparator = { fg = colors.surface0, bg = "NONE" },
          SignColumn = { fg = colors.surface0 },

          TabLineHead = { bg = blue, fg = colors.base },
          TabLineFill = { bg = colors.mantle, fg = gray },
          TabLine = { bg = colors.mantle, fg = gray },
          TabLineSel = { bg = colors.mantle, fg = fg, bold = true },

          NotifyERRORBorder = { link = "PopupBorder" },
          NotifyWARNBorder = { link = "PopupBorder" },
          NotifyINFOBorder = { link = "PopupBorder" },
          NotifyDEBUGBorder = { link = "PopupBorder" },
          NotifyTRACEBorder = { link = "PopupBorder" },
          NotifyERRORIcon = { link = "DiagnosticSignError" },
          NotifyWARNIcon = { link = "DiagnosticSignWarn" },
          NotifyINFOIcon = { link = "DiagnosticSignInfo" },
          NotifyDEBUGIcon = { link = "DiagnosticSignInfo" },
          NotifyTRACEIcon = { link = "DiagnosticSignInfo" },
          NotifyERRORTitle = { fg = colors.text, bold = true },
          NotifyWARNTitle = { fg = colors.text, bold = true },
          NotifyINFOTitle = { fg = colors.text, bold = true },
          NotifyDEBUGTitle = { fg = colors.text, bold = true },
          NotifyTRACETitle = { fg = colors.text, bold = true },
          NotifyERRORBody = { link = "NormalFloat" },
          NotifyWARNBody = { link = "NormalFloat" },
          NotifyINFOBody = { link = "NormalFloat" },
          NotifyDEBUGBody = { link = "NormalFloat" },
          NotifyTRACEBody = { link = "NormalFloat" },
        }
      end
      return override
    end

    return {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = { "bold" },
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "bold" },
        operators = {},
      },
      color_overrides = {},
      highlight_overrides = {
        mocha = overrides(Color.lighten, Color.darken),
        macchiato = overrides(Color.lighten, Color.darken),
        frappe = overrides(Color.lighten, Color.darken),
        latte = overrides(Color.darken, Color.darken),
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = true,
        markdown = false,
        headlines = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    }
  end,
}
