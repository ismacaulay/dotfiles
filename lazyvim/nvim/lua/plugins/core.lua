return {
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "soft"
    end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "warm",
      })
      -- Enable theme
      require("onedark").load()
    end,
  },
  { "Mofiqul/vscode.nvim" },
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_style = "maia"
      vim.g.sonokai_better_performance = 1
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = true, animate = { enabled = false } },
      scroll = { enabled = false },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false,
      },
    },
  },
}
