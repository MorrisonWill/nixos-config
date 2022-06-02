vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.ignorecase = true -- Ignore case
vim.opt.spelllang = "en_us" -- Command-line completion mode
vim.opt.termguicolors = true -- True color support
vim.opt.number = true -- Show line numbers
vim.opt.shortmess = "I" -- Disable welcome screen

-- Tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Formatting options
vim.g.ale_c_clangformat_options =
	'-style="{IndentWidth: 4, SpaceAroundPointerQualifiers: Both, PointerAlignment: Middle, SpaceAfterLogicalNot: true}"'

-- Saving
vim.opt.backup = true
vim.opt.swapfile = true
vim.opt.undofile = true

vim.opt.backupdir = "/home/user/vimbackup/backup"
vim.opt.dir = "/home/user/vimbackup/swap"
vim.opt.undodir = "/home/user/vimbackup/undo"

-- Fold
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false
