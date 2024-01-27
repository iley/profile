-- NOTE: lazy.nvim and nvim-tree use nerd-fonts (https://www.nerdfonts.com/font-downloads).

require("basics")
require("bootstrap")

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
require("lazy").setup("plugins")

require("bindings")
