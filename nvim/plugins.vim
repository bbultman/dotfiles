call plug#begin('~/.local/share/nvim/')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-test/vim-test'

" This should always be last
Plug 'ryanoasis/vim-devicons'

call plug#end()
