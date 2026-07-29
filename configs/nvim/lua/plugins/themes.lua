return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
        },
      })
      vim.o.pumborder = "single"
      vim.api.nvim_set_hl(0, "Normal", {bg= "none"})
      vim.api.nvim_set_hl(0, "NormalFloat", {bg= "none"})

      vim.cmd("colorscheme rose-pine")

      -- vim.cmd("colorscheme rose-pine-main")
    end,
  },

  -- {
  --   "bluz71/vim-moonfly-colors",
  --   name = "moonfly",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.moonflyItalics = true
  --     vim.o.pumborder = "single"
  --     vim.g.moonflyTransparent = true
  --     vim.g.moonflyNormalFloat = true
  --     vim.cmd("colorscheme moonfly")
  --   end,
  -- },
  -- {
  --   'vague-theme/vague.nvim',
  --   config = function()
  --     require("vague").setup({
  --       transparent = true
  --     })
  --     -- vim.cmd.colorscheme('vague')
  --   end,
  -- }
}
