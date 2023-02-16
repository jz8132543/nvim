return {
    require("plugins.lsp.servers"),
    {
        "neoclide/coc.nvim",
        branch = 'release',
        lazy = false,
        dependencies = {
            "rafcamlet/coc-nvim-lua",
            "tpope/vim-sleuth",
        },
        config = function()
            vim.opt.signcolumn = "yes"
            -- Use K to show documentation in preview window
            function _G.show_docs()
                local cw = vim.fn.expand('<cword>')
                if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                    vim.api.nvim_command('h ' .. cw)
                elseif vim.api.nvim_eval('coc#rpc#ready()') then
                    vim.fn.CocActionAsync('doHover')
                else
                    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
                end
            end

            -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
            vim.api.nvim_create_augroup("CocGroup", {})
            vim.api.nvim_create_autocmd("CursorHold", {
                group = "CocGroup",
                command = "silent call CocActionAsync('highlight')",
                desc = "Highlight symbol under cursor on CursorHold"
            })
            -- Setup formatexpr specified filetype(s)
            vim.api.nvim_create_autocmd("FileType", {
                group = "CocGroup",
                pattern = "typescript,json",
                command = "setl formatexpr=CocAction('formatSelected')",
                desc = "Setup formatexpr specified filetype(s)."
            })

            -- Update signature help on jump placeholder
            vim.api.nvim_create_autocmd("User", {
                group = "CocGroup",
                pattern = "CocJumpPlaceholder",
                command = "call CocActionAsync('showSignatureHelp')",
                desc = "Update signature help on jump placeholder"
            })
            -- auto complete
            local opts = { silent = true, noremap = true, expr = true }
            vim.api.nvim_set_keymap("i", "<C-j>",
                'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
            vim.api.nvim_set_keymap("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
            vim.api.nvim_set_keymap("i", "<TAB>",
                [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
        end,
        keys = {
            { '[e',         '<Plug>(coc-diagnostic-prev)' },
            { ']e',         '<Plug>(coc-diagnostic-next)' },
            { 'K',          '<cmd>lua _G.show_docs()<cr>' },

            { '<leader>s',  '<cmd>CocList outline<cr>',                        { desc = "Symbols" } },
            { '<leader>cr', '<Plug>(coc-rename)',                              { desc = "Rename" } },
            { '<leader>cq', '<Plug>(coc-fix-current)',                         { silent = true, desc = "Quickfix" } },
            -- { '<leader>ca', '<Plug>(coc-codeaction)', { silent = true, desc = "Code Actions" } },
            { '<leader>cf', '<cmd>call CocActionAsync("format")<cr>',          desc = "Format" },
            { 'gd',         '<cmd>call CocActionAsync("definitionHover")<cr>', desc = "Definition" },
            { 'gD',         '<Plug>(coc-definition)',                          desc = "Definition" },
            -- { 'gD',         '<Plug>(coc-declaration)',                         desc = "Declaration" },
            { 'gr',         '<Plug>(coc-references)',                          desc = "References" },
            { 'gi',         '<Plug>(coc-implementation)',                      desc = "Implementation" },
            { 'gt',         '<Plug>(coc-type-definition)',                     desc = "Type Definition" },
        },
    },
}
