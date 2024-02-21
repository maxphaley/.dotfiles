return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  event = 'VeryLazy',
  config = function()
    require('harpoon').setup({})
  end
}
