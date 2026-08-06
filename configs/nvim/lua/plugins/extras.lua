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

	{
		"chrisgrieser/nvim-recorder",
		-- dependencies = "rcarriga/nvim-notify", -- optional
		opts = {}, -- required even with default settings, since it calls `setup()`
	},

	-- Auto Save
	{
		"okuuva/auto-save.nvim",
		version = "^1.0.0",
		cmd = "ASToggle",
		event = { "InsertLeave", "TextChanged" },
		opts = {
			enabled = true,
			execute_message = {
				enabled = true,
				message = function()
					return ("saved at " .. vim.fn.strftime("%H:%M:%S"))
				end,
				dim = 0.18,
				cleaning_interval = 1250,
			},
			trigger_events = { -- See :h events
				immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
				defer_save = { "InsertLeave", "TextChanged" },
				cancel_deferred_save = { "InsertEnter" },
			},
			condition = nil,
			write_all_buffers = false,
			noautocmd = false,
			lockmarks = false,
			debounce_delay = 1500,
			debug = false,
		},
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
		"hedyhli/outline.nvim",
		config = function()
			vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

			require("outline").setup({
				show_relative_numbers = true,
				auto_width = {
					enabled = true,
					max_width = 40,
					include_symbol_details = true,
				},
			})
		end,
	},
}
