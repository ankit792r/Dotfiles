return {

  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- Optional: Improves the UI for device selection
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "single",
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          }
        },
        widget_guides = {
          enabled = true, -- Displays UI guidelines for widget trees
        },
        closing_tags = {
          enabled = true, -- Displays virtual text comment at the end of a widget
        },
        flutter_path = "~/Sdk/flutter/bin/flutter",
        lsp = {
          color_capabilities = true,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
          },
        },
      })
    end,
  },
  {
    "dart-lang/dart-vim-plugin",
    config = function()
      vim.g.dart_style_guide = 2
      vim.g.dart_format_on_save = 1
      vim.g.dart_trailing_comma_indent = true
    end
  }
}
