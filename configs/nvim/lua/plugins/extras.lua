return {
  -- Git Sign
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        numhl = true,
        current_line_blame = true,
      })
    end,
  },

  -- comfy number line
  {
    "mluders/comfy-line-numbers.nvim",
    config = function()
      require("comfy-line-numbers").setup()
    end,
  },

  -- Fidget
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {
      progress = {
        suppress_on_insert = true,
      },
      notification = {
        override_vim_notify = true,
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = { "InsertEnter", "CmdlineEnter" },
    version = false,
    opts = {
      modes = {
        insert = true,
        command = true,
        terminal = false,
      },
    },
  }
}
