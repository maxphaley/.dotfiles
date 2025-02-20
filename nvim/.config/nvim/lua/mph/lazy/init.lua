return {
  'nvim-lua/plenary.nvim',

  {
    'folke/which-key.nvim',
    opts = {
      plugins = {
        registers = false,
      },
    },
    keys = {
      { "<leader>f", group = "find" },
      { "<leader>c", group = "code actions" },
      { "<leader>p", group = "project" },
      { "<leader>s", group = "symbols" },
      { "<leader>g", group = "git" },
      { "<leader>v", group = "view" },
    }
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
