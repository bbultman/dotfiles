" CtrlSF
"
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_auto_close = {
    \ "compact": 1
    \}

noremap <leader>F :CtrlSF 
nmap     <C-F>f <Plug>CtrlSFPwordPath
nmap     <C-F>w <Plug>CtrlSFCwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
"
