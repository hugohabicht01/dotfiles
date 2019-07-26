call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/vim-cursorword'
Plug 'tpope/vim-surround'
Plug 'shirohana/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'lifepillar/vim-solarized8'
call plug#end()

set shell=/bin/bash
syntax on
set t_Co=256
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set number relativenumber
set background=dark
" colorscheme solarized8


