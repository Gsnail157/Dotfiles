-- KEYMAPS FOR NEOVIM

-- Shorten Function Name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true , expr = true, replace_keycodes = false }

-- Remap SPACE as leader key
keymap("", "<SPACE>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Visual Mode Mappings --

-- Stays in indent mode while in Visual Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move Text up and down with ALT-j or ALT-k
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Hold on to value even if you replace something with paste
keymap("v", "p", '"_dp"', opts)

-- CoC autocomplete --

-- Select autocomplete
keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Show Documentation 
keymap("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keymap("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Symbol renaming
keymap("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

