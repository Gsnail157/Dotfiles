-- PLUGINS FILE FOR NVIM -- 
 fn = vim.fn

 -- Automatically install packer --
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file 
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- Icons --
    use 'nvim-tree/nvim-web-devicons'

    -- Auto Complete for autopairs -- 
    use { 'windwp/nvim-autopairs', 
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    -- Git integration in nvim --
    use  { 'lewis6991/gitsigns.nvim',
        config = function() 
            require('gitsigns').setup {}
        end
    }

    -- Show indent lines -- 
    use { 'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup()
        end,
        event = "BufAdd"
    }
    
    -- Status Bar --
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'nightfly',
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = ''}
                } 
            }
        end
    }
    
    -- Startup Menu for Neovim -- 
    use { 'nvimdev/dashboard-nvim', 
        event = 'VimEnter',
        config = function()
            require('dashboard').setup()
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    
    -- coc plugin -- 
    use { 'neoclide/coc.nvim', branch = 'release', event = "VimEnter" }

    -- Adding color feature to neovim --
    use { 'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    }

    -- Color Scheme --
    use { 'catppuccin/nvim', as = "catppuccin",
        require("catppuccin")
    }
    
    -- Transparent Background --
    -- use { 'xiyaowong/transparent.nvim',
    --     config = function()
    --         require("transparent").setup()
    --     end
    -- }

    -- Comment Code Plugin -- 
    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
