return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		picker = {
			enabled = true,
			matcher = {
				frecency = true,
				cwd_bonus = true,
				fuzzy = true,
				smartcase = true,
				ignorecase = true,
			},
			layout = "new_layout",
			layouts = {
				new_layout = {
					layout = {
						box = "horizontal",
						border = "none",
						width = 0.8,
						height = 0.8,
						{
							box = "vertical",
							border = "none",
							gap = 0,
							{
								win = "input",
								height = 1,
								border = "single",
							},
							{ win = "list", border = "single" },
						},
						{
							win = "preview",
							border = "single",
							width = 0.55,
						},
					},
				},
			},
		},
		indent = {
			enabled = true,
			only_scope = true,
			animate = { enabled = false },
		},
	},
	sort_lastused = false,
	win = {
		input = {
			keys = {
				["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
				["<Esc>"] = "close",
			},
		},
		list = {
			keys = {
				["dd"] = "bufdelete",
				["<Esc>"] = "close",
			},
		},
	},

	keys = {
		{
			"<leader>ff",
			function()
				Snacks.picker.files({
					cwd = vim.fn.getcwd(),
				})
			end,
			desc = "Buffers",
		},

		{
			"<leader><leader>",
			function()
				Snacks.picker.recent({
					cwd = vim.fn.getcwd(),
				})
			end,
			desc = "Buffers",
		},

		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({
					cwd = vim.fn.getcwd(),
				})
			end,
			desc = "Find Files",
		},

		{
			"<leader>fg",
			function()
				Snacks.picker.grep({
					cwd = vim.fn.getcwd(),
				})
			end,
			desc = "Grep",
		},

		{
			"<leader>fr",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume Picker",
		},

		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},

		{
			"<C-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
	},
}
