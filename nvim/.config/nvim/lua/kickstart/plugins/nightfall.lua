return {
  '2giosangmitom/nightfall.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
  },
  config = function(_, opts)
    require('nightfall').setup(opts)
    vim.cmd 'colorscheme nord' -- Choose from: nightfall, deeper-night, maron, nord
  end,
}
