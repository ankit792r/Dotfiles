vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.wrap = false

vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.fillchars = { eob = " ", vert = " ", fold = " " }

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"
vim.opt.gdefault = true

vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"

vim.opt.mouse = ""

vim.wo.number = true
-- vim.opt.showmode = false
vim.opt.cmdheight = 0

vim.o.winborder = "single"

vim.diagnostic.config({
  signs = true,
  unerline = true,
  upate_in_insert = true,
  virtual_text = {
    prefix = "■",
  },
})
