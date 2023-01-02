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
	parser_install_dir = "/home/user/.local/share/nvim/site/"
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
lsp.ocamllsp.setup({})
lsp.jedi_language_server.setup({})
-- lsp.pyright.setup({})
lsp.rust_analyzer.setup({})
lsp.clangd.setup({})
lsp.rnix.setup({})
lsp.denols.setup({})
-- lsp.tsserver.setup({})
-- lsp.svelte.setup({})
lsp.elixirls.setup({
	cmd = { "elixir-ls" },
	elixirLS = {
		dialyzerEnabled = false,
	},
})
lsp.vuels.setup({})
lsp.nimls.setup({})
lsp.zls.setup({})

local cmp = require("cmp")
cmp.setup({
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
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
	},
	formatting = { format = require("lspkind").cmp_format() },
})

vim.g.ale_fixers = {
	json = { "prettier" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	typescriptreact = { "prettier" },
	javascriptreact = { "prettier" },
	vue = { "prettier" },
	json = { "prettier" },
	html = { "prettier" },
	css = { "prettier" },
	markdown = { "prettier" },
	yaml = { "prettier" },
	go = { "gofumpt" },
	rust = { "rustfmt" },
	svelte = { "prettier" },
	lua = { "stylua" },
	python = { "black" },
	c = { "clang-format" },
	elixir = { "mix_format" },
	nix = { "nixfmt" },
	ocaml = { "ocamlformat" },
	scala = { "scalafmt" },
	zig = { "zigfmt" },
}
vim.g.ale_fix_on_save = 1
-- copilot spat this out, not sure what actually disables the linting
vim.g.ale_disable_lsp = 1
vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_on_text_changed = "never"
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_save = 0
vim.g.ale_lint_on_filetype_changed = 0
vim.g.ale_lint_on_insert_leave = 0

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

require("diffview").setup({})

require("alpha").setup(require'alpha.themes.dashboard'.config)

require("indent_blankline").setup({})

require("telescope").setup({})


-- metals setup
local metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
