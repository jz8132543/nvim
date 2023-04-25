local function lsp_list()
  local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
  local buf_client_names = {}

  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  return table.concat(buf_client_names, ", ")
end

local function formatters_list()
  local formatters = require("plugins.lsp.format")

  local buf_ft = vim.bo.filetype
  local supported_formatters = formatters.list_registered(buf_ft)
  return table.concat(supported_formatters, ", ")
end

local lsp_client = function()
  local lsp = lsp_list()
  -- local text = " LSP:"
  local text = ""
  if lsp == "" then
    text = "%#WinSeparator#" .. text .. "%*"
  end
  return vim.trim(vim.fn.join({ text, lsp }, " "))
end

local formatters = function()
  local formatters = formatters_list()
  -- local text = " Format:"
  local text = ""
  if formatters == "" then
    text = "%#WinSeparator#" .. text .. "%*"
  end
  return vim.trim(vim.fn.join({ text, formatters }, " "))
end

local function simplifiedMode(str)
  return " " .. (str == "V-LINE" and "VL" or (str == "V-BLOCK" and "VB" or str:sub(1, 1)))
end

local function customLocation()
  return "%3l/%-3L:%-2v [%3p%%]"
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          -- component_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = simplifiedMode,
            },
          },
          lualine_b = {
            {
              "branch",
              icon = "",
            },
          },
          lualine_c = {
            {
              "diff",
              symbols = { added = "+", modified = "~", removed = "-" },
            },
          },
          lualine_x = {
            { lsp_client },
            { formatters },
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
          },
          lualine_y = {
            { "filetype" },
          },
          lualine_z = {
            customLocation,
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
        },
      })
    end,
  },
}
