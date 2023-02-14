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
  rust_analyzer = {
    diagnostics = { experimental = { enable = true } },
    checkOnSave = {
      command = "clippy",
    },
  },
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
