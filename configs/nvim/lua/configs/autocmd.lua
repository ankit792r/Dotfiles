-- :delm! | delm A-Z0-9
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Clear all marks (local + global)
    vim.cmd("delmarks! | delmarks A-Z0-9")

    -- Clear jumplist
    vim.cmd("clearjumps")
  end,
})

vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("yazi").setup({
      open_for_directories = true,
    })
  end,
})

-- save text on change
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	pattern = "*",
	command = "silent! write",
})
