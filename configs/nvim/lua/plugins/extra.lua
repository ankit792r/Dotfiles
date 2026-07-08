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
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "powerline",
				options = {
					multilines = {
						enabled = true,
						always_show = true,
					},
					break_line = {
						enabled = false,
						after = 20,
					},
					overflow = {
						mode = "wrap",
						padding = 8,
					},
					show_all_diags_on_cursorline = true,
					enable_on_insert = false,
				},
			})

			vim.diagnostic.config({
				virtual_text = false,
				update_in_insert = true,
			})
		end,
	},

	-- Mini Surround
	{
		"nvim-mini/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},

	-- Mini indent
	{
		"nvim-mini/mini.indentscope",
		version = "*",
		config = function()
			require("mini.indentscope")
		end,
	},

	-- Nvim Highlight colors
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
      win = {
        border = "single",
      }
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
