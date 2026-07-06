-- Open Netrw Explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":wq<CR>")

local function map_window(lhs, dir)
	vim.keymap.set("n", lhs, "<C-w>" .. dir)

	vim.keymap.set("t", lhs, function()
		vim.cmd("wincmd " .. dir)
	end)
end

map_window("<C-h>", "h")
map_window("<C-j>", "j")
map_window("<C-k>", "k")
map_window("<C-l>", "l")

-- Navigate through window
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<esc>", "<cmd>noh<CR>")
vim.keymap.set("n", "<leader>sr", ":%s/")

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without loosing copied" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with cursor center" })

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

vim.keymap.set({ "n", "t" }, "<C-/>", function()
	Snacks.terminal.toggle()
end, { desc = "Toggle Terminal" })
