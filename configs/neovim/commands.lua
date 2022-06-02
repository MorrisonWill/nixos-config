local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Toggle fuzzy search
vim.api.nvim_set_keymap(
	"n",
	"<Leader>f",
	'<Cmd>lua require("telescope.builtin").find_files{ find_command = { "fd", "--type=f", "--type=l", "--hidden", "--no-ignore", "--exclude=.DS_Store", "--exclude=.git", "--exclude=bin", "--exclude=build", "--exclude=dist", "--exclude=node_modules", "--exclude=target" }}<CR>',
	opts
)
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)

-- Toggle file tree
vim.api.nvim_set_keymap("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", opts)

-- Strip trailing whitespaces on save
vim.cmd("autocmd BufWritePre * %s/\\s\\+$//e")

-- LSP actions
vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- Diagnostics list
vim.api.nvim_set_keymap("n", "<leader>d", "<Cmd>TroubleToggle<CR>", opts)

-- Buffer actions
vim.api.nvim_set_keymap("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bj", "<Cmd>BufferLinePick<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>c", "<Cmd>bdelete!<CR>", opts)

vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)
