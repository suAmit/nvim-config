return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")
    local lang_list = require("plugins.custom.lang")
    -- configure treesitter
    treesitter.setup({

      sync_install = false,
      auto_install = false,
      ignore_install = {},
      -- enable syntax highlighting
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local filename = vim.api.nvim_buf_get_name(buf)
          local ok, stats = pcall(vim.uv.fs_stat, filename)
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        -- disable = { "ocaml", "dart" },
      },
      -- autotag = {
      --   enable = true,
      -- },
      -- ensure these language parsers are installed
      ensure_installed = lang_list.language.treesitter.syntex,

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
