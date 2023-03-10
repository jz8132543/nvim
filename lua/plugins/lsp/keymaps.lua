local M = {}

function M.on_attach(client, buffer)
  local cap = client.server_capabilities

  require("which-key").register({
    buffer = buffer,
    ["<leader>"] = {
      c = {
        name = "+code",
        {
          cond = client.name == "tsserver",
          o = { "<cmd>:TypescriptOrganizeImports<CR>", "Organize Imports" },
          R = { "<cmd>:TypescriptRenameFile<CR>", "Rename File" },
        },
        r = { "<cmd>Lspsaga rename<CR>", "Rename" },
        a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
        f = {
          {
            require("plugins.lsp.format").format,
            "Format Document",
            cond = cap.documentFormatting,
          },
          {
            require("plugins.lsp.format").format,
            "Format Range",
            cond = cap.documentRangeFormatting,
            mode = "v",
          },
        },
        d = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
        l = {
          name = "+lsp",
          i = { "<cmd>LspInfo<cr>", "Lsp Info" },
        },
      },
      x = {
        d = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
      },
    },
    g = {
      name = "+goto",
      d = { "<cmd>Glance definitions<cr>", "Goto Definition" },
      r = { "<cmd>Glance references<cr>", "References" },
      i = { "<cmd>Glance implementations<CR>", "Goto Implementation" },
      t = { "<cmd>Glance type_definitions<cr>", "Goto Type Definition" },
      D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
      h = { "<cmd>Lspsaga lsp_finder<CR>", "LSP finder" },
    },
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Prev Diagnostic" },
    ["[w"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev WARN" },
    ["]w"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next WANR" },
    ["[e"] = {
      function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      "Prev Error",
    },
    ["]e"] = {
      function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
      end,
      "Next Error",
    },
  })
end

return M
