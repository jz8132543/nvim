return {
  {
    "skywind3000/asyncrun.vim",
    event = "VeryLazy",
    cmd = { "AsyncRun" },
    config = function()
      vim.g.asyncrun_open = 6
    end,
  },
}
