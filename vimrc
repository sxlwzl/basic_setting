set number
set hlsearch 
set ic
set ruler
set cursorline
set showmode
set showcmd
set showmatch

set expandtab 
set tabstop=4
set softtabstop=4
set shiftwidth=4
" make backspaces more powerfull
set backspace=indent,eol,start

" copy to cmd line
" "+y copy what your need
" q: enter the cmd line window
" "+p paste
"

" tabnew
" 1gt: 1gotab
"kien/tabview.vim
let g:tabman_width = 60
" let g:tabmam_side  = 'right' 
nmap tm :TMToggle<CR>

set guioptions-=T
set guioptions-=m
set gfn=Tlwg\ Typist\ 10
set guifont=Monospace\ Bold\ 16


autocmd! BufWritePost .vimrc source ~/.vimrc

"enable folder zc,zC, zo,zO, zn,zN
"let g:python_folding = 0

"youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1

"tcomment
"gc{regoin}


"Align
":Align ,

"bufexplorer
"\be

":DirDiff <A:Src Directory> <B:Src Directory> 
"
"indentline
let g:indentLine_enabled = 1
let g:indentLine_loaded = 1
let g:indentLine_char='┆'
let g:indentLine_setcolors = 0

"powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2
set t_Co=256
let g:Powerline_stl_path_style = 'full'
 

"nerdtree
"u: open the parent dir
nmap tt :NERDTreeToggle<CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=40
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeMinimalUI=1
let g:NERDTreeStatusline=0


"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3


filetype on
filetype plugin on
filetype plugin indent on  

"pyflakes disable(0)/enable(1)::
let g:pyflakes_use_quickfix = 1

"simple fold
" help fold-commands
" za toggle fold the current one
" zA toggle fold recurisvely
" zi Invert 'foldenable'.
let g:SimpylFold_docstring_preview = 1


"limit each line length
" highlight OverLength ctermbg=pink ctermfg=white guibg=#592929 
highlight OverLength ctermbg=black ctermfg=white guibg=#592929 
match OverLength /\%100v.\+/


"git control from github
"git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim

set nocompatible " be iMproved
filetype off " required! /** 从这行开始，vimrc配置 **/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required!
Bundle 'VundleVim/Vundle.vim'

"""""" My Bundles here: /* 插件配置格式 */
""""""original repos on github （Github网站上非vim-scripts仓库的插件，按下面格式填写）
" Bundle 'Valloric/YouCompleteMe'
Bundle 'Yggdroot/indentLine'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/neocomplcache.vim'
" Bundle 'python-mode/python-mode'
Bundle 'kien/tabman.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/vimproc.vim'


""""""vim-scripts repos （vim-scripts仓库里的，按下面格式填写, use - to for S）
Bundle 'a.vim'
Bundle 'Align'
Bundle 'fontsize'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'tComment'
" for pyhton 
Bundle 'pyflakes.vim'
Bundle 'tmhedberg/SimpylFold'

""""""non github repos （非上面两种情况的，按下面格式填写）
"""""Bundle 'git://git.wincent.com/command-t.git'

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to

call vundle#end()
filetype plugin indent on " required! /** vimrc文件配置结束 **/
