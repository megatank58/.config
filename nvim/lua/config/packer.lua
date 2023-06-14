local packer_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local treesitter_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/nvim-treesitter"

if vim.fn.isdirectory(packer_dir) == 0 then
	vim.fn.system({
		"git",
		"clone",
		"--depth=1",
		"https://github.com/wbthomason/packer.nvim",
		packer_dir,
	})

	vim.api.nvim_command("packadd packer.nvim")
end

require("packer").startup(
	function (use)
		use "wbthomason/packer.nvim"

		use "lewis6991/gitsigns.nvim"
		use "navarasu/onedark.nvim"

		use "lervag/vimtex"

		use "sirver/ultisnips"
		use "honza/vim-snippets"

		use "Shougo/ddc.vim"
		use "vim-denops/denops.vim"
		use "matsui54/ddc-ultisnips"
		use "Shougo/ddc-ui-native"
		use "Shougo/ddc-source-around"
		use "Shougo/ddc-matcher_head"
		use "Shougo/ddc-sorter_rank"

		use "numToStr/Comment.nvim"

		use "NMAC427/guess-indent.nvim"

		use "phaazon/hop.nvim"

		use {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		}

		use "nvim-lualine/lualine.nvim"

		use "dylanaraps/wal.vim"

		use {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		}

		use "nvim-tree/nvim-tree.lua"

		use {
			"edluffy/hologram.nvim",
			"MunifTanjim/nui.nvim"
		}

		use "nvim-lua/plenary.nvim"

		use {
			"nvim-telescope/telescope.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		}

		use "cappyzawa/trim.nvim"

		if vim.fn.isdirectory(treesitter_dir) == 1 then
			use {
				"nvim-treesitter/nvim-treesitter",
				run = ":TSUpdate",
			}

			require("config.plugins")

			vim.api.nvim_create_autocmd(
				{ "User" },
				{
					pattern = "PackerComplete",
					callback = function ()
						print("All plugins are up-to-date!")
					end,
				}
			)
		else
			use "nvim-treesitter/nvim-treesitter"

			vim.api.nvim_create_autocmd(
				{ "User" },
				{
					pattern = "PackerComplete",
					callback = function () require("config.plugins") end,
				}
			)
		end

		-- require("packer").sync()
	end
)
