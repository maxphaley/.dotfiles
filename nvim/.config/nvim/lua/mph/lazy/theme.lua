return {
  {
    'navarasu/onedark.nvim',
    config = function()
    end
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      local tnutil = require('tokyonight.util')
      require('tokyonight').setup({
        style = 'moon',
        --transparent = true,
        terminal_colors = true,
        styles = {
          sidebars = 'dark',
          floats = 'dark',
        },
        on_highlights = function(hl, c)
          hl.Whitespace = { fg = tnutil.lighten(c.fg_gutter , 0.6) }
        end
      })
      vim.cmd.colorscheme('tokyonight')
      --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  }
}
