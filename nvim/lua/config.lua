local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands

cmd('autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=grey') -- to Show whitespace, MUST be inserted BEFORE the colorscheme command

set.termguicolors = true

set.wildignore = set.wildignore + "*/tmp/*,*.so,*.swp,*.zip"
set.undofile = true
set.wrap = true
set.showmatch = true
set.incsearch = true
set.hlsearch = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.ignorecase = true
set.autoindent = true
set.ruler = true
set.showcmd = true
set.cmdheight = 2
set.secure = true
set.number = true
set.relativenumber = true
set.completeopt = 'menu,menuone'
