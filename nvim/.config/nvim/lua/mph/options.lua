vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.opt.mouse = 'a'
vim.opt.completeopt = 'menuone,noselect'
vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars = { tab='→ ', trail='·', nbsp = '␣' }

vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.updatetime = 200
vim.opt.timeout = true
vim.opt.timeoutlen = 500

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.splitright = true

vim.opt.inccommand = 'split'

vim.opt.modeline = false
vim.opt.fileformat = 'unix'
vim.opt.fileformats = 'unix'

vim.g.netrw_bufsettings = 'noma nomod nobl nowrap ro nornu nu'
vim.g.netrw_browse_split = 0
