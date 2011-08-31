" Autoload package bundles
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
colorscheme vividchalk

let mapleader = ","
set hidden
set guioptions-=T
set tabstop=4
set shiftwidth=4
set expandtab

filetype on
filetype plugin on
filetype indent on
let g:pyflakes_use_quickfix=0

" Put VIM swap files in one place
set directory=~/.vim/swap

let mapleader = ","
nmap <silent> ,/ :nohlsearch<CR>
nmap <silent> ,ve :e ~/.vimrc<CR>
nmap <silent> ,vs :so ~/.vimrc<CR>

set showmatch
syntax on
set hlsearch
set nowrap
set wrapmargin=0
set textwidth=0

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" cscope
if has("cscope")
    set csto=0
    set cscopetag   " search cscope for tags
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
endif

" Ctags configuration
set tags=./tags;/
set tags+=/~/source/qa/tlib/tags
set tags+=/~/source/qa/tests/tags
set tags+=/usr/local/lib/python2.6/tags

" Shortcuts
noremap <Leader>gg :silent Ggrep <cword><CR>:copen<CR>
noremap <Leader>gG :copen<CR>:Ggrep 
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>vl :e ~/.vim/.vimrc<CR>
noremap <Leader>vs :w<CR>:so %<CR>
noremap <Leader>b :CommandTBuffer<CR>
noremap <C-Tab> <C-W><C-W>
noremap <S-C-Tab> <C-W>W
noremap <S-C-F4> :bufdo bd<CR>
noremap <C-F4> :bd<CR>
noremap <Leader>/ :nohl<CR>

" Autocompletion
inoremap <C-Space> <C-N>

" Status bar
set laststatus=2 " Enables the status line at the bottom of Vim
set statusline=\ %F\ %m\ %{fugitive#statusline()}\ %=%l,%c\ 
