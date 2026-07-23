return {
  -- Git Sign
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        numhl = true,
        current_line_blame = true,
      })
    end,
  },

  -- Auto Save
  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      enabled = true,
      execute_message = {
        enabled = true,
        message = function()
          return ("saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { -- See :h events
        immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
        defer_save = { "InsertLeave", "TextChanged" },
        cancel_deferred_save = { "InsertEnter" },
      },
      condition = nil,
      write_all_buffers = false,
      noautocmd = false,
      lockmarks = false,
      debounce_delay = 1500,
      debug = false,
    },
  },

  -- comfy number line
  {
    "mluders/comfy-line-numbers.nvim",
    config = function()
      require("comfy-line-numbers").setup()
    end,
  },

  -- Fidget
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {
      progress = {
        suppress_on_insert = true,
      },
      notification = {
        override_vim_notify = true,
      },
    },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<M-i>",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<M-o>",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      -- Mapping Meta + q,w,e,a,s,d,f to positions 1 through 7
      local harpoon_keys = { "q", "w", "e", "a", "s", "d", "f" }
      for i, key in ipairs(harpoon_keys) do
        table.insert(keys, {
          "<M-" .. key .. ">",
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  }
}
