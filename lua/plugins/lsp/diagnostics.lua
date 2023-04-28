local function format_diagnostic(diagnostic)
  local icon = ""
  if diagnostic.severity == vim.diagnostic.severity.ERROR then
    icon = "" -- Nerd font icon for error
  elseif diagnostic.severity == vim.diagnostic.severity.WARN then
    icon = "" -- Nerd font icon for warning
  elseif diagnostic.severity == vim.diagnostic.severity.INFO then
    icon = "" -- Nerd font icon for info
  end

  local message = string.format("%s %s", icon, diagnostic.message)
  -- if diagnostic.code and diagnostic.source then
  --   message = string.format("%s [%s][%s] %s", icon, diagnostic.source, diagnostic.code, diagnostic.message)
  -- elseif diagnostic.code or diagnostic.source then
  --   message = string.format("%s [%s] %s", icon, diagnostic.code or diagnostic.source, diagnostic.message)
  -- end

  return message .. " "
end

local config = {
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    focusable = false,
    header = { "" .. " Diagnostics:", "DiagnosticInfo" },
    scope = "line",
    suffix = "",
    source = false,
    format = format_diagnostic,
  },
  float = false,
  virtual_text = {
    prefix = "",
    spacing = 2,
    source = false,
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
    format = format_diagnostic,
  },
}

local M = {}

function M.apply()
  vim.diagnostic.config(config)

  for type, icon in pairs(require("config.icons").diagnostics) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

return M
