
-- -- disable netrw at the very start of your init.lua
vim.g.mapleader= " "
vim.opt.nu = true
vim.opt.relativenumber = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {"nvim-telescope/telescope.nvim", tag = '0.1.5',
    -- or                            , branch = '0.1.x',    
    dependencies =  {"nvim-lua/plenary.nvim"} 
},

{
    "FotiadisM/tabset.nvim",
    config = function()
        require("tabset").setup()
        defaults = {
            tabwidth = 2,
            expandtab = true
        }
    end
},
"folke/tokyonight.nvim",
'numToStr/Comment.nvim',
{
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup()
    end,
},
"rafamadriz/friendly-snippets",
'mbbill/undotree',


{ 'nvim-treesitter/nvim-treesitter',
build = ":TSUpdate",
config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = { "c", "lua", "rust" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        }
    }
    )
end
  },
  "nvim-tree/nvim-tree.lua",

{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

},

  {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      dependencies = {
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
  },


})


vim.cmd[[colorscheme tokyonight-storm]]


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

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

vim.keymap.set('n', '<leader>to',     vim.cmd.NvimTreeOpen)
vim.keymap.set('n', '<leader>tc',     vim.cmd.NvimTreeClose)

vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>o', vim.cmd.Oil)

require("lualine").setup({
    options = { theme = "palenight"}
})

local cmp = require("cmp")
-- cmp.setup({
    --   --mapping = cmp.mapping.preset.insert
    require('lsp-zero')
    require('lspconfig').lua_ls.setup({})
    require('lspconfig').rust_analyzer.setup{}

    require('cmp').setup({
        mapping = cmp.mapping.preset.insert({
            -- confirm completion
            ['<CR>'] = cmp.mapping.confirm({select = true}),
            -- scroll up and down the documentation window
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
    })
