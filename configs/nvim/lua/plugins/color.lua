return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			styles = {
				transparency = true,
			},
		})
		vim.o.pumborder = "single"
		vim.cmd("colorscheme rose-pine")
	end,
}

-- return {
-- {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			transparent_background = true,
-- 			float = {
-- 				transparent = true, -- enable transparent floating windows
-- 				solid = false, -- use solid styling for floating windows, see |winborder|
-- 			},
-- 		})
-- 		vim.cmd("colorscheme catppuccin-nvim")
-- 	end,
-- },
-- {
-- 	"bluz71/vim-moonfly-colors",
-- 	name = "moonfly",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.moonflyItalics = true
-- 		vim.o.pumborder = "single"
-- 		vim.g.moonflyTransparent = true
-- 		vim.g.moonflyNormalFloat = true
-- 		vim.cmd("colorscheme moonfly")
-- 	end,
-- },
-- }
