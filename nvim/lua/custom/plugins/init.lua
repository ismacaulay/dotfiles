-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'christoomey/vim-tmux-navigator', -- navigation integration with tmux

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'sherbet',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { 'folke/which-key.nvim', opts = {} },
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = 'ibl',
    opts = {
      indent = {
        char = '┊',
        -- smart_indent_cap = false,
      },
      whitespace = {
        -- remove_blankline_trail = false,
      },
      scope = {
        -- enabled = false
        show_start = false,
        show_end = false,
      },
    },
    -- config = function()
    --   require('ibl').setup {
    --     show_trailing_blankline_indent = false,
    --   }
    -- end,
  },
}
