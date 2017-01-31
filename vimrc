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
set relativenumber
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
set wildignore+=*/node_modules/*,*.so,*.swp,*.zip 
map <F2> :NERDTreeToggle<CR>
map <Space> <leader>
let g:paredit_mode = 1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
"let g:user_emmet_leader_key='<C-E>' "Use Ctrl-Z , with cursor after text
"let mapleader = " " 
"g:user_emmet_leader_key='<C-E>' "Use Ctrl-Z , with cursor after text
let NERDTreeIgnore = ['\.pyc$']
"let g:pymode_rope = 1
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
im :<CR> :<CR>
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"au BufRead,BufNewFile *.ts        setlocal filetype=typescript
"set rtp+=$HOME/.vim/bundle/node_modules/typescript-tools.vim/
autocmd! BufWritePost * Neomake " Add BufEnter to run on ever entry
let g:neomake_verbose=3
let g:neomake_logfile='/home/tom/tmp/error.log'
let g:neomake_open_list = 2
"let g:neomake_warning_sign = {
  "\ 'text': 'W',
  "\ 'texthl': 'WarningMsg',
  "\ }
"let g:neomake_error_sign = {
  "\ 'text': 'E',
  "\ 'texthl': 'ErrorMsg',
  "\ }
let g:neomake_python_enabled_makers = ['pylint', 'pep8']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
let g:neomake_javascript_enabled_makers = ['flow']
nnoremap <leader>ne :ll<CR>
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['jshint']
"let g:fsharpbinding_debug = 1
"let g:syntastic_enable_signs=1     " enables error reporting in the gutter
"let g:syntastic_javascript_jshint_exec='C:\Users\hanleyt\AppData\Roaming\npm\jshint.cmd' 
"sets the tag highlighting to be white no background
hi MatchParen cterm=none ctermbg=none ctermfg=white 
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" select all mapping
noremap <leader>a ggVG
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(node_modules)$',
  "\ 'file': '\v\.(dll)$',
  "\ }
" Urxvt mappings - Find for terminal (in insert) Ctrl-V [Command] 
" i.e Ctrl-V Ctrl + Up = > Oa means Esc O a
"map <ESC>Oa <C-Up>
"map <ESC>Ob <C-Down>
"map <ESC>Od <C-Left>
"map <ESC>Oc <C-Right>
"map! <ESC>Oa <C-Up>
"map! <ESC>Ob <C-Down>
"map! <ESC>Od <C-Left>
"map! <ESC>Oc <C-Right>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
imap jk <Esc>

map <F3> :mksession! /home/tom/.vimsessions/.vimsession <cr> " Quick write session with F2
map <F4> :source /home/tom/.vimsessions/.vimsession <cr>     " And load session with F3

