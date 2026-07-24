return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					transparency = true,
				},
			})
			vim.o.pumborder = "single"
			-- vim.cmd("colorscheme rose-pine")

			vim.cmd("colorscheme rose-pine-main")
		end,
	},

	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.g.moonflyItalics = true
			-- vim.o.pumborder = "single"
			-- vim.g.moonflyTransparent = true
			-- vim.g.moonflyNormalFloat = true
			-- vim.cmd("colorscheme moonfly")
		end,
	},
}
