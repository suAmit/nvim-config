return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<A-\\>" },
    {
      "<leader>lh",
      "<cmd>:ToggleTerm size=math.floor(vim.o.lines * 0.3) dir=~/Desktop direction=horizontal name=desktop<CR>",
      desc = "ToggleTerm horizontal split",
    },
    {
      "<leader>lv",
      "<cmd>:ToggleTerm size=math.floor(vim.o.columns * 0.4) dir=~/Desktop direction=vertical name=desktop<CR>",
      desc = "ToggleTerm vertical split",
    },
    {
      "<leader>lb",
      "<cmd>:ToggleTerm dir=~/Desktop direction=tab name=desktop<CR>",
      desc = "ToggleTerm new tab",
    },
    {
      "<leader>lf",
      "<cmd>:ToggleTerm dir=~/Desktop direction=float name=desktop<CR>",
      desc = "ToggleTerm float",
    },
  },
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal

    -- Setup toggleterm
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return math.floor(vim.o.lines * 0.3)
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      open_mapping = [[<A-\>]],
      direction = "horizontal",
    })

    -- Optional floating terminal example
    local gh_dash = Terminal:new({
      cmd = "gh dash",
      hidden = true,
      direction = "float",
      float_opts = {
        height = function() return math.floor(vim.o.lines * 0.8) end,
        width = function() return math.floor(vim.o.columns * 0.95) end,
      },
    })
    -- Terminal window keymaps (buffer-local, no tmux conflict)
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
  end,
}

