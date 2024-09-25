-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- ThePrimeagen special keymaps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Disable some keys because I keep hitting it on the Advantage 360 and they cause it to jump alot
vim.keymap.set('i', '<S-Up>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i', '<S-Down>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i', '<S-Left>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i', '<S-Right>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i', '<PageUp>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('i', '<PageDown>', '<NOP>', { noremap = true, silent = true })

vim.keymap.set('n', '<S-Up>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Left>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Right>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n', '<PageUp>', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n', '<PageDown>', '<NOP>', { noremap = true, silent = true })
