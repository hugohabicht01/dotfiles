set shell=/bin/bash
syntax on
" set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim/

" Always show statusline
" set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set number relativenumber
