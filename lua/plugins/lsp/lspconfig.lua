local custom = require "custom"

---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = {
    "Filetype",
  },
  dependencies = {
    "folke/neoconf.nvim",
  },
  config = function()
    require("lspconfig.ui.windows").default_options.border = custom.border
    local lspconfig = require "lspconfig"
    local capabilities = require "capabilities"

    --[[
    lspconfig.nixd.setup {
      settings = {
        nixd = {
          nixpkgs = {
            expr = 'import (builtins.getFlake "/home/ofseed/flake").inputs.nixpkgs {  }',
          },
          options = {
            nixos = {
              expr = '(builtins.getFlake "/home/ofseed/flake").nixosConfigurations.ofseed.options',
            },
            home_manager = {
              expr = '(builtins.getFlake "/home/ofseed/flake").homeConfigurations.ofseed.options',
            },
          },
        },
      },
    }
    --]]
    --
    require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

    lspconfig.nil_ls.setup {
      settings = {
        ["nil"] = {
          formatting = {
            command = { "nixfmt" },
          },
        },
      },
    }
    lspconfig.nixd.setup({
   settings = {
      nixd = {
         formatting = {
            command = { "nixfmt" },
         },
      },
   },
})

    lspconfig.pyright.setup {
      cmd = { "delance-langserver", "--stdio" },
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
            inlayHints = {
              callArgumentNames = "partial",
              functionReturnTypes = true,
              pytestParameters = true,
              variableTypes = true,
            },
          },
        },
      },
    }

    lspconfig.clangd.setup {
      cmd = { "clangd", "--header-insertion-decorators=0" },
      capabilities = capabilities,
    }
  end,
  keys = {
    {
      "<leader>lR",
      function()
        vim.cmd.LspRestart()
      end,
      desc = "Reload",
    },
    {
      "<leader>lI",
      function()
        vim.cmd.LspInfo()
      end,
      desc = "Info",
    },
  },
}
