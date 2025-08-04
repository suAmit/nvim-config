return {
  "folke/which-key.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.add({
      mode = { "n", "v" },
      { "<leader>e", group = "File Explorer", icon = { icon = "", color = "yellow" } },       
      { "<leader>b", group = "Buffer", icon = { icon = "", color = "cyan" } },         
      { "<leader>g", group = "Git", icon = { icon = "", color = "red" } },          
      { "<leader>f", group = "File", icon = { icon = "", color = "blue" } },         
      { "<leader>s", group = "Search", icon = { icon = "", color = "magenta" } },      
      { "<leader>S", group = "Session", icon = { icon = "", color = "green" } },        
      { "<leader>w", group = "Window", icon = { icon = "", color = "teal" } },         
      { "<leader>l", group = "Terminal", icon = { icon = "", color = "grey" } },         
      { "<leader>d", group = "TODO", icon = { icon = "", color = "orange" } },       
      { "<leader>t", group = "Tab", icon = { icon = "", color = "purple" } },      
      { "<leader>x", group = "Trouble", icon = { icon = "", color = "red" } },          
      { "<leader>m", group = "Linting/Formatting", icon = { icon = "", color = "lightgreen" }}, 
      { "<leader>z", group = "Lsp", icon = { icon = "", color = "skyblue" } },      
    })
  end,
}
