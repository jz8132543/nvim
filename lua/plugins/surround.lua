return {
  -- TODO: keymaps
  {
    "kylechui/nvim-surround",
    keys = {
      { "ys" },
      { "yS" },
      { "cs" },
      { "cS" },
      { "ds" },
      { "dS" },
      { "gs", mode = "x" },
      { "gS", mode = "x" },
      { "<C-g>", mode = "i" },
    },
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          visual = "gs",
        },
        surrounds = {
          ["y"] = {
            add = function()
              local result = require("nvim-surround.config").get_input("Enter the type name: ")
              if result then
                return { { result .. "<" }, { ">" } }
              end
            end,
            find = function()
              return require("nvim-surround.config").get_selection({
                pattern = "[^=%s%(%)]+%b<>",
              })
            end,
            delete = "^(.-<)().-(>)()$",
            change = {
              target = "^.-([%w_]+)()<.->()()$",
              replacement = function()
                local result = require("nvim-surround.config").get_input("Enter new type replacement: ")
                if result then
                  return { { result }, { "" } }
                end
              end,
            },
          },
        },
      })
    end,
  },
}
