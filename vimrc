set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" bundles
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'taylor/vim-zoomwin'
Plugin 'whatyouhide/vim-gotham'
Plugin 'bling/vim-airline'
Plugin 'slim-template/vim-slim.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'justincampbell/vim-eighties'
Plugin 'farseer90718/vim-taskwarrior'
Plugin 'morhetz/gruvbox'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rking/ag.vim'

" syntax
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-haml'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mxw/vim-jsx'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" general config
set fileencoding=utf-8
set encoding=utf-8
set scrolloff=3
set showcmd
set wildmenu
set wildmode=longest:list,full
set wildignore=*.o,*.obj,*.swp,*~,#*#
set cursorline
set linespace=1
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set nowrap
set expandtab
set tabstop=2
set shiftwidth=2
set paste
set autoread
set laststatus=2
set backupdir=/tmp
set directory=/tmp
set shell=zsh
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
set background=dark
set go-=T
set go-=L
set go-=r
set go-=m
set number

" status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" bufferline
" let g:bufferline_rotate = 1

"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" colorscheme
colorscheme gruvbox
let g:hybrid_use_iTerm_colors = 1
let g:airline_theme='wombat'

" gitgutter
highlight clear SignColumn
let g:gitgutter_sign_column_always = 1
highlight GitGutterAdd guifg=darkgreen
highlight GitGutterChange guifg=darkyellow
highlight GitGutterDelete guifg=darkred
highlight GitGutterChangeDelete guifg=darkyellow

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

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

"set guifont=Menlo:h12
set guifont=Meslo_LG_S_for_Powerline:h12
let g:airline_powerline_fonts = 1

" FIX: PluginUpdate => git pull: git-sh-setup: No such file or directory in MacVim (OK in non-GUI version of Vim)
" https://github.com/gmarik/Vundle.vim/issues/510
if has("gui_macvim")
  set shell=/bin/bash\ -l
  set fullscreen
endif

" EasyMotion Stuff
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

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
