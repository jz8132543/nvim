local locals = require "locals"
local is_nixos = function()
  return vim.fn.filewritable "/etc/NIXOS"
end

local parser_install_dir = "~/.config/nvim-treesitter-parsers"
vim.opt.rtp:append(parser_install_dir)

---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = locals.treesitter_dev and "main" or "master",
  event = "VeryLazy",
  build = ":TSUpdate",
  opts = {
    ---@diagnostic disable-next-line: param-type-mismatch
    -- parser_install_dir = vim.fs.joinpath(vim.fn.stdpath "data", "site"),
    auto_install = false,
    sync_install = not is_nixos,
    -- ensure_installed = {  },
    parser_install_dir = parser_install_dir,
    highlight = {
      enable = true,
      -- Should be controlled by vimtex
      disable = { "latex" },
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    -- if vim.uv.os_uname().sysname == "Windows_NT" then
    --   require("nvim-treesitter.install").prefer_git = false
    -- end

    if locals.treesitter_dev then
      return
    end

    require("nvim-treesitter.configs").setup(opts)
  end,
}
