set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'klen/python-mode'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'leafgarland/typescript-vim'
Plugin 'honza/vim-snippets'
call vundle#end()            " required

filetype plugin indent on
""set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete


":python << EOF
"import os
"virtualenv = os.environ.get('VIRTUAL_ENV')
"if virtualenv:
"    activate_this = os.path.join(virtualenv, 'bin', 'activate_this.py')
"    if os.path.exists(activate_this):
"   execfile(activate_this, dict(__file__=activate_this))
"EOF


syntax on
set t_Co=256
" set background=dark
" colorscheme distinguished
" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
set ruler

set hls!
set hlsearch
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted 
"use :set list! to toggle visible whitespace on/off 
"set listchars=tab:>-,trail:.,extends:>

"python-mode"
"let g:pymode = 1
"let g:pymode_folding = 0
"let g:pymode_options_max_line_length = 79
"let g:pymode_indent = 1

"let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']

set nocompatible

"let g:pymode_lint_write = 0"
"powerline"
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" JavaScript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"let g:pymode_python = 'python3'

set backspace=indent,eol,start


" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']




