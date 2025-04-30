return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
  "mrcjkb/rustaceanvim",
    ft = { "rust" },
    config = function(_,_)
      vim.g.rustaceanvim = {
        server = {
          on_attach = require("nvchad.configs.lspconfig").on_attach,
        },
      }
    end
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc", "rust"
  		},
  	},
  },
}
