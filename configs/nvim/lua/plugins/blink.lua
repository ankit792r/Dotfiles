return {
  "saghen/blink.cmp",
  dependencies = {
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
    {
      "saghen/blink.compat",
      optional = true, -- make optional so it's only enabled if any extras need it
      opts = {},
      version = "*",
    },
  },
  build = function()
    require("blink.cmp").build():pwait()
  end,
  opts = {
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
    snippets = {
      preset = "default",
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },
    signature = { enabled = true },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        auto_show = true,
        border = "single",
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = { auto_show = true },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust" },
    cmdline = {
      enabled = true,
      keymap = {
        preset = "cmdline",
        ["<Right>"] = false,
        ["<Left>"] = false,
      },
      completion = {
        list = { selection = { preselect = false } },
        menu = {
          auto_show = function(_)
            return vim.fn.getcmdtype() == ":"
          end,
        },
        ghost_text = { enabled = true },
      },
    },
  },
}
