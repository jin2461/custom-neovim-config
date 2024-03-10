-- -- disable netrw at the very start of your init.lua
vim.g.mapleader= " "
vim.opt.nu = true
vim.opt.relativenumber = true
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.lua"
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

require("lazy").setup("plugins")


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


-- OR setup with some options
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


