-- vim:foldmethod=marker
---@diagnostic disable: different-requires
-- Automatically download packer.nvim if it doesn't exist
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd "packadd packer.nvim"
end

-- Automatically run :PackerCompile after every time this file is changed
vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "packer_user_config",
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

local packer = require "packer"

-- Use packer.nvim to manage all of the plugins
return packer.startup {
  function(use)
    -- Core {{{
    use { "wbthomason/packer.nvim" }

    use {
      "neovim/nvim-lspconfig",
      config = function()
        require "core.lspconfig"
      end,
      requires = { "williamboman/mason-lspconfig.nvim" },
      after = "mason.nvim",
    }

    use {
      "williamboman/mason.nvim",
      config = function()
        require "core.mason"
      end,
    }

    use {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "core.null-ls"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "neovim/nvim-lspconfig" },
      },
    }

    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require "core.project"
      end,
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "core.treesitter"
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "windwp/nvim-ts-autotag" },
        { "p00f/nvim-ts-rainbow" },
        { "RRethy/nvim-treesitter-endwise" },
        { "RRethy/nvim-treesitter-textsubjects", disable = true },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
      },
    }

    use {
      "stevearc/overseer.nvim",
      config = function()
        require "core.overseer"
      end,
    }

    use { "tpope/vim-unimpaired" }

    use { "tpope/vim-sleuth" }

    use {
      "folke/which-key.nvim",
      config = function()
        require "core.which-key"
      end,
    }

    use {
      "linty-org/key-menu.nvim",
      disable = true,
      -- Alternative to which-key.nvim
    }

    use {
      "b0o/mapx.nvim",
      disable = true,
      -- Plugin organize keymaps
      -- Disable because lots of refactorings needs to be done
    }

    use { "lewis6991/impatient.nvim" }

    use {
      "nathom/filetype.nvim",
      config = function()
        require "core.filetype"
      end,
    }

    use {
      "ii14/emmylua-nvim",
      opt = true,
    }
    -- }}}

    -- Text Editing {{{
    use {
      "github/copilot.vim",
      config = function()
        require "edit.copilot"
      end,
    }

    use {
      "hrsh7th/nvim-cmp",
      config = function()
        require "edit.cmp"
      end,
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/cmp-calc" },
        { "kdheepak/cmp-latex-symbols" },
        { "saadparwaiz1/cmp_luasnip" },
        { "kristijanhusak/vim-dadbod-completion" },
        { "lukas-reineke/cmp-under-comparator" },
      },
    }

    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require "edit.luasnip"
      end,
    }

    use {
      "rafamadriz/friendly-snippets",
      disable = true,
    }

    use {
      "b3nj5m1n/kommentary",
      config = function()
        require "edit.kommentary"
      end,
    }

    use {
      "kylechui/nvim-surround",
      config = function()
        require "edit.surround"
      end,
    }

    use {
      "lewis6991/spellsitter.nvim",
      config = function()
        require "edit.spellsitter"
      end,
      disable = true,
      -- Spell check is less needed at this time
    }

    use {
      "brymer-meneses/grammar-guard.nvim",
      disable = true,
      -- Now grammar check is provided by ltex languages server
    }

    use {
      "windwp/nvim-autopairs",
      config = function()
        require "edit.autopairs"
      end,
    }

    use {
      "dhruvasagar/vim-table-mode",
      ft = { "markdown", "org" },
    }

    use {
      "ekickx/clipboard-image.nvim",
      disable = true,
    }

    use {
      "ThePrimeagen/refactoring.nvim",
      config = function()
        require "edit.refactoring"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
      },
      disable = true,
      -- Plugin surpporting refactorings
      -- Disable because it needs neovim nightly
    }
    -- }}}

    -- Interface Extension {{{
    use {
      "stevearc/stickybuf.nvim",
      disable = true,
      -- Disable because it brings a more buggy behavior
      -- https://github.com/neovim/neovim/issues/12517
    }

    use {
      "folke/noice.nvim",
      config = function()
        require "interface.noice"
      end,
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
      },
    }

    use {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require "interface.bufferline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require "interface.lualine"
      end,
      requires = {
        { "kyazdani42/nvim-web-devicons" },
        { "ofseed/lualine-copilot" },
      },
    }

    use {
      "SmiteshP/nvim-navic",
      config = function()
        require "interface.navic"
      end,
    }

    use {
      "utilyre/barbecue.nvim",
      config = function()
        require "interface.barbecue"
      end,
      requires = {
        "neovim/nvim-lspconfig",
        "smiteshp/nvim-navic",
        "kyazdani42/nvim-web-devicons",
      },
    }

    use {
      "RRethy/vim-illuminate",
      config = function()
        require "interface.illuminate"
      end,
    }

    use {
      "kevinhwang91/nvim-ufo",
      config = function()
        require "interface.ufo"
      end,
      requires = "kevinhwang91/promise-async",
    }

    use {
      "kevinhwang91/nvim-hlslens",
      config = function()
        require "interface.hlslens"
      end,
      disable = true,
    }

    use {
      "m-demare/hlargs.nvim",
      config = function()
        require "interface.hlargs"
      end,
      after = "catppuccin",
      -- hlargs should be loaded after colorscheme
    }

    use {
      "zbirenbaum/neodim",
      config = function()
        require "interface.dim"
      end,
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "interface.indent-blankline"
      end,
    }

    use {
      "stevearc/dressing.nvim",
      config = function()
        require "interface.dressing"
      end,
    }

    use {
      "ray-x/lsp_signature.nvim",
      config = function()
        require "interface.lsp_signature"
      end,
      disable = true,
      -- Unknow reason causes unknown errors
    }

    use {
      "onsails/lspkind-nvim",
      config = function()
        require "interface.lspkind"
      end,
    }

    use {
      "weilbith/nvim-code-action-menu",
      cmd = { "CodeActionMenu" },
      disable = true,
      -- Disable because it not stable
    }

    use {
      "goolord/alpha-nvim",
      config = function()
        require "interface.alpha"
      end,
    }

    use {
      "j-hui/fidget.nvim",
      config = function()
        require "interface.fidget"
      end,
    }

    use {
      "rcarriga/nvim-notify",
      config = function()
        require "interface.notify"
      end,
    }

    use {
      "nvim-treesitter/nvim-treesitter-context",
      config = function()
        require "interface.treesitter-context"
      end,
      disable = true, -- Disable because it is not using LSP, navic instead
    }

    use {
      "uga-rosa/ccc.nvim",
      config = function()
        require "interface.ccc"
      end,
    }

    use { "dstein64/nvim-scrollview" }

    use {
      "lewis6991/satellite.nvim",
      config = function()
        require "interface.satellite"
      end,
      disable = true,
      -- A substitue for nvim-scrollview
      -- which support search results, lsp diagnostics and git hunks
      -- Disable because it's work in progress
    }

    use {
      "kevinhwang91/nvim-bqf",
      config = function()
        require "interface.bqf"
      end,
    }

    use {
      "kevinhwang91/nvim-fFHighlight",
      config = function()
        require "interface.ffhighlight"
      end,
      disable = true,
      -- Plugin show inline search highlight
      -- Disable because it's not very useful
    }

    use {
      "folke/todo-comments.nvim",
      config = function()
        require "interface.todo-comments"
      end,
    }

    use {
      "folke/zen-mode.nvim",
      config = function()
        require "interface.zen-mode"
      end,
      cmd = { "ZenMode" },
    }

    use {
      "winston0410/range-highlight.nvim",
      config = function()
        require "interface.range-highlight"
      end,
      requires = {
        "winston0410/cmd-parser.nvim",
      },
    }

    use {
      "psliwka/vim-smoothie",
      disable = true,
      -- Try to get rid of dependency on moving animations.
    }

    use {
      "edluffy/specs.nvim",
      config = function()
        require "interface.specs"
      end,
      disable = true,
      -- Disable because it's conflicting with the chinese text
    }

    use {
      "chentoast/marks.nvim",
      config = function()
        require "interface.marks"
      end,
      disable = true,
      -- Disable causes the value of v:oldfiles to be messed up
    }

    use {
      "tversteeg/registers.nvim",
      config = function()
        require "interface.registers"
      end,
      disable = true,
      -- Behaves strangely when used with text objects
    }

    use {
      "edluffy/hologram.nvim",
      disable = true,
    }

    use {
      "jubnzv/virtual-types.nvim",
      disable = true,
      -- Disable because few languages sever support it
    }

    use {
      "bennypowers/nvim-regexplainer",
      config = function()
        require "interface.regexplainer"
      end,
      requires = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
      },
    }

    use {
      "jbyuki/nabla.nvim",
      config = function()
        require "interface.nabla"
      end,
      ft = { "tex", "markdown" },
    }

    use {
      "sunjon/Shade.nvim",
      config = function()
        require "interface.shade"
      end,
      disable = true,
      -- Disable because conflict with other floating window plugins
    }

    use {
      "luukvbaal/stabilize.nvim",
      config = function()
        require "interface.stabilize"
      end,
      disable = true,
    }
    -- }}}

    -- {{{ Colorscheme
    use {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require "colorscheme.catppuccin"
      end,
      run = ":CatppuccinCompile",
    }

    use {
      "folke/tokyonight.nvim",
      config = function()
        require "colorscheme.tokyonight"
      end,
    }

    use {
      "rose-pine/neovim",
      as = "rose-pine",
      config = function()
        require "colorscheme.rose-pine"
      end,
    }

    use {
      "navarasu/onedark.nvim",
      config = function()
        require "colorscheme.onedark"
      end,
    }

    use {
      "ellisonleao/gruvbox.nvim",
      config = function()
        require "colorscheme.gruvbox"
      end,
    }
    -- }}}

    -- Tool Integration {{{
    use {
      "nvim-tree/nvim-tree.lua",
      config = function()
        require "tool.tree"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
      "sidebar-nvim/sidebar.nvim",
      config = function()
        require "config.interface.sidebar"
      end,
      requires = { "sidebar-nvim/sections-dap" },
      disable = true,
    }

    use {
      "nvim-neo-tree/neo-tree.nvim",
      config = function()
        require "tool.neo-tree"
      end,
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
      },
      disable = true,
    }

    use {
      "simrat39/symbols-outline.nvim",
      config = function()
        require "tool.symbols-outline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
      cmd = { "SymbolsOutline" },
      disable = true,
      -- Subtitute for aerial.nvim
      -- Disable because better to use aerial.nvim
    }

    use {
      "onsails/diaglist.nvim",
      disable = true,
    }

    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require "tool.toggleterm"
      end,
      tag = "v2.*",
    }

    use {
      "stevearc/aerial.nvim",
      config = function()
        require "tool.aerial"
      end,
    }

    use {
      "gorbit99/codewindow.nvim",
      config = function()
        require "tool.codewindow"
      end,
      disable = true,
    }

    use {
      "s1n7ax/nvim-window-picker",
      tag = "v1.*",
      config = function()
        require "tool.window-picker"
      end,
    }

    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require "tool.gitsigns"
      end,
      requires = "nvim-lua/plenary.nvim",
    }

    use {
      "TimUntersberger/neogit",
      config = function()
        require "tool.neogit"
      end,
      requires = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
      },
      cmd = { "Neogit" },
    }

    use {
      "sindrets/diffview.nvim",
      config = function()
        require "tool.diffview"
      end,
      cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    }

    use {
      "akinsho/git-conflict.nvim",
      config = function()
        require "tool.git-conflict"
      end,
    }

    use {
      "ruifm/gitlinker.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require "tool.gitlinker"
      end,
    }

    use {
      "tpope/vim-fugitive",
    }

    use {
      "aserowy/tmux.nvim",
      config = function()
        require "tool.tmux"
      end,
    }

    use {
      "iamcco/markdown-preview.nvim",
      config = function()
        require "tool.markdown-preview"
      end,
      run = "cd app && yarn install",
      ft = { "markdown" },
    }

    use {
      "Saecki/crates.nvim",
      config = function()
        require "tool.crates"
      end,
      requires = { "nvim-lua/plenary.nvim" },
      event = { "BufRead Cargo.toml" },
    }

    use {
      "vuki656/package-info.nvim",
      config = function()
        require "tool.package-info"
      end,
      requires = "MunifTanjim/nui.nvim",
      event = {
        "BufRead package.json",
        "BufRead package-lock.json",
      },
    }

    use {
      "pwntester/octo.nvim",
      config = function()
        require "tool.octo"
      end,
      cmd = { "Octo" },
      disable = true,
      -- Subtitute for gh.nvim
      -- Disable because better to use gh.nvim
    }

    use {
      "ldelossa/gh.nvim",
      config = function()
        require "tool.gh"
      end,
      requires = "ldelossa/litee.nvim",
      disable = true,
      -- Disable since it could not work properly
    }

    use {
      "tpope/vim-dadbod",
      disable = true,
    }

    use {
      "kristijanhusak/vim-dadbod-ui",
      cmd = { "DBUIToggle" },
      disable = true,
    }

    use {
      "nvim-orgmode/orgmode",
      config = function()
        require "tool.orgmode"
      end,
      disable = true,
      -- Need reconfigre, especially keymaps
    }

    use {
      "akinsho/org-bullets.nvim",
      config = function()
        require "tool.org-bullets"
      end,
      ft = { "org" },
      disable = true,
      -- Disable with orgmode
    }

    use {
      "lalitmee/browse.nvim",
      requires = { "nvim-telescope/telescope.nvim" },
      disable = true,
    }

    use {
      "rest-nvim/rest.nvim",
      config = function()
        require "tool.rest"
      end,
      ft = { "http" },
    }

    use {
      "martineausimon/nvim-lilypond-suite",
      requires = { "MunifTanjim/nui.nvim" },
      config = function()
        require "tool.lilypond-suite"
      end,
      ft = { "lilypond" },
    }
    -- }}}

    -- Efficiency Improvement {{{
    use {
      "nvim-telescope/telescope.nvim",
      config = function()
        require "efficiency.telescope"
      end,
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "nvim-telescope/telescope-hop.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" },
        { "nvim-telescope/telescope-dap.nvim" },
        { "benfowler/telescope-luasnip.nvim" },
      },
      branch = "0.1.x",
    }

    use {
      "phaazon/hop.nvim",
      config = function()
        require "efficiency.hop"
      end,
      branch = "v2",
    }

    use {
      "mfussenegger/nvim-treehopper",
      config = function()
        require "efficiency.treehopper"
      end,
    }

    use { "kevinhwang91/vim-ibus-sw" }

    use {
      "ethanholz/nvim-lastplace",
      config = function()
        require "efficiency.lastplace"
      end,
    }

    use {
      "Shatur/neovim-session-manager",
      config = function()
        require "efficiency.session-manager"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
    }

    use {
      "dstein64/vim-startuptime",
      cmd = { "StartupTime" },
    }

    use {
      "sindrets/winshift.nvim",
      disable = true,
    }

    -- }}}

    -- Debug And Run {{{
    use {
      "michaelb/sniprun",
      config = function()
        require "debug.sniprun"
      end,
      run = "bash install.sh",
    }

    use {
      "rcarriga/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
      },
      disable = true,
    }

    use {
      "rafcamlet/nvim-luapad",
      disable = true,
    }

    use {
      "mfussenegger/nvim-dap",
      config = function()
        require "debug.dap"
      end,
    }

    use {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require "debug.dap-virtual-text"
      end,
    }

    use {
      "rcarriga/nvim-dap-ui",
      config = function()
        require "debug.dap-ui"
      end,
    }

    use {
      "Pocco81/dap-buddy.nvim",
      run = "make",
      disable = true,
    }

    use {
      "mfussenegger/nvim-dap-python",
      config = function()
        require "debug.dap-python"
      end,
      ft = { "python" },
    }
    -- }}}

    -- Language Specific {{{
    use {
      "lervag/vimtex",
      config = function()
        require "language.tex"
      end,
      ft = { "tex" },
    }

    use {
      "plasticboy/vim-markdown",
      ft = { "markdown" },
    }

    use {
      "jakewvincent/mkdnflow.nvim",
      disable = true,
    }

    use {
      "p00f/clangd_extensions.nvim",
      config = function()
        require "language.clangd_extensions"
      end,
    }

    use {
      "simrat39/rust-tools.nvim",
      config = function()
        require "language.rust-tools"
      end,
    }

    use {
      "mfussenegger/nvim-jdtls",
      config = function()
        require "language.jdtls"
      end,
      ft = { "java" },
      disable = true,
    }

    use {
      "akinsho/flutter-tools.nvim",
      disable = true,
    }

    use {
      "jose-elias-alvarez/typescript.nvim",
      config = function()
        require "language.typescript"
      end,
    }

    use {
      "b0o/SchemaStore.nvim",
      config = function()
        require "language.schema-store"
      end,
    }

    use {
      "nanotee/sqls.nvim",
      disable = true,
    }
    -- }}}
  end,

  config = {
    display = {
      prompt_border = "rounded",
    },
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  },
}
