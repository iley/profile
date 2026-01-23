local o = vim.opt

-- basic editing
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.ruler = true
o.modeline = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.smarttab = true
o.wrap = false
o.joinspaces = false
o.mouse = ""

o.shiftround = true -- remove extra spaces during indentation

-- search and replace
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.magic = true

-- C autoindent
o.cinoptions = "l1" -- switch case indents

local configpath = vim.fn.stdpath("config")
o.directory = configpath .. "/swap"
o.backupdir = configpath .. "/backup"
o.undodir = configpath .. "/undo"
o.swapfile = true
o.backup = true
o.undofile = true
