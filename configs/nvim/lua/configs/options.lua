vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.breakindent = true
opt.wrap = false
opt.backspace = { "start", "eol", "indent" }
opt.fillchars = { eob = " " } -- vert = " ", fold = " " }

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.inccommand = "split"
opt.gdefault = true
opt.cursorline = true
opt.showmatch = true
opt.showcmd = true
opt.laststatus = 3
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.signcolumn = "yes"

opt.clipboard = "unnamedplus"

opt.swapfile = false
opt.backup = false
-- opt.undodir = true
-- opt.guicursor = ""
opt.termguicolors = true

-- Splits
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "cursor"

opt.mouse = ""
opt.winborder = "single"

opt.showmode = true
opt.cmdheight = 0

vim.cmd([[ autocmd RecordingEnter * set cmdheight=1 ]])
vim.cmd([[ autocmd RecordingLeave * set cmdheight=0 ]])

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
