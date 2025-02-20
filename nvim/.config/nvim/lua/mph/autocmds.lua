local user_group = vim.api.nvim_create_augroup('mph_group', {})

vim.api.nvim_create_autocmd('BufReadPost', {
  group = user_group,
  callback = function()
    local skip = string.match(vim.bo.filetype, 'fugitive|gitcommit|gitrebase')
    if skip == nil then
      local jmpln = vim.fn.line([['"]])
      local jmpbnd = jmpln > 1 and jmpln < vim.fn.line('$')
      if jmpbnd then
        vim.cmd([[normal! g`"]])
      end
    end
  end
})

vim.api.nvim_create_autocmd('VimEnter', {
  group = user_group,
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'netrw' then
      local netrw_dir = vim.api.nvim_buf_get_var(0, 'netrw_curdir')
      vim.cmd.cd(netrw_dir)
    end
  end
})

vim.api.nvim_create_autocmd('CmdlineEnter', {
  group = user_group,
  pattern = '/,\\?',
  callback = function()
    vim.opt.hlsearch = true
  end
})
vim.api.nvim_create_autocmd('CmdlineLeave', {
  group = user_group,
  pattern = '/,\\?',
  callback = function()
    vim.opt.hlsearch = false
  end
})

vim.api.nvim_create_autocmd('BufLeave', {
  group = user_group,
  pattern = '*',
  callback = function()
    if vim.api.nvim_buf_get_option(0, 'modified') then return end
    if not vim.fn.buflisted(0) then return end
    local bufname = vim.api.nvim_buf_get_name(0)
    local is_no_name = bufname == nil or bufname == ''
    if is_no_name then
      vim.opt.bufhidden = 'wipe'
    end
  end
})

vim.api.nvim_create_autocmd({'BufEnter','FocusGained','InsertLeave','WinEnter'}, {
  group = user_group,
  pattern = '*',
  callback = function()
    if vim.wo.number then
      vim.opt.relativenumber = true
    end
  end
})
vim.api.nvim_create_autocmd({'BufLeave','FocusLost','InsertEnter','WinLeave'}, {
  group = user_group,
  pattern = '*',
  callback = function()
    if vim.wo.number then
      vim.opt.relativenumber = false
    end
  end
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      timeout = 300
    })
  end,
  group = highlight_group,
  pattern = '*',
})

local yank_cursor_pos
vim.api.nvim_create_autocmd({'VimEnter','CursorMoved'}, {
  group = user_group,
  pattern = '*',
  callback = function ()
    yank_cursor_pos = vim.fn.getpos('.')
  end,
})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = user_group,
  pattern = '*',
  callback = function ()
    if vim.v.event.operator:lower() == 'y' then
      vim.fn.setpos('.', yank_cursor_pos)
    end
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = user_group,
  pattern = '*',
  callback = function ()
    if vim.bo.modifiable and vim.bo.modified then
      vim.cmd([[%s/\s\+$//e]])
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = user_group,
  pattern = 'help',
  command = "wincmd H"
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = user_group,
  pattern = '*',
  command = 'startinsert'
})

vim.api.nvim_create_autocmd('FileType', {
  group = user_group,
  pattern = {'gitcommit', 'gitrebase'},
  command = 'startinsert | 1'
})
