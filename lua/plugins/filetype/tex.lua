---@type LazyPluginSpec
return {
  "lervag/vimtex",
  ft = { "tex" },
  config = function()
    vim.g.tex_flavor = "latex"

    vim.g.vimtex_mappings_prefix = "<localleader>"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_compiler_latexmk_engines = { _ = "-xelatex" }
    vim.g.vimtex_compiler_latexrun_engines = { _ = "xelatex" }
    vim.g.vimtex_compiler_progname = "nvr"
    vim.g.vimtex_toc_config = {
      name = "TOC",
      layers = { "content", "todo", "include" },
      split_width = 25,
      todo_sorted = 0,
      show_help = 1,
      show_numbers = 1,
    }
  end,
}
