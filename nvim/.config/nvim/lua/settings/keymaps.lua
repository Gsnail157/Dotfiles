-- KEYMAPS FOR NEOVIM
-- Shorten Function Name local keymap = vim.keymap.set 
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Remap SPACE as leader key
keymap("", "<SPACE>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File Explorer --
keymap("n", "<leader>et", ":NvimTreeToggle <cr>", opts)
keymap("n", "<leader>ef", ":NvimTreeFocus <cr>", opts)

-- Remap <ESC> key to enter into normal mode from insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)

-- Visual Mode Mappings --
-- Stays in indent mode while in Visual Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move Text up and down with ALT-j or ALT-k
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Hold on to value even if you replace something with paste
keymap("v", "p", '"_dp"', opts)

-- TeleScope --
keymap("n", "<leader>ff", ":Telescope find_files <cr>")
keymap("n", "<leader>fg", ":Telescope live_grep <cr>")
keymap("n", "<leader>fb", ":Telescope buffers <cr>")
keymap("n", "<leader>fh", ":Telescope help_tags <cr>")

-- VimTex --
keymap("n", "<leader>vs", ":w | VimtexCompile <cr>")
keymap("n", "<leader>vv", ":VimtexView <cr>")
keymap("n", "<leader>vc", ":VimtexClean <cr>")

