return {
  'saghen/blink.cmp',
  dependencies = {
    'saghen/blink.lib',
    'rafamadriz/friendly-snippets',
  },
  -- build = function()
  --   require('blink.cmp').build():pwait()
  -- end,
  opts = {
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
    signature = { enabled = true },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      -- menu = {
      --   border = "single",
      --   draw = {
      --     treesitter = { "lsp" },
      --   },
      -- },
      documentation = { auto_show = false },
      ghost_text = {
        enabled = vim.g.ai_cmp,
        show_with_menu = true,
      }

    },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    fuzzy = { implementation = "lua" }
  },
}
