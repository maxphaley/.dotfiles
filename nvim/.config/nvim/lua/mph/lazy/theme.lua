return {
  {
    'navarasu/onedark.nvim',
    config = function()
    end
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup({
        style = 'moon',
        transparent = true,
        terminal_colors = true,
        styles = {
          sidebars = 'dark',
          floats = 'dark',
        }
      })
      vim.cmd.colorscheme('tokyonight-moon')
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  }
}
