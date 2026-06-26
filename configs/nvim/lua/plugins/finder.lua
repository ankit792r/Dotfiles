return {
  "ibhagwan/fzf-lua",
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      winopts = {
        border  = "single",
        height  = 0.85,
        width   = 0.80,
        title   = false,
        preview = {
          title = false,
          border = "single",
          layout = "horizontal"
        }
      },

      keymap = {
        fzf = {
          ["ctrl-j"] = "down",
          ["ctrl-k"] = "up",
        },
      },
    })

    vim.keymap.set("n", "<leader>ff", fzf.files, {
      desc = "Find files",
    })

    vim.keymap.set("n", "<leader>fg", fzf.live_grep_native, {
      desc = "Live grep",
    })

    vim.keymap.set("n", "<leader>fb", fzf.buffers, {
      desc = "Buffers",
    })

    vim.keymap.set("n", "<leader>fh", fzf.help_tags, {
      desc = "Help tags",
    })

    vim.keymap.set("n", "<leader><leader>", fzf.oldfiles, {
      desc = "Find old files",
    })

    vim.keymap.set("n", "<leader>fv", function()
      fzf.blines()
    end, {
      desc = "Current buffer fuzzy find",
    })

    vim.keymap.set("n", "<leader>fr", function()
      fzf.resume()
    end, {
      desc = "Resume previous picker",
    })

    fzf.register_ui_select()
  end,
}

-- return
-- {
--   'nvim-telescope/telescope.nvim',
--   version = '*',
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-telescope/telescope-ui-select.nvim",
--   },
--   config = function()
--     local actions = require("telescope.actions")
--     local builtin = require("telescope.builtin")
--
--     require("telescope").setup({
--       defaults = {
--         dynamic_preview_title = true,
--         layout_strategy = "horizontal",
--         borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
--         mappings = {
--           i = {
--             ["<C-j>"] = actions.move_selection_next,
--             ["<C-k>"] = actions.move_selection_previous,
--           },
--           n = {
--             ["<C-j>"] = actions.move_selection_next,
--             ["<C-k>"] = actions.move_selection_previous,
--           },
--         },
--       },
--       extensions = {
--         ["ui-select"] = {
--           require("telescope.themes").get_dropdown({}),
--         },
--         fzf = {
--           fuzzy = true,
--           override_generic_sorter = true,
--           override_file_sorter = true,
--           case_mode = "smart_case",
--         },
--       },
--
--     })
--
--     vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--     vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
--     vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--     vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
--     vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = 'Telescope find old files ' })
--     vim.keymap.set("n", "<leader>fv", builtin.current_buffer_fuzzy_find)
--     vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = 'Multi-selections of the previous picker' })
--
--     require("telescope").load_extension("ui-select")
--   end,
-- }
--
