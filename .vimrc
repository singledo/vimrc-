set nocompatible              " be iMproved, required
filetype off                  " required
set nu 
set tabstop=4
set cul
set guioptions-=r 
set guioptions-=L
set guioptions-=b
set showtabline=0
set guifont=Monaco:h13         
set background=dark     "设置背景色"
set nowrap  "设置不折行"
set fileformat=unix "设置以unix的格式保存文件"
set cindent     "设置C样式的缩进格式"
set tabstop=4   "设置table长度"
set shiftwidth=4        "同上"
set showmatch   "显示匹配的括号"
set scrolloff=5     "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set fenc=utf-8      "文件编码"
set backspace=2
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase      "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set noexpandtab     "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread

let g:solarized_termcolors=256  "solarized主题设置在终端下的设置"
let g:molokai_original = 1
let g:rehash256 = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

syntax on 
set hlsearch

function RunPython()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    " copen
    let &makeprg = mp
    let &errorformat = ef
endfunction

" cscope setting 
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
 " set cscopequickfix=c-,d-,e-,g-,i-,s-,t- "在quickfix窗口查看
endif

" move 
map <c-l> <c-w>l
map <c-k> <c-w>k
map <c-j> <c-w>j
map <c-h> <c-w>h
" heighlight

colorscheme 1989

" file explore 
map <C-n> :NERDTreeToggle<CR>
" taglist 
nmap <C-f> :TagbarToggle<CR>

map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>

" vimgrep - find the word in the current direction and sub direction
" map <C-e> :execute "vimgrep /" .expand('<cword>') ."/gj " ."*.c" ."*.h" ."**" <CR><CR> 

set foldmethod=indent
set foldlevel=99

let g:ctrlp_max_height = 15
let g:pydiction_location='~/.vim/tools/pydiction/complete-dict' 
let g:pymode_python = 'python3'
autocmd VimEnter *.py python3 sys.path.append('.')
autocmd BufWritePost *.py call Flake8()
"using flake8 as a python syntax checker
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:autopep8_aggressive=2
let g:jedi#force_py_version=3
let g:jedi#smart_auto_mappings = 0
" Ack setting 
let mapleader=","

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackhighlight = 1
let g:ack_qhandler = "botright copen 15"
let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search = 1
let g:ack_use_dispatch=0

nmap <leader>r : execute "Ack " .expand('<cword>') ." -i " ."./ --cc --cpp --asm --lua" <CR><CR>
nmap <leader>o :copen <CR>
nmap <leader>c :cclose <CR>
nnoremap <leader>n : cnext <CR>
nnoremap <leader>l : cprev <CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
" add to .vimrc
Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

Plugin 'Lokaltog/vim-powerline'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'

Plugin 'davidhalter/jedi-vim'

Plugin 'mileszs/ack.vim'
Plugin 'BurntSushi/ripgrep.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

" filetype plugin on


" autocmd FileType python set omnifunc=pythoncomplete#Complete


"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
