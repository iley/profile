local function config()
  require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
end

return {{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = config,
}}
