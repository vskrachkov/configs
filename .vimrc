"===========MAP=========
map <c-n> :bn<CR>
map <c-b> :bp<CR>
map <c-s> :w<CR>
map <c-x> :bd<CR>

"======================


" Set TAB
set tabstop=4

"=====================================================
" Vundle settings
"=====================================================
set nocompatible " only vim
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'	" install Vundle
Plugin 'scrooloose/nerdtree' 	" install NerdTree
Plugin 'majutsushi/tagbar'      " install TagBar
"Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline' 	" install Vim-Airline
Plugin 'tpope/vim-surround'	" autoclose tags html

"=====================================================
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo
"=====================================================

"=================Language_Support====================
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
"=====================================================
"Git
Plugin 'trope/vim-fugitive'
"Virtualenv
Plugin 'jmcantrell/vim-virtualenv'

call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
set backspace=indent,eol,start

syntax on
" Отключаем мигание и пищание
set visualbell t_vb= 
set novisualbell

set enc=utf-8	

set ls=2

set hlsearch

set nu
autocmd FileType python setlocal colorcolumn=80
" Указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/bundle/vim-snippets/snippets"

"=======   Django   =======
let g:django_activate_virtualenv = 1 "Try to activate the associated virtualenv
let g:django_activate_nerdtree = 1 "Try to open nerdtree at the project root.




" =============НАСТРАИВАЕМ ВНЕШНИЙ ВИД===============
"==================Vim-Airline=======================
set laststatus=2

"let g:airline_theme = 'silver'
"let g:airline_theme = 'luna'
"let g:airline_theme = 'papercolor'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" ==========	DARK THEME 	 =======================
let g:airline_theme = 'raven'

set t_Co=256
color ron
"highlight ColorColumn ctermbg=grey
"hi Pmenu ctermfg=0 ctermbg=6 guibg=2
"hi Function ctermfg=12 guifg=green
"hi String ctermfg=6 guifg=2
"hi Type ctermfg=14 guifg=5 
"hi Number ctermfg=red guifg=9 
"hi Statement ctermfg=13
"hi Identifier ctermfg=4 guifg=4 
"hi Operator ctermfg=15 guifg=11
"hi Float ctermfg=9 guifg=10 
"hi Include ctermfg=9 guifg=9
"hi Normal guifg=4 guibg=4
"hi Conditional ctermfg=11
"hi CursorLine ctermbg=0
"hi VertSplit term=reverse cterm=reverse guifg=0 guibg=0 ctermbg=0 ctermfg=0


" 		===========LIGHT THEME===========
"hi Pmenu ctermfg=0 ctermbg=6 guibg=2
"hi Function ctermfg=green guifg=green
"hi String ctermfg=2 guifg=2
"hi Type ctermfg=14 guifg=5 
"hi Number ctermfg=red guifg=9 
"hi Statement ctermfg=11
"hi Identifier ctermfg=4 guifg=4 
"hi Operator ctermfg=11 guifg=11
"hi Float ctermfg=9 guifg=9 
"hi Include ctermfg=9 guifg=9
"hi Normal guifg=4 guibg=4
"hi Conditional ctermfg=6
"hi CursorLine ctermbg=0
"hi VertSplit term=reverse cterm=reverse guifg=0 guibg=0 ctermbg=0 ctermfg=0
"
"====================================================
"====================================================


"==================TagBar============================
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

"================ NerdTree настройки ================
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$', '__pycache__'] 

"=================PythonMode=========================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 1

"===================Jedi-Vim================
" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 1
let g:jedi#popup_on_dot = 1

"==============Pymode================
"let g:pymode_python = 'python3'


"================Табуляция=================
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
			\ formatoptions+=croq softtabstop=4 smartindent
			\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

"========Шаблоны=============
"autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

"====StatusLine===
"set  statusline += %{fugitive#head()}

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:jedi#goto_command = "<Leader>g"
let g:jedi#use_splits_not_buffers = 1

