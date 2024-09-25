return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    require('nvim-tree').setup {
      view = {
        adaptive_size = true,
      },
    }

    vim.keymap.set('n', '<leader>nt', function()
      vim.cmd 'NvimTreeToggle'
    end, { desc = '[N]vimTree [T]oggle' })
    vim.keymap.set('n', '<leader>nf', function()
      vim.cmd 'NvimTreeFindFile'
    end, { desc = '[N]vimTree [F]ind' })
  end,
}
