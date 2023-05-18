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
  taplo = {},
  nil_ls = {
    settings = {
      ["nil"] = {
        formatting = {
          command = { "alejandra" },
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
        pyls_isort = { enabled = true },
        pylsp_mypy = { enabled = true },
      },
    },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
          maxPreload = 10000,
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
