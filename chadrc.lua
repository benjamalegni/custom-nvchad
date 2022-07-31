-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "gruvchad",
}

M.plugins = {
	user = {
		["neovim/nvim-lspconfig"] = {
			opt = true,
			setup = function()
			  require("core.lazy_load").on_file_open "nvim-lspconfig"
			end,
			config = function()
			  require "plugins.configs.lspconfig"
			  require "custom.plugins.lspconfig"
			end,
		},
		["jose-elias-alvarez/null-ls.nvim"] = {
			after = "nvim-lspconfig",
			config = function()
				require("custom.plugins.null-ls")
			end,
		},
    ["NvChad/nvterm"] = {
      module = "nvterm",
      config = function()
        require "plugins.configs.nvterm"
        require "custom.plugins.nvterm"
      end,
    },
	},

	override = {
		["nvim-treesitter/nvim-treesitter"] = {
			ensure_installed = {
				"bash",
				"comment",
				"cpp",
				"css",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
		},

		["williamboman/mason.nvim"] = {
			ensure_installed = {
				-- lua stuff
				"lua-language-server",
				"stylua",

				-- web dev
				"css-lsp",
				"deno",
				"emmet-ls",
				"eslint-lsp",
				"html-lsp",
				"json-lsp",
				"typescript-language-server",
				"yaml-language-server",

				-- shell
				"shellcheck",
			},
		},
	},

	options = {
		lspconfig = {
			setup_lspconf = "custom.plugins.lspconfig",
		},
	},

	status = { colorizer = true },
}


return M
