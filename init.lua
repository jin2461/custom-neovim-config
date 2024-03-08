vim.cmd[[colorscheme tokyonight]]

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

vim.g.mapleader= " "

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>to',     vim.cmd.NvimTreeOpen)
vim.keymap.set('n', '<leader>tc',     vim.cmd.NvimTreeClose)

vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>o', vim.cmd.Oil)

config = "C:/Users/admin/AppData/Local/nvim/init.lua"
--vim.keymap.set("n", "<leader>c", vim.cmd.file.config)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        "FotiadisM/tabset.nvim",
        config = function()
            require("tabset").setup()
            defaults = {
                tabwidth = 2,
                expandtab = true
            }
        end
    }

  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })

    use "rafamadriz/friendly-snippets"

    use 'mbbill/undotree'

    use "folke/tokyonight.nvim"

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "rust" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        },
    }
    use "nvim-tree/nvim-tree.lua"

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    --local cmp = require("cmp")
    --cmp.setup({
        --mapping = cmp.mapping.preset.insert
        require('lsp-zero')
        require('lspconfig').lua_ls.setup({})
        require('lspconfig').rust_analyzer.setup{}
        local cmp = require('cmp')

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                -- confirm completion
                ['<CR>'] = cmp.mapping.confirm({select = true}),
                -- scroll up and down the documentation window
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),   
            }),
        })
    end)


