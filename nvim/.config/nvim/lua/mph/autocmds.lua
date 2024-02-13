vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'netrw' then
      local netrw_dir = vim.api.nvim_buf_get_var(0, 'netrw_curdir')
      vim.cmd.cd(netrw_dir)
    end
  end
})

local hlsearch_on_type_g = vim.api.nvim_create_augroup('',{ clear = true })
vim.api.nvim_create_autocmd('CmdlineEnter', {
  group = hlsearch_on_type_g,
  pattern = '/,\\?',
  callback = function()
    vim.opt.hlsearch = true
  end
})
vim.api.nvim_create_autocmd('CmdlineLeave', {
  group = hlsearch_on_type_g,
  pattern = '/,\\?',
  callback = function()
    vim.opt.hlsearch = false
  end
})

vim.api.nvim_create_autocmd('BufLeave', {
  group = vim.api.nvim_create_augroup('AutoCloseEmptyBuf', { clear = true }),
  pattern = '*',
  callback = function()
    local is_modified = vim.api.nvim_buf_get_option(0, 'modified')
    if vim.fn.empty(vim.fn.bufname()) and is_modified then
      vim.opt.bufhidden = 'wipe'
    end
  end
})

local rnu_toggle_group = vim.api.nvim_create_augroup('rnu_toggle_group', { clear = true })
vim.api.nvim_create_autocmd({'BufEnter','FocusGained','InsertLeave','WinEnter'}, {
  group = rnu_toggle_group,
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = true
  end
})
vim.api.nvim_create_autocmd({'BufLeave','FocusLost','InsertEnter','WinLeave'}, {
  group = rnu_toggle_group,
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = false
  end
})

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

