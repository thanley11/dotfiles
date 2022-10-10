set bg=dark
colorscheme gruvbox
syntax on

set guifont=Fira\ Code\:h20
set t_Co=256              " enable 256-color mode.
set ttimeout
set ttimeoutlen=0
scriptencoding utf-8
set encoding=utf-8
set smartindent
set nofoldenable
set showmatch
set vb t_vb=
"set guiheadroom=0
set relativenumber
set textwidth=80
set formatoptions=qrn1
set wrapmargin=0
set autoindent
set wrapmargin=0
set cc=0
set number
set tabstop=2
set shiftwidth=2
set expandtab
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set exrc
set secure
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
" Make Searching Beter
set gdefault
set ignorecase
 " ctags optimization
au FileType gitcommit,gitrebase,tags,md,yml,yaml,json,map, let g:gutentags_enabled=0
set tags=tags;
" Stop highlight after searching
"
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set visualbell    " stop that ANNOYING beeping
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
set backspace=2   " Backspace deletes like most programs in insert mode
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler         " show the cursor position all the time
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" Configure Cursor shape based on mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


set updatetime=50

set shortmess+=c
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.md set filetype=markdown

if empty(glob('~/.vim/autoload/plug.vim'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set termguicolors
call plug#begin('~/.vim/plugged')
" Color / Themes
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
" Movement
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Junegunn
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx', {'for': ['javascript', 'typescript', 'typescript.react', 'javascript.react']}
Plug 'leafgarland/typescript-vim',  {'for': ['typescript', 'typescript.react']}
"Plug 'HerringtonDarkholme/yats.vim'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'

" Completion
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
"Plug 'neovim/nvim-lsp'

" File Tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-vinegar'

" Other
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
call plug#end()


"************************vim-jsx******************
let g:jsx_ext_required = 0
" ******************************************************

" ************************ALE Setup******************************
let g:ale_fixers = { 'css': ['prettier'], 'javascript': ['prettier'], 'typescript' : ['prettier'], 'vue': ['prettier']}
let g:ale_linter_aliases = {'js': ['jsx',  'typescript', 'tsx', 'vue', 'javascript']}
let g:ale_linters = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'js': ['eslint'],
      \ 'typescript' : ['tsserver'],
      \'python': ['flake8']}
      "\ 'vue': ['eslint', 'vls']

let g:ale_fix_on_save = 1
nnoremap <leader>r :ALEFindReferences<CR>
nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>t :ALEGoToDefinitionInTab<CR>
nnoremap <leader>i :ALEImport<CR>

" ************************************************************

"*****************************************************************************
"" Abbreviations
"*****************************************************************************

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

noremap YY "+y<CR>
#paste and keep old
"xnoremap("<leader>p", "\"_dP")
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Tree style list
let g:netrw_liststyle = 3
let g:netrw_localrmdir='rm -r'

" ************** Key Mappings *******************************************
let mapleader="\<SPACE>"
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"Select All
noremap <leader>a ggVG

" Remove that dumb search highlight
nmap <silent> <leader>, :nohl<cr>

nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>

map <F3> :mksession! /home/tom/.vimsessions/.vimsession <cr> " Quick write session with F2
map <F4> :source /home/tom/.vimsessions/.vimsession <cr>     " And load session with F3


"escaping
inoremap jk <Esc>

nmap <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

" FZF Mappings
nnoremap <silent> <Leader>F :Files<CR>
nnoremap <silent> <Leader>f :GFiles<CR>
nnoremap <silent> <Leader><Leader> :FZFMru<CR>
nnoremap <silent> <Leader>C :Commits<CR>
nnoremap <silent> <Leader>c :Colors<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <Leader>H :History<CR>
nnoremap <Leader>s :GGrep<space>
nnoremap <Leader>S :GGrep<space><C-r><C-w><CR>

" git
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gca :Gcommit --amend<CR>
nmap <Leader>gp :Gpush origin<space>
nmap <Leader>gaa :Git add .<CR>

" Use MRU
let g:fzf_mru_relative = 1

" ***************************************
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"************Auto complete************************
"
"let g:coc_node_path = '/home/tom/.nvm/versions/node/v12.16.0/bin/node'
" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<    CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

"*************** LightLine ***********************
  let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
"*************************************************

" **************** GIT ********************

" Automatically wrap at 100 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=100
autocmd FileType gitcommit setlocal spell

" ************************************************

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

"NerdTree
"map <C-n> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

" Easy Motion "
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>L <Plug>(easymotion-overwin-line)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" ************** FZF *****************************
let g:fzf_nvim_statusline = 0

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)


set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags . -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" ***********************************************
set statusline+=%{gutentags#statusline()}
let g:gutentags_generate_on_empty_buffer = 1

autocmd BufWritePre * :call TrimWhitespace()
autocmd FileType js,ts,cpp,cxx,h,hpp,c :call GoCoc()
" configure indentation for rust
autocmd FileType rust set expandtab tabstop=4 softtabstop=4 shiftwidth=4
