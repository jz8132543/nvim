local M = {}

M.autoformat = true

function M.toggle()
  M.autoformat = not M.autoformat
  vim.notify(M.autoformat and "Enabled format on save" or "Disabled format on save")
end

function M.format()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype
  local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format({
    bufnr = buf,
    filter = function(client)
      if have_nls then
        return client.name == "null-ls"
      end
      return client.name ~= "null-ls"
    end,
  })
end

function M.list_registered_providers_names(filetype)
  local available_sources = require("null-ls.sources").get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

function M.list_registered(filetype)
  local registered_providers = M.list_registered_providers_names(filetype)
  return registered_providers[require("null-ls").methods.FORMATTING] or {}
end

function M.on_attach(client, bufnr)
  -- Enable formatting for ranges
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  -- Lsp signature
  require("lsp_signature").on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded",
    },
  }, bufnr)
  -- key maps
  require("plugins.lsp.keymaps").on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormat", {}),
      buffer = bufnr,
      callback = function()
        if M.autoformat then
          M.format()
        end
      end,
    })
  end
end

return M
