return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local highlight = require("nvim-highlight-colors")

    highlight.setup({
      render = "background",
    })
  end,
}
