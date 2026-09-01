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

      -- vim.cmd("colorscheme vague")
    end
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
      vim.cmd("colorscheme rose-pine")
    end
  }
}
