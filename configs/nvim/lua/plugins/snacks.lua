-- Snacks indent highlight color
vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#141414", nocombine = true })
vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#444444", nocombine = true })

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
			only_current = false,
			animate = { enabled = false },
			scope = {
				enabled = true,
				underline = false,
				only_current = true,
			},
			chunk = {
				enabled = true,
				only_current = true,
			},
		},
		words = {
			enabled = true,
		},
	},
	sort_lastused = false,
	ui_select = true,
	formatters = {
		file = {
			filename_first = true,
			truncate = 80,
		},
	},
	win = {
		input = {
			keys = {
				["<Esc>"] = "close",
				["<C-x>"] = { "bufdelete", mode = { "n", "i" } },
				["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
				["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
				["<C-j>"] = { "list_down", mode = { "i", "n" } },
				["<C-k>"] = { "list_up", mode = { "i", "n" } },
				["<C-q>"] = "qflist",
			},
		},
		list = {
			keys = {
				["dd"] = "bufdelete",
				["<Esc>"] = "close",
			},
		},
	},
	sources = {
		explorer = {
			hidden = true,
			ignored = true,
		},
	},

	keys = {
		{
			"<leader><space>",
			function()
				Snacks.picker.smart({
					cwd = vim.fn.getcwd(),
				})
			end,
			desc = "open file picker",
		},

    {
      "<leader>,",
      function()
        Snacks.picker.buffers({
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
			desc = "open buffer picker",
		},

		{
			"<leader>ff",
			function()
				Snacks.picker.files({
					cwd = vim.fn.getcwd(),
				})
			end,
			desc = "Smart Find Files",
		},

		{
			"<leader>sg",
			function()
				Snacks.picker.grep({
					cwd = vim.fn.getcwd(),
				})
			end,
			"Find grep files",
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
				Snacks.picker.grep_buffers({
					cwd = vim.fn.getcwd(),
				})
			end,
			desc = "Search Open Buffers",
		},

		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word({
					cwd = vim.fn.getcwd(),
				})
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},

		{
			"<leader>fr",
			function()
				Snacks.picker.recent({
					cwd = vim.fn.getcwd(),
				})
			end,
			desc = "Recent files",
		},

		-- search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},

		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},

		{
			"<leader>s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},

		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},

		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
	},
}
