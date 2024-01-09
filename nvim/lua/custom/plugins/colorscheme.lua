return {
  -- Theme inspired by Atom
  -- 'navarasu/onedark.nvim',
  'lewpoly/sherbet.nvim',
  -- "ellisonleao/gruvbox.nvim",
  -- "morhetz/gruvbox",
  -- "sainnhe/everforest",
  priority = 1000,
  config = function()
    -- vim.cmd.colorscheme 'onedark'
    vim.cmd.colorscheme 'sherbet'
    -- vim.o.background = "dark"
    -- vim.cmd.colorscheme "gruvbox"
    -- vim.cmd.colorscheme 'everforest'
  end,
}
