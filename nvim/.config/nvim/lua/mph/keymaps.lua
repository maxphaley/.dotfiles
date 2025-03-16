vim.keymap.set('', '<Space>', '<Nop>', { silent = true, noremap = true })
vim.keymap.set('t', '<Space>', '<Space>')

vim.keymap.set('n', '<leader>w', vim.cmd.update, { desc = "Write" })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = "[P]roject [V]iew Folders" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })
vim.keymap.set('t', 'jj', '<C-\\><C-n>', { silent = true })
vim.keymap.set('i', 'jj', '<Esc>', { silent = true })

vim.keymap.set('', '<Esc>', '<cmd>noh<cr><Esc>', { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')

vim.keymap.set('n', '<leader><leader>', '<C-w>')

vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<leader>=', ':Format<cr>')

vim.keymap.set('n', '<C-j>', '<cmd>cnext<cr>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<cr>zz')
vim.keymap.set('n', '<leader>j', '<cmd>cnext<cr>zz')
vim.keymap.set('n', '<leader>k', '<cmd>cprev<cr>zz')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('v', '<leader>p', '"_dp')
vim.keymap.set('v', 'x', '"_x')

vim.keymap.set('n', '<leader>f?', '<cmd>FzfLua oldfiles<cr>', { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<cr>', { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<leader><tab>', '<cmd>FzfLua buffers<cr>', { desc = "Find in buffer" })
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>', { desc = '[F]ind in [F]iles' })
vim.keymap.set('n', '<leader>fF', '<cmd>FzfLua files no_ignore=true<cr>', { desc = '[F]ind in [F]iles' })
vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua helptags<cr>', { desc = '[F]ind in [H]elp' })
vim.keymap.set('n', '<leader>fs', '<cmd>FzfLua grep<cr>', { desc = '[F]ind by [S]tring' })
vim.keymap.set('n', '<leader>fS', '<cmd>FzfLua grep no_ignore=treu<cr>', { desc = '[F]ind by [S]tring' })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>', { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fG', '<cmd>FzfLua live_grep no_ignore=true<cr>', { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', '<cmd>FzfLua diagnostics_workspace<cr>', { desc = '[F]ind in [D]iagnostics' })
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua commands<cr>', { desc = '[F]ind [C]ommand' })
vim.keymap.set('n', '<leader>fk', '<cmd>FzfLua keymaps<cr>', { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>ft', '<cmd>FzfLua<cr>', { desc = '[F]ind [T]elescope' })
vim.keymap.set('n', '<leader>fw', '<cmd>FzfLua grep_cword', { desc = '[F]ind [w]ord' })

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>gS', '<cmd>Git<bar>only<cr>')
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })

local trouble = require('trouble')
vim.keymap.set('n', '<leader>tt', trouble.toggle, { desc = '[T]rouble toggle' })
vim.keymap.set('n', '<leader>tq', function() trouble.toggle('quickfix') end, { desc = '[T]rouble quickfix' })
vim.keymap.set('n', ']t', function() trouble.next({skip_groups = true, jump = true }) end, { desc = '[T]rouble jump forwards' })
vim.keymap.set('n', '[t', function() trouble.previous({skip_groups = true, jump = true }) end, { desc = '[T]rouble jump backwards' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { desc = '[V]iew [D]iagnostic message' })

local M = {}
M.lsp_keymaps = function(bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  nmap('<leader>cr', vim.lsp.buf.rename, '[C]ode Action [R]ename')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>sd', vim.lsp.buf.type_definition, '[S]ymbols: Type [D]efinition')
  nmap('gr', '<cmd>FzfLua lsp_references<cr>', '[G]oto [R]eferences')
  nmap('<leader>ss', '<cmd>FzfLua lsp_document_symbols<cr>', '[S]ymbols: Document [S]ymbols')
  nmap('<leader>sw', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', '[S]ymbols: [W]orkspace')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<leader>s?', vim.lsp.buf.signature_help, '[S]ignature [?]Documentation')
end

return M
