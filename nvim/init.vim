" Config management
"
let g:config_file_list = [
\ 'plugins.vim',
\ 'coc-defaults.vim',
\ 'ctrl-sf.vim',
\ 'ctrl-p.vim',
\ 'vim-test.vim',
\ ]

for f in g:config_file_list
    execute 'source ' . stdpath('config') . '/' . f
endfor

noremap <silent> <leader>ev :tabnew $MYVIMRC<CR>
noremap <silent> <leader>sv :source $MYVIMRC<CR>
"

" Prettier
"
command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <silent> <leader>p :Prettier<CR>
"

" Theming
"
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

syntax on
colorscheme onedark
set termguicolors
"

" General
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ignorecase
set autoindent
set ruler
set showcmd
set cmdheight=2
set exrc
set secure
set number relativenumber
"

" Coc does not seem to clean up after itself -- manually kill all open coc processes on exit
autocmd VimLeavePre * :call coc#rpc#kill()
autocmd VimLeave * if get(g:, 'coc_process_pid', 0) | call system('kill -9 -'.g:coc_process_pid) | endif

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
