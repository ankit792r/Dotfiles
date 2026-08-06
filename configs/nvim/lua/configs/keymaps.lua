-- Open Netrw Explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":wq<CR>")

-- Use jj to ecape
vim.keymap.set("n", "<leader>Q", ":wq<CR>")
vim.keymap.set("i", "jj", "<Esc>")

local function map_window(lhs, dir)
	vim.keymap.set("n", lhs, "<C-w>" .. dir)

	vim.keymap.set("t", lhs, function()
		vim.cmd("wincmd " .. dir)
	end)
end

-- Navigate through window
map_window("<C-h>", "h")
map_window("<C-j>", "j")
map_window("<C-k>", "k")
map_window("<C-l>", "l")

vim.keymap.set("n", "<esc>", "<cmd>noh<CR>")
vim.keymap.set("n", "<leader>sr", ":%s/")

vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

vim.keymap.set("i", "<C-f>", "<C-x><C-f>", { noremap = true, silent = true})
