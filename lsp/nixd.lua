local hostname = vim.fn.hostname()
local username = os.getenv('USER')
---@type vim.lsp.Config
return {
  settings = {
    nixd = {
      formatting = {
        command = { 'nixfmt' },
      },
      nixpkgs = {
        expr = 'import (builtins.getFlake ("git+file://" + toString ./.)).inputs.nixpkgs {  }',
      },
      options = {
        nixos = {
          expr = string.format(
            '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.%s.options',
            hostname
          ),
        },
        home_manager = {
          expr = string.format(
            '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."%s@%s".options',
            username,
            hostname
          ),
        },
      },
    },
  },
}
