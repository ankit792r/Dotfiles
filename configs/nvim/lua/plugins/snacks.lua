return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		picker = {
			enabled = true,
			matcher = {
				frecency = true,
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
			enabled = false,
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
				Snacks.picker.files()
			end,
			desc = "Buffers",
		},

		{
			"<leader><leader>",
			function()
				Snacks.picker.recent()
			end,
			desc = "Buffers",
		},

		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Files",
		},

		{
			"<leader>/",
			function()
				Snacks.picker.grep()
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
	},
}
