return {
  'nvim-lua/plenary.nvim',

  {
    'folke/which-key.nvim',
    opts = {
      plugins = {
        registers = false,
      },
    },
    config = function()
      require('which-key').register({
        f = { name = 'find' },
        c = { name = 'code actions' },
        p = { name = 'project' },
        s = { name = 'symbols' },
        g = { name = 'git' },
        v = { name = 'view' },
      }, { prefix = '<leader>' })
    end
  },

  'godlygeek/tabular',
  'mbbill/undotree',
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'tokyonight',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {
          { 'mode', fmt = function(str) return str:sub(1,3) end },
        },
        lualine_c = {
          { 'filename', path = 1, shorting_target = 50 },
        }
      }
    },
  },
}
