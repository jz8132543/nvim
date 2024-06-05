---@type LazyPluginSpec
return {
  -- When switching between colorschemes,
  -- this plugin cause many highlight groups can not be applied.
  "levouh/tint.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    highlight_ignore_patterns = {
      "WinSeparator",
      "EndOfBuffer",
      "LineNr",
      "IblWhitespace",
    },
    window_ignore_function = function(win)
      local buf = vim.api.nvim_win_get_buf(win)
      return vim.bo[buf].modifiable ~= true
    end,
  },
  config = function(_, opts)
    require("tint").setup(opts)

    vim.api.nvim_create_autocmd("ColorScheme", {
      desc = "Refresh tint",
      callback = function()
        -- Timeout is needed for wait all colorscheme highlights applied
        vim.defer_fn(function()
          require("tint").refresh()
        end, 100)
      end,
    })
  end,
}
