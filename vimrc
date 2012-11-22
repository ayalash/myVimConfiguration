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
set nu

filetype on
filetype plugin on
filetype indent on

" autocmd VimEnter * nested TagbarOpen
let g:pyflakes_use_quickfix=0
let g:tagbar_left = 1

" Put VIM swap files in one place
set directory=/tmp/vimswap

" Convince Vim it can use 256 colors inside Gnome Terminal.
" Needs CSApprox plugin
set t_Co=256

let mapleader = ","
nmap <silent><Leader>/ :nohlsearch<CR>
nmap <silent><Leader>ve :e ~/.vimrc<CR>
nmap <silent><Leader>vs :so ~/.vimrc<CR>

set showmatch
syntax on
set hlsearch
set nowrap
set wrapmargin=0
set textwidth=0
set noswapfile

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
	set cscopequickfix=s-,c-,d-,i-,t-,e-

    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
endif

" Ctags configuration
set tags=./tags;/
set tags+=/~/source/qa/tlib/tags
set tags+=/~/source/qa/tests/tags
set tags+=/usr/local/lib/python2.6/tags

" Comment out blocks of code
function! CommentBlock(comment)
  if getline(".") =~ '^'.a:comment.'\~'
    call setline(".", substitute(getline("."), "^".a:comment.'\~ ', "", ""))
  else
    call setline(".", substitute(getline("."), "^", a:comment."~ ", ""))
  endif
endfunction
" omnicomplete with tab
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<CR>

autocmd FileType python map <Leader># :call CommentBlock('#')<CR> 
autocmd FileType vim map <Leader>" :call CommentBlock('"')<CR>

" Shortcuts
noremap <Leader>gg :silent Ggrep <cword><CR>:copen<CR>
noremap <Leader>ga :copen<CR>:grep! -nR 
noremap <Leader>gG :copen<CR>:Ggrep 
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>vl :e ~/.vim/vimrc<CR>
noremap <Leader>vs :w<CR>:so %<CR>
noremap <Leader>b :CommandTBuffer<CR>
noremap <C-Tab> <C-W><C-W>
noremap <S-C-Tab> <C-W>W
noremap <S-C-F4> :bufdo BD<CR>
noremap <C-F4> :BD<CR>
noremap <Leader>/ :nohl<CR>
noremap <silent> <F4> :copen<CR>:cnext<CR>
noremap <silent> <S-F4> :copen<CR>:cprev<CR>
inoremap <C-Space> <C-N>

" Autocompletion
inoremap <C-Space> <C-N>

" Status bar
set laststatus=2 " Enables the status line at the bottom of Vim
set statusline=\ %F\ %m\ %{fugitive#statusline()}\ %=%l,%c\ 

" autocmd VimLeavePre * mksession! ~/.vim.sess

set wildchar=<Tab> wildmenu wildmode=longest:full

command! LargeFont set guifont=Monospace\ 16
command! SmallFont set guifont=Monospace\ 10
