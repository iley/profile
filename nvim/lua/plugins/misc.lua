return {
  {
    "morhetz/gruvbox",
    config = function()
      vim.cmd "colorscheme gruvbox"
    end
  },
  {
    "vim-airline/vim-airline",
    config = function()
      vim.g.airline_powerline_fonts = 1
    end
  },
  {"github/copilot.vim"},
  {"sbdchd/neoformat"},
}
