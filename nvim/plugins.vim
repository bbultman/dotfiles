call plug#begin('~/.local/share/nvim/')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'kevinhwang91/rnvimr', { 'do': 'make sync' }

Plug 'tpope/vim-eunuch'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'airblade/vim-rooter'

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-test/vim-test'

" 0.5 stuff
"Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"
"Plug 'neovim/nvim-lspconfig'
"Plug 'williamboman/nvim-lsp-installer'
"

" This should always be last
Plug 'ryanoasis/vim-devicons'

call plug#end()
