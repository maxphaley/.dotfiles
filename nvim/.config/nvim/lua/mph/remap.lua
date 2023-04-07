vim.opt.guicursor = ''

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.cmd [[
  augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
  augroup end
]]

vim.o.mouse = 'a'

vim.o.termguicolors = true
vim.o.completeopt = 'menuone,noselect'

vim.o.updatetime = 200
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.wo.number = true
vim.wo.relativenumber = true
vim.cmd [[
  augroup relative-number-toggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup end
]]
vim.wo.signcolumn = 'yes'

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {silent = true})

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind in [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind in [H]elp' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = '[F]ind by [S]tring' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind in [D]iagnostics' })

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

