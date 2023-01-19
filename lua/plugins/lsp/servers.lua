-- Add any servers here together with their settings
---@type lspconfig.options
local servers = {
  bashls = {},
  clangd = {},
  cmake = {},
  cssls = {},
  tsserver = {},
  html = {},
  jsonls = {},
  yamlls = {},
  nil_ls = {
    formatting = {
      command = { "nixpkgs-fmt" },
    },
  },
  pylsp = {
    pylsp = {
      plugins = {
        jedi_completion = { fuzzy = true },
        pydocstyle = { enabled = true },
        pylint = { enabled = true, executable = "pylint" },
        rope_autoimport = { enabled = true },
        rope_completion = { enabled = true },
        pyls_isort = { enabled = true },
        pylsp_mypy = { enabled = true },
        black = { enabled = true },
        isort = { enabled = true },
      },
    },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = {
          globals = { "vim", "use" },
        },
      },
    },
  },
}

return servers
