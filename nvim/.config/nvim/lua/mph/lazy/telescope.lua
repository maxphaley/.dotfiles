return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local find_cmd = nil
      if vim.fn.executable 'fd' == 1 then
        find_cmd = {'fd', '--type', 'f', '--hidden', '--exclude', '.git', '--color', 'never'}
      elseif vim.fn.executable 'rg' == 1 then
        find_cmd = {'rg', '--files', '--hidden', '--glob', '!.git', '--color', 'never'}
      end
      require('telescope').setup({
        pickers = {
          find_files = {
            find_command = find_cmd
          }
        },
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '-g',
            '!**/.git/*',
          }
        },
        extensions = {
          fzf = {
            fuzzy = false,
          },
        },
      })
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    config = function()
      require('telescope').load_extension('fzf')
    end
  },
}
