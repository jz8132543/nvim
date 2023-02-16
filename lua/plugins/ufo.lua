return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
        keys = {
            { "<leader>zR", "<cmd>lua require('ufo').openAllFolds<cr>",  desc = "Open All Folds" },
            { "<leader>zM", "<cmd>lua require('ufo').closeAllFolds<cr>", desc = "Close All Folds" },
        },
        config = function()
          vim.o.foldcolumn = '0' -- '0' is not bad
          vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
          vim.o.foldlevelstart = 99
          vim.o.foldenable = true
          require('ufo').setup()
        end
    },
}
