return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('treesitter-context').setup()

      vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = 'none' })

      vim.api.nvim_set_hl(0, 'TreesitterContextBottom', {
        bg = 'none',
        underline = false,
        undercurl = false,
        sp = 'none',
      })

      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
          vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'TreesitterContextBottom', {
            bg = 'none',
            underline = false,
            undercurl = false,
            sp = 'none',
          })
        end,
      })
    end,
  },
}
