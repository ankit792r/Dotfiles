-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
--     require("rose-pine").setup()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end
-- }

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup()
		vim.cmd("colorscheme catppuccin-nvim")
  end
}
