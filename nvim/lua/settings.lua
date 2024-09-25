-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true
-- vim.keymap.set('n', '<esc>', function()
--   return '<Esc>:noh<CR>'
-- end, { expr = true, silent = true, replace_keycodes = true })
vim.keymap.set('n', '<Esc><Esc>', ':noh<CR>', { noremap = true, silent = true })

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'
vim.o.swapfile = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

-- Tabs
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Whitespace
vim.o.list = true
vim.opt.listchars = {
  tab = '→ ',
  trail = '·',
  space = '·',
}

-- refresh on focus
vim.o.autoread = true
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = { '*' },
  command = "if mode() != 'c' | checktime | endif",
})
vim.api.nvim_create_autocmd({ 'FileChangedShellPost' }, {
  pattern = { '*' },
  command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None',
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
