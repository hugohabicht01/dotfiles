call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'chaoren/vim-wordmotion'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'itchyny/vim-cursorword'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'lifepillar/vim-solarized8'
Plug 'mattn/emmet-vim'
Plug 'mboughaba/i3config.vim'
Plug 'posva/vim-vue'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vista.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-startify'
Plug 'editorconfig/editorconfig-vim'
Plug 'github/copilot.vim'
Plug 'dracula/vim'
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
Plug 'folke/which-key.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

  require('gitsigns').setup {
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 400,
        ignore_whitespace = true
    }
  }

EOF

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set showcmd
set shell=/bin/zsh
set incsearch
set hlsearch
set encoding=utf-8
set splitright
set splitbelow
set foldmethod=indent
set foldlevel=99
set nocompatible
set wildmenu
set path+=**
filetype plugin on
syntax on
let &t_ut=''
" Use dark solarized colorscheme
set termguicolors
set background=dark
" colorscheme OceanicNext
colorscheme dracula

let mapleader=" "


" NERDTree Settings
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
map <F3> :NERDTreeToggle<CR>

set softtabstop=0 expandtab shiftwidth=4 smarttab


let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = "\uE0B8 "
let g:airline_right_sep = " \uE0BA "

let g:airline_solarized_bg='dark'

set guifont=MesloLGL\ Nerd\ Font


" Kite configs, kite currently not installed tho
let g:kite_auto_complete=1
let g:kite_supported_languages = ['python']
let g:kite_auto_complete=1
let g:kite_snippets=1
let g:kite_tab_complete=1
let g:kite_log=1

set completeopt+=preview
set completeopt+=menuone
set completeopt+=noinsert

set number relativenumber

" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
set clipboard+=unnamedplus
let g:indentLine_char = '|'
let g:vue_pre_processors = ['scss']

" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Rg<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Use ag as the search command and ignore everything from .gitignore
" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!{node_modules,.git,Downloads,steamapps}'"

" let g:livepreview_previewer = 'zathura'
let g:vimtex_view_method = 'zathura'
" Disable IndentLine for LaTeX files

augroup disabletexindent
  autocmd!
  autocmd FileType tex IndentLinesToggle
augroup END

let g:tex_flavor = "latex"

let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F10>'

" Coc.nvim settings:
" TextEdit might fail if hidden is not set.
set hidden
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif 


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use gh to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>F2 <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)



" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    
" coc-pydoq bindings
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)


" Todos and fixmes
nmap <leader>t :TodoLocList<CR>
