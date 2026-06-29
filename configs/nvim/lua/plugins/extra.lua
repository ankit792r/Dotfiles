return {
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

  -- Nvim Highlight colors
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup()
    end,
  },

  -- inline diagnostics
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "powerline",
        options = {
          show_all_diags_on_cursorline = true,
          add_messages = {
            messages = true,
            show_multiple_glyphs = true,
            display_count = true,
          },
          multilines = {
            enabled = true,
            always_show = true,
          },
          overflow = {
            mode = "wrap",
            padding = 8
          },
          show_related = {
            enabled = true,
            max_count = 3,
          },
        },
      })
      vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = true,
      })
    end,
  }
}
