local config = {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = true,
    focusable = true,
    style = 'minimun',
    border = "rounded",
  },
}

local M = {}

function M.apply()
  vim.diagnostic.config(config)

  for type, icon in pairs(require("config.icons").diagnostics) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
  end
end

return M
