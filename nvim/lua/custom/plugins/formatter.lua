-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
return {
  'mhartington/formatter.nvim',

  config = function()
    require('formatter').setup {
      -- Enable or disable logging
      logging = true,
      -- Set the log level
      log_level = vim.log.levels.WARN,
      -- All formatter configurations are opt-in
      filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
          -- "formatter.filetypes.lua" defines default configurations for the
          -- "lua" filetype
          require('formatter.filetypes.lua').stylua,
        },

        python = {
          require('formatter.filetypes.python').yapf,
        },

        cpp = {
          require('formatter.filetypes.cpp').clangformat,
        },

        json = {
          require('formatter.filetypes.json').prettierd,
        },

        javascript = {
          require('formatter.filetypes.javascript').eslint_d,
        },
        typescript = {
          require('formatter.filetypes.typescript').eslint_d,
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ['*'] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require('formatter.filetypes.any').remove_trailing_whitespace,
        },
      },
    }

    vim.keymap.set('n', '<leader>f', function()
      vim.cmd 'Format'
    end, { desc = '[F]ormat' })
  end,
}
