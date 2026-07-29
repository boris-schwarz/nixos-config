-- Leader key
vim.g.mapleader = " "

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line numbers: absolute on the current line, relative on the others
vim.opt.number = true
vim.opt.relativenumber = true

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", space = "·", trail = "·", nbsp = "␣" }

-- Enable 24 bit color
vim.opt.termguicolors = true

-- Indentation: two spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Hide built-in mode, replaced by lua line
vim.opt.showmode = false

-- Close the current buffer without nuking the window/neovim
vim.keymap.set("n", "<leader>bd", "<cmd>bprevious | bdelete #<cr>", { desc = "Close buffer" })
