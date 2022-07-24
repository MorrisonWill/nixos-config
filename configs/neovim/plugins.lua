style = "darker"
vim.cmd([[colorscheme onedark]])

require("neoscroll").setup()
require("Comment").setup()
require("nvim-autopairs").setup({})
require("nvim-tree").setup({})

require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
		},
	},
})

require("lualine").setup({
	sections = {
		lualine_a = {},
		lualine_x = { "filetype" },
		lualine_z = {},
	},
	extensions = { "nvim-tree" },
})

local lsp = require("lspconfig")
lsp.gopls.setup({})
lsp.ocamlls.setup({})
lsp.jedi_language_server.setup({})
lsp.rust_analyzer.setup({})
lsp.clangd.setup({})
lsp.rnix.setup({})
lsp.denols.setup({})
-- lsp.tsserver.setup({})

require("cmp").setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
	},
	formatting = { format = require("lspkind").cmp_format() },
})

vim.g.ale_fixers = {
	json = { "prettier" },
	javascript = { "prettier" },
	typescript = { "deno" },
	typescriptreact = { "prettier" },
	javascriptreact = { "prettier" },
	json = { "prettier" },
	html = { "prettier" },
	css = { "prettier" },
	markdown = { "prettier" },
	yaml = { "prettier" },

	go = { "gofmt" },
	rust = { "rustfmt" },
	svelte = { "prettier" },
	lua = { "stylua" },
	python = { "black" },
	c = { "clang-format" },
	elixir = { "mix_format" },
	nix = { "nixfmt" },
}
vim.g.ale_fix_on_save = 1
vim.g.ale_disable_lsp = 1

require("bufferline").setup({})

require("toggleterm").setup({
	on_config_done = nil,
	size = 20,
	open_mapping = [[<c-t>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = false,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
