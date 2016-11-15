set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" bundles
Plugin 'kien/ctrlp.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'taylor/vim-zoomwin'
Plugin 'whatyouhide/vim-gotham'
Plugin 'bling/vim-airline'
Plugin 'slim-template/vim-slim.git'
"Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'farseer90718/vim-taskwarrior'
Plugin 'morhetz/gruvbox'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rking/ag.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'StanAngeloff/php.vim'
Plugin 'Konfekt/FastFold'
Plugin 'Konfekt/FoldText'

if !&diff
  Plugin 'justincampbell/vim-eighties'
endif

" syntax
Plugin 'vim-syntastic/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-haml'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mxw/vim-jsx'
Plugin 'rust-lang/rust.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'digitaltoad/vim-jade'

" colorscheme
Plugin 'chriskempson/base16-vim'


autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.mst set ft=mustache

call vundle#end()
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" general config
set fileencoding=utf-8
set encoding=utf-8
set scrolloff=3
set showcmd
set wildmenu
set wildmode=longest,list,full
set wildignore=*.o,*.obj,*.swp,*~,#*#
set cursorline
set foldmethod=syntax
set nofoldenable
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set nowrap
set expandtab
set tabstop=2
set shiftwidth=2
set autoread
set laststatus=2
set backupdir=/tmp
set directory=/tmp
set shell=fish
"set shell=/bin/bash

syntax on
"autocmd CursorHold * checktime " hack for autoread

let mapleader=","

" terminal colors
set t_Co=256

" indentation
set autoindent

" white space blamer
set list
set listchars=tab:\ ¬,trail:.

" interface
" set background=dark
set go-=T
set go-=L
set go-=r
set go-=m
set number

" status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
map <C-m> :CtrlPMRU<CR>

" colorscheme
colorscheme hybrid
let g:hybrid_use_iTerm_colors = 1
let g:airline_theme='base16_monokai'

" gitgutter
highlight clear SignColumn
let g:gitgutter_sign_column_always = 1
highlight GitGutterAdd guifg=darkgreen
highlight GitGutterChange guifg=darkyellow
highlight GitGutterDelete guifg=darkred
highlight GitGutterChangeDelete guifg=darkyellow

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_underbar_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

inoremap <expr><s-CR> pumvisible() ? neocomplete#close_popup()"\<CR>" : "\<CR>"
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'


" for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,yaml,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et


" mappings
nnoremap <C-J> <C-w>j<C-w>_
nnoremap <C-K> <C-w>k<C-w>_
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
map <F2> :NERDTreeToggle<CR>
map <C-b> <leader>bt
map <leader>q :bd<CR>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>a :Ack<space>
nnoremap <leader>w <C-w><C-v>
nnoremap Q <nop>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>w <C-w><C-v>
map <leader><leader> :CtrlP<cr>

"set guifont=Hack:h11
set guifont=Fira\ Code\ Retina:h12
set linespace=0
let g:airline_powerline_fonts = 1

" FIX: PluginUpdate => git pull: git-sh-setup: No such file or directory in MacVim (OK in non-GUI version of Vim)
" https://github.com/gmarik/Vundle.vim/issues/510
if has("gui_macvim")
  colorscheme base16-darktooth
  set macligatures
  set shell=/usr/local/bin/fish
  "set shell=/bin/bash\ -l
endif

" Eighties Stuff
let g:eighties_enabled = 1
let g:eighties_minimum_width = 80
let g:eighties_extra_width = 20 " Increase this if you want some extra room
let g:eighties_compute = 1 " Disable this if you just want the minimum + extra

" taskwarrior
let g:task_rc_override = 'rc.defaultwidth=0'

" Emmet.vim
"let g:user_emmet_install_global = 0
"autocmd FileType html,css,erb EmmetInstall
"let g:user_emmet_mode='a'

" performance 7.4
set regexpengine=1

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" Fenak funcs
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>
