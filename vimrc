filetype off
call pathogen#infect()
call pathogen#helptags()
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
set runtimepath^=~/.vim/bundle/ctrlp.vim  " ctrl-p runtime path
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme desert        " set colorscheme
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set nowrap                " don't wrap text  
set tabstop=4             " tab spacing
set shiftwidth=4          " indent/outdent by 4 columns                          
set smarttab              " use tabs at the start of a line, spaces elsewhere    
set expandtab             " use spaces instead of tabs                           
set autoindent            " auto-indent
set colorcolumn=81
set clipboard=unnamedplus
set vb t_vb=
map <F2> :NERDTreeToggle<CR>
let mapleader ="\<Space>"
"let g:user_emmet_leader_key='<C-E>' "Use Ctrl-Z , with cursor after text
let NERDTreeIgnore = ['\.pyc$']
"let g:pymode_rope = 1
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
im :<CR> :<CR>

