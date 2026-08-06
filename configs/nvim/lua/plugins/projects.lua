return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/Projects/*",
    },
    picker = {
      type = "snacks",
    }
  },
  init = function()
    vim.opt.sessionoptions:append("globals")

    vim.keymap.set("n", "<leader>pp", "<cmd>NeovimProjectDiscover default<CR>", {
      desc = "Find Projects",
    })

    vim.keymap.set("n", "<leader>fr", "<cmd>NeovimProjectHistory<CR>", {
      desc = "Recent Projects",
    })
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "folke/snacks.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
