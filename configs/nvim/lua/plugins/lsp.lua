return {
  -- Mason LSP
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    lazy = false,
    config = function()
      require("mason").setup({ ui = { border = "single" } })
      require("mason-lspconfig").setup({
        auto_install = true,
        ensure_installed = { "lua_ls" },
      })
    end,
  },

  -- Nvim LSP
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = function(_, opts)
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.virtual_text = false -- Keeping your preference
      opts.diagnostics.severity_sort = true
    end,
    config = function()
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = "LSP: " .. desc })
      end

      -- Navigation
      map("n", "K", vim.lsp.buf.hover, "Hover Doc")
      map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
      map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
      map("n", "gr", vim.lsp.buf.references, "Goto References")
      map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
      map("n", "gy", vim.lsp.buf.type_definition, "Type Definition")
			map("n", "<leader>rr", vim.lsp.buf.rename, "Rename reference")
      map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

      vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
      vim.diagnostic.config({ virtual_text = true })

      -- Actions & Refactoring
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
      map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
      map("n", "<leader>cR", function()
        vim.lsp.buf.rename(nil, { rename_file = true })
      end, "Rename File")

      -- Diagnostics (CRITICAL since virtual_text is off)
      map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
      map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")

      map("n", "<leader>cd", function()
        vim.diagnostic.open_float({
          scope = "cursor",
          focusable = true, -- This allows you to 'tab' into the window and scroll
          border = "single",
        })
      end, "Show scrollable diagnostic")

      map("n", "<leader>cl", vim.diagnostic.setqflist, "LSP Quickfix List")

      -- Call Hierarchy
      map("n", "gai", vim.lsp.buf.incoming_calls, "Incoming Calls")
      map("n", "gao", vim.lsp.buf.outgoing_calls, "Outgoing Calls")
    end,
  },

  -- None LS
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "mason.nvim", "nvimtools/none-ls-extras.nvim" },
    config = function()
      require("null-ls").setup()
      vim.keymap.set("n", "<leader>cf", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "LSP: Format File" })
    end,
  },
}
