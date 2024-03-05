local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

return {
  {
    "navarasu/onedark.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme onedark]])
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

    },
  },

  { "lewis6991/gitsigns.nvim", lazy = true, opts = { signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl="GitSignsAddNr", linehl="GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn" },
		untracked = { hl = "GitSignsAdd", text = "│", numhl="GitSignsAddNr", linehl="GitSignsAddLn" },
	},
	preview_config = {
		border = "rounded",
	}, } },
  "lervag/vimtex",
  "sirver/ultisnips",
  "honza/vim-snippets",

  { "numToStr/Comment.nvim",
  opts = {
    mappings = {
      basic = false,
      extra = false,
    }
  }},

  "NMAC427/guess-indent.nvim",
  { "phaazon/hop.nvim", opts = { keys = "fjdkslaeiwocmgh" }},

  { "nvim-lualine/lualine.nvim", opts = { options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			"NvimTree",
			"dapui_scopes",
			"packer",
		},
	},
	sections = {
		lualine_a = {
			{
				"branch",
				icon = "",
			},
		},
		lualine_b = {
			{
				"filename",
				symbols = { modified = "", readonly = "", unnamed = "" },
			},
		},
		lualine_c = {
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
				source = diff_source,
			},
		},
		lualine_x = {
			{
				"diagnostics",
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_y = {
			{
				function ()
					local instances = {}

					local dap_session = require("dap").session()
					if dap_session ~= nil then
						table.insert(instances, dap_session.adapter.name)
					end

					vim.lsp.for_each_buffer_client(0, function (client)
						table.insert(instances, client.name)
					end)

					return table.concat(instances, " ")
				end,
			},
		},
	},
	inactive_sections = {
		lualine_c = {
			{
				"filename",
				path = 3,
				symbols = { modified = "", readonly = "", unnamed = "" },
			},
		},
	},
}},
  "nvim-tree/nvim-web-devicons",

  { "nvim-tree/nvim-tree.lua", opts = { hijack_cursor = true,
	on_attach = myattach,
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		indent_markers = {
			enable = true,
			icons = {
				corner = "│ ",
				edge = "│ ",
				item = "│ ",
				bottom = "│ ",
				none = "│ ",
			},
		},
		icons = {
			symlink_arrow = "  ",
			show = {
				file = false,
				folder = true,
				folder_arrow = false,
				git = false,
			},
			glyphs = {
				default = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
			},
		},
		special_files = {},
	},
	filters = {
		custom = { "^.git$" },
	},
	actions = {
		change_dir = {
			global = true,
		},
	}, }},

  "edluffy/hologram.nvim",
  "MunifTanjim/nui.nvim",

  "nvim-lua/plenary.nvim",

  { "nvim-telescope/telescope.nvim", lazy = true, opts = { defaults = {
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
		prompt_prefix = " ",
		selection_caret = " ",
	},
	extensions = {
		["ui-select"] = {
			--require("telescope.themes").get_dropdown({}),
		},
	}, }},
  "nvim-telescope/telescope-ui-select.nvim",

  "cappyzawa/trim.nvim",

  { "nvim-treesitter/nvim-treesitter", opts = { auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	}, }},

  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

}
