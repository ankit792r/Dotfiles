return {
	{
		"vague-theme/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true,
				bold = true,
				italic = true,
			})

			vim.cmd("colorscheme vague")
		end,
	},
}
