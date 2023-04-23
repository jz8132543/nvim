-- Add any servers here together with their settings
-- @type lspconfig.options
local servers = {
  bashls = {},
  cmake = {},
  cssls = {},
  tsserver = {},
  html = {},
  jsonls = {},
  yamlls = {},
  nil_ls = {
    settings = {
      ["nil"] = {
        formatting = {
          command = { "nixpkgs-fmt" },
        },
      },
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
        hint = {
          enable = true,
          setType = true,
          arrayIndex = "Disable",
        },
        codelens = {
          enable = true,
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
