local M = {}

function M.on_attach(client, buffer)
  local cap = client.server_capabilities

  require("which-key").register({
    buffer = buffer,
    ["<leader>"] = {
      c = {
        name = "+code",
        r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        d = { "<cmd>lua vim.diagnostic.open_float({scope='line'})<CR>", "Line Diagnostics" },
        D = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
        f = {
          { "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", "Format" },
          {
            "<cmd>lua vim.lsp.buf.range_formatting({ timeout_ms = 2000 })<CR>",
            "Range Format",
            mode = "v",
          },
        },
        l = {
          name = "+lsp",
          i = { "<cmd>LspInfo<cr>", "Lsp Info" },
          I = { "<cmd>lua print(vim.inspect(vim.lsp.get_active_clients()))<cr>", "Lsp Details" },
        },
      },
    },
    g = {
      name = "+goto",
      d = { "<cmd>Glance definitions<cr>", "Goto Definition" },
      r = { "<cmd>Glance references<cr>", "References" },
      i = { "<cmd>Glance implementations<CR>", "Goto Implementation" },
      t = { "<cmd>Glance type_definitions<cr>", "Goto Type Definition" },
      D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
    },
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Prev Diagnostic" },
    ["[e"] = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Next ERROR" },
    ["]e"] = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev ERROR" },
    ["<F9>"] = { name = "Run" },
  })
end

return M
