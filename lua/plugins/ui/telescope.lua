return {
  "nvim-telescope/telescope.nvim",
  -- branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    -- Find files and content
    { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files (cwd)" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files (cwd)" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find files (git)" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Search string (grep)" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Search under cursor" },

    -- Help / Search
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to mark" },
    { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume last picker" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Buffer diagnostics" },

    -- Buffers
    { "<leader>bb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>,",  "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch buffer" },

    -- Git
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },

    -- Misc
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
  },

  config = function()
    local ok, telescope = pcall(require, "telescope")
    if not ok then return end

    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_strategy = "flex",
        layout_config = {
          width = 0.9,
          height = 0.9,
          preview_cutoff = 1,
          anchor = "CENTER",
        },
        path_display = { "smart" },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-u>"] = false,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-d>"] = actions.delete_buffer,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
          },
        },
      },
    })

    -- Load fzf extension
    pcall(telescope.load_extension, "fzf")
  end,
}
