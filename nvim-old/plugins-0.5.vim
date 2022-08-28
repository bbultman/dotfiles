call plug#begin('~/.local/share/nvim/')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'kevinhwang91/rnvimr', { 'do': 'make sync' }
Plug 'preservim/nerdcommenter'

Plug 'airblade/vim-rooter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-test/vim-test'

" 0.5 stuff
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
"

" This should always be last
Plug 'ryanoasis/vim-devicons'

call plug#end()
