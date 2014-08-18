if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin indent on
""set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete


":python << EOF
"import os
"virtualenv = os.environ.get('VIRTUAL_ENV')
"if virtualenv:
"    activate_this = os.path.join(virtualenv, 'bin', 'activate_this.py')
"    if os.path.exists(activate_this):
"	execfile(activate_this, dict(__file__=activate_this))
"EOF


if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

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
call pathogen#infect()
call pathogen#helptags()

"python-mode"
let g:pymode = 1
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 79
let g:pymode_indent = 1

let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']


"let g:pymode_lint_write = 0"
"powerline"
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"rope"

