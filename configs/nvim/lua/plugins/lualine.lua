local function macro_recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end
  return "Recording @" .. reg
end


return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
  },
  config = function()
    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = "",
        globalstatus = true,
        disabled_filetypes = {
          -- statusline = { "snacks_picker_list" }, -- Disables lualine in the explorer/picker window
          -- winbar = { "snacks_picker_list" }, -- Optional: disables winbar if you use one
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', macro_recording },
        lualine_x = {},
        lualine_y = { 'filetype', },
        lualine_z = { 'progress', 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
    })
  end
}
