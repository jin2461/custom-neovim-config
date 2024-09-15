vim.g.mapleader= " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
--vim.keymap.set("n", '<leader>c', vim.cmd 'cd C:/Users/admin/AppData/Local/nvim')

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
