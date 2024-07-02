local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Neovim Dashboard --
    { 'goolord/alpha-nvim', config = function()require'alpha'.setup(require'alpha.themes.dashboard'.config) end },

    -- File Explorer --
    { "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                view = { width = 25 },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                    },
            })
        end
    },

    -- Appearance -- 
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'nvim-tree/nvim-web-devicons' },
    { "NvChad/nvim-colorizer.lua",
        config = function()
            require('colorizer').setup({})
        end
    },
    { 'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'nightfly',
                section_separators = { left = ' ', right = ' ' },
                component_separators = { left = '|', right = '|' }
            }
        })
    end
    },
    { "xiyaowong/transparent.nvim" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Terminal --
    {'akinsho/toggleterm.nvim', version = "*", config = true},

    -- Editing --
    { 'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require("Comment").setup()
        end
    },
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
    { "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- your configuration comes here or leave it empty to use the default settings
        -- refer to the configuration section below
        }
    },

    -- Auto Completions --
    { "hrsh7th/nvim-cmp" }, -- The completion plugin
    { "hrsh7th/cmp-cmdline" }, -- commandline completions 
    { "hrsh7th/cmp-buffer" }, -- buffer completions
    { "hrsh7th/cmp-path" }, -- path completions
    { "hrsh7th/cmp-nvim-lsp" }, -- path completions
    { "saadparwaiz1/cmp_luasnip" }, -- snippet completions

    -- Snippet Engine --
    { "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },

    -- TeleScope --
    { 'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- LSP -- 
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    { "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    },

   -- treesitter --

    { "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensured_installed = { "c", "lua", "latex", "python", "cpp" },
                sync_install = false,
                auto_install = true,
                hightlight = {
                    enable = true
                }
        })
        end
    },

    -- LateX Support --
    { "lervag/vimtex",
        ft = "tex",
        lazy = false,
        init = function()
        end
    },

    --  Git --
    { "lewis6991/gitsigns.nvim",
        config = function ()
            require("gitsigns").setup()
        end
    }
})
