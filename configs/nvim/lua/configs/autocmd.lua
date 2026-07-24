-- :delm! | delm A-Z0-9
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Clear all marks (local + global)
		vim.cmd("delmarks! | delmarks A-Z0-9")

		-- Clear jumplist
		vim.cmd("clearjumps")
	end,
})
