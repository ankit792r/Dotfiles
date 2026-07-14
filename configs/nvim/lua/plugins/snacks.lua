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
							width = 0.6,
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
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},

		-- find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},

		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
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
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},

		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},

		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},

		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},

		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},

		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},

		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},

		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},

		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
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
