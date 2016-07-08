filetype off
call pathogen#infect()
call pathogen#helptags()
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
set runtimepath^=~/.vim/bundle/ctrlp.vim  " ctrl-p runtime path
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
set guiheadroom=0
"colorscheme desert        " set colorscheme
colorscheme gruvbox       " set colorscheme
set bg=dark               " Setting dark mode for gruvbox
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
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
"letlet mapleader = " " g:user_emmet_leader_key='<C-E>' "Use Ctrl-Z , with cursor after text
let NERDTreeIgnore = ['\.pyc$']
"let g:pymode_rope = 1
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
im :<CR> :<CR>
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_jshint_exec='C:\Users\hanleyt\AppData\Roaming\npm\jshint.cmd' 
"sets the tag highlighting to be white no background
hi MatchParen cterm=none ctermbg=none ctermfg=white 
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" select all mapping
noremap <leader>a ggVG
