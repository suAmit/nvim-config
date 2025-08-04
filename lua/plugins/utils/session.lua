return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>Sr", "<cmd>SessionRestore<CR>", desc = "Restore session" },
    { "<leader>Ss", "<cmd>SessionSave<CR>", desc = "Save session" },
    { "<leader>Sa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
    {
      "<A-S>",
      function()
        require("auto-session.session-lens").search_session()
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

    -- Session lens configuration
    session_lens = {
      load_on_setup = true,
      previewer = false,
      -- Telescope specific configuration
      theme_conf = {
        border = true,
        layout_config = {
          width = 0.5,
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
