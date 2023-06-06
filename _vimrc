set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"----------------------------------------------------------
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'  " Code Folding 
Plugin 'vim-scripts/indentpython.vim' " Python Identation 
Plugin 'Valloric/YouCompleteMe' " Code Completion
Plugin 'nvie/vim-flake8' " Python PEP8 checking 
Plugin 'dense-analysis/ale' " Linting 
Plugin 'kien/ctrlp.vim' " fuzzy finder
Plugin 'vim-airline/vim-airline' " Vim Status Line
Plugin 'vim-airline/vim-airline-themes' " Color themese for airline
Plugin 'tpope/vim-surround' " Vim Surround plugin 
Plugin 'jiangmiao/auto-pairs' " auto close braces and scopes
Plugin 'alvan/vim-closetag' " HTML automtically close tags
Plugin 'mattn/emmet-vim' " HTML coding for vim 
Plugin 'SirVer/ultisnips' " code snippets 
Plugin 'honza/vim-snippets' " code snippets 
Plugin 'tmhedberg/matchit' " switch to beginning and end of block with %

" Colours 
Plugin 'sonph/onehalf', {'rtp':'vim'}
Plugin 'ayu-theme/ayu-vim'
"----------------------------------------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"=============================================================
" Other settings start here
"---------------------------------------------
" Colours 
syntax on
let python_highlight_all=1 " Python highlighting 

" Onehalf 

"set t_Co=256
"set cursorline
"colorscheme onehalfdark
"let g:airline_theme='onehalflight'
"if exists('+termguicolors')
"	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"	set termguicolors
"endif

set termguicolors
let ayucolor="dark"
colorscheme ayu
" --------------------------------------------
" Code Folding
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za
" Show docstring 
let g:SimplyFold_docstring_preview=1

"---------------------------------------------
" Python 

" Code Completion - you Complete me 
let g:ycm_key_list_select_completion = ['<ENTER>']
let g:ycm_autoclose_preview_window_after_completion=1
let g:ymc_auto_trigger=0

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Code Completion VirtualEnv Support
py3 3 
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
"--------------------------------------------
" Ultisnips configuration 
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

"---------------------------------------------
"Web Development
"
"HTML/Javascript/CSS  Indentation 
au BufNewFile,BufRead *.js, *.html, *.css
			\ set tabstop=2
			\ softtabstop=2
			\ shiftwidth=2

"---------------------------------------------
" Miscellanous
"
set encoding=utf-8 " UTF-8
set nu " line numbers
set cursorline " highlight cursorline
set showmatch               " show matching 
set hlsearch   " highlight search
set modeline

"-----------------------------------------------------
" Vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"-------------------------------------------
" ALE Linting 
let g:ale_linters = {'python': 'all'}
let g:ale_fixers = {'python': ['isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace']}
let g:ale_lsp_suggestions = 1
let g:ale_fix_on_save = 1
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_completion_enabled = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
