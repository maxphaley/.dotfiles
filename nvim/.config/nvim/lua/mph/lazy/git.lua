return {
  'tpope/vim-fugitive',
  {
		'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function ()
      require('gitsigns').setup({
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')
          vim.keymap.set('n', '<leader>gt', gitsigns.preview_hunk_inline, {buffer=bufnr})
        end
      })
    end
  },
}
