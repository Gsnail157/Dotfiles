-- KEYMAPS FOR NEOVIM

-- Shorten Function Name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap SPACE as leader key

keymap("", "<SPACE>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
