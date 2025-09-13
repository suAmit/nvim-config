return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>Sr", "<cmd>AutoSession restore<CR>", desc = "Restore session" },
    { "<leader>Ss", "<cmd>AutoSession save<CR>", desc = "Save session" },
    { "<leader>Sa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
    {
      "<A-S>",
      function()
        require("auto-session.pickers.telescope").extension_search_session()
      end,
      desc = "Search sessions",
    },
  },
  opts = {
    -- Basic configuration
    auto_restore_enabled = false,
    auto_session_suppress_dirs = {
      "~/",
      "~/Dev/",
      "~/Downloads",
      "~/Documents",
      "~/Desktop/",
    },

    -- git
    git_use_branch_name = true,
    git_auto_restore_on_branch_change = true,

    -- Session lens configuration
    session_lens = {
      load_on_setup = true,
      previewer = false,
      -- Telescope specific configuration
      theme_conf = {
        border = true,
        layout_config = {
          width = 0.4,
          height = 0.4,
        },
      },

      -- Custom mappings for session lens
      mappings = {
        delete_session = { "i", "<C-D>" },
        alternate_session = { "i", "<C-S>" },
        copy_session = { "i", "<C-Y>" },
      },
      buftypes_to_ignore = {},
    },
  },
}
