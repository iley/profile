return {{
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  config = function()
    require("nvim-tree").setup()
  end,
}}
