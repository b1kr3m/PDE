-- Leader key (should be set before lazy)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"

-- For better completion
vim.opt.completeopt = "menu,menuone,noselect"

-- For better performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
