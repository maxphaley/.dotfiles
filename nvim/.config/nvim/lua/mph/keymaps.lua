vim.keymap.set('', '<Space>', '<Nop>', { silent = true, noremap = true })
vim.keymap.set('t', '<Space>', '<Space>')

vim.keymap.set('n', '<leader>w', vim.cmd.update, { desc = "Write" })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = "[P]roject [V]iew Folders" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })
vim.keymap.set('t', 'jj', '<C-\\><C-n>', { silent = true })
vim.keymap.set('i', 'jj', '<Esc>', { silent = true })

vim.keymap.set("n", "J", "mzJ`z")
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

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<C-j>', '<cmd>cnext<cr>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<cr>zz')
vim.keymap.set('n', '<leader>j', '<cmd>cnext<cr>zz')
vim.keymap.set('n', '<leader>k', '<cmd>cprev<cr>zz')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('v', '<leader>p', '"_dp')
vim.keymap.set('v', 'x', '"_x')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<leader><tab>', builtin.buffers, { desc = "Find in buffer" })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind in [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind in [H]elp' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = '[F]ind by [S]tring' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind in [D]iagnostics' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = '[F]ind [C]ommand' })

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
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

  local telescope = require('telescope.builtin')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>sd', vim.lsp.buf.type_definition, '[S]ymbols: Type [D]efinition')
  nmap('<leader>ss', telescope.lsp_document_symbols, '[S]ymbols: Document [S]ymbols')
  nmap('<leader>sw', telescope.lsp_dynamic_workspace_symbols, '[S]ymbols: [W]orkspace')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<leader>s?', vim.lsp.buf.signature_help, '[S]ignature [?]Documentation')
end

-- harpoon keymaps
local harpoon = require('harpoon')
vim.keymap.set('n', '<leader>hv', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon toggle list' })
vim.keymap.set('n', '<leader>hh', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon toggle list' })
vim.keymap.set('n', '<leader>ha', function() harpoon:list():append() end, { desc = '[H]arpoon append file to list' })
vim.keymap.set('n', '<leader>hx', function() harpoon:list():remove() end, { desc = '[H]arpoon remove file from list' })
vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = '[H]arpoon remove file from list' })
vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end, { desc = '[H]arpoon remove file from list' })
vim.keymap.set('n', '<leader>hr', function() harpoon:list():clear() end, { desc = '[H]arpoon reset lear the list' })
for hi = 1, 9 do
  vim.keymap.set('n', '<leader>' .. hi, function() harpoon:list():select(hi) end, { desc = '[H]arpoon goto ' .. hi })
end

return M
