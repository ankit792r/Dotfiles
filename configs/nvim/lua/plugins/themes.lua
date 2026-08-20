return {
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.moonflyItalics = true
      vim.o.pumborder = "single"
      vim.g.moonflyTransparent = true
      vim.g.moonflyNormalFloat = true
      vim.g.moonflyWinSeparator = 2
      -- vim.cmd("colorscheme moonfly")
    end,
  },
  {
    "vague-theme/vague.nvim",
    config = function()
      require('vague').setup({
        transparent = true,
        bold = true,
        italic = true,
      })

      vim.cmd("colorscheme vague")
    end
  },
}
