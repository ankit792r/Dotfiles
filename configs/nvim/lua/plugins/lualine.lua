return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- local mocha = require("catppuccin.palettes").get_palette "mocha"

    require("lualine").setup({
      options = {
        globalstatus = true,
        section_separators = "",
        component_separators = "",
        disabled_filetypes = {
          "checkhealth",
          "snacks_dashboard",
          "NeogitConsole",
          "NeogitStatus",
          statusline = {},
          winbar = {},
        },
        -- theme = {
        --   normal = {
        --     a = { fg = mocha.text, bg = mocha.base },
        --     b = { fg = mocha.text, bg = mocha.base },
        --     c = { fg = mocha.text, bg = mocha.base },
        --   },
        --   insert = { a = { fg = mocha.base, bg = mocha.green } },
        --   visual = { a = { fg = mocha.base, bg = mocha.blue } },
        --   replace = { a = { fg = mocha.base, bg = mocha.red } },
        --   inactive = {
        --     a = { fg = mocha.base, bg = mocha.base },
        --     b = { fg = mocha.base, bg = mocha.base },
        --     c = { fg = mocha.base, bg = mocha.base },
        --   },
        -- },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              path = 0, -- show relative path
              padding = { left = 1, right = 1 },
            },
          },
          lualine_x = {},
          lualine_y = { "filetype" },
          lualine_z = { "progress", "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    })
  end
}
