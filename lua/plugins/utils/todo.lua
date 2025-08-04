return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- TODO: JS
    -- FIX: JS
    -- HACK: JS
    -- NOTE: JS
    -- PERF: JS
    -- WARNING: JS

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>dn", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "<leader>dp", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })
    keymap.set("n", "<leader>dl", "<cmd>TodoLocList<CR>", { desc = "Todos List" })
    keymap.set("n", "<leader>dt", "<cmd>TodoTelescope<CR>", { desc = "Todos telescope" })

    todo_comments.setup()
  end,
}
