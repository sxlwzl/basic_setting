color desert
set number
set incsearch
set hlsearch
set cursorline
set ruler
set ic

set showmode
set showcmd
set showmatch
set linebreak

"set expandtab
set tabstop=2
"set softtabstop=2
set shiftwidth=2
set textwidth=10000

" disable mouse interactions "
" map <ScrollWheelUp> <nop>
" map <S-ScrollWheelUp> <nop>
" map <C-ScrollWheelUp> <nop>
" map <ScrollWheelDown> <nop>
" map <S-ScrollWheelDown> <nop>
" map <C-ScrollWheelDown> <nop>
" map <ScrollWheelLeft> <nop>
" map <S-ScrollWheelLeft> <nop>
" map <C-ScrollWheelLeft> <nop>
" map <ScrollWheelRight> <nop>
" map <S-ScrollWheelRight> <nop>
" map <C-ScrollWheelRight> <nop>
set mouse=

set guioptions-=T
set guioptions-=m
set gfn=Tlwg\ Typist\ 10
"set guifont=Monospace\ 14
set guifont=Monospace\ Bold\ 16

"copy to cmd line
" "+y copy what you need
"q:   enter the cmd line window
" "+p paste

"session
":mksession debug.session
"#gvim -S debug.session

"tabnew
"1gt :1gotab
"kien/tabview.vim
let g:tabman_width = 50
let g:tabmam_side  = 'right'
nmap tm :TMToggle<CR>


" VisIncr
" :I
" Use ctrl-V to
" Original    Select, :I
" 8            8
" 8            9
" 8            10
" 8            11
" 8            12
"
" :I -1
" Use ctrl-V to
" Original    Select, :I -1
" 8            8
" 8            7
" 8            6
" 8            5
" 8            4
"
"
" :II
" Use ctrl-V to
" Original    Select, :II
" 8             8
" 8             9
" 8            10
" 8            11
" 8            12
"
" :II -1
" Use ctrl-V to
" Original    Select, :II -1
" 8            8
" 8            7
" 8            6
" 8            5
" 8            4


autocmd! BufWritePost .vimrc source ~/.vimrc
autocmd! BufWritePost .cshrc source ~/.cshrc
" au BufRead,BufNewFile *.sv,*.svh set filetype=systemverilog
au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/bundle/verilog_systemverilog.vim/syntax/verilog_systemverilog.vim

"defalut max windows
au GUIEnter * simalt ~x

" make backspaces more powerfull
set backspace=indent,eol,start

"indenltLine
let g:indentLine_setColors = 0
let g:indentLine_loaded = 1
let g:indentLine_enabled = 0
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_fileTypeExclude = []
":IndentLinesToggle

" "powerline
" "let g:Powerline_symbols = 'fancy/compatible/unicode'
" let g:Powerline_symbols = 'fancy'
" set laststatus=2
" set t_Co=256
" "set encoding=utf-8
" "let g:Powerline_theme = 'solarized256'
" "let g:Powerline_colorscheme = 'solarized256'

" airline
set noshowmode
set t_Co=256
let g:Powerline_stl_path_style = 'full'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline_theme = 'base16_3024'
let g:airline#extensions#whitespace#enabled = 0


"enable folder zc,zC, zo,zO, zn,zN
"let g:python_folding = 1

"tcomment
"gc{regoin}

"Align
":Align ,

"bufexplorer
"\be

":DirDiff <A:Src Directory> <B:Src Directory>

nmap tt :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=50

" " ctrlp
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 0
let g:ctrlp_working_path_mode = ''
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" easy-grep
" GrepOptions
let g:EasyGrepMode = 0     " All:0, Open Buffers:1, TrackExt:2,
let g:EasyGrepCommand = 0  " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1 " Recursive searching
let g:EasyGrepIgnoreCase = 1 " not ignorecase:0
" let g:EasyGrepFilesToExclude = "*~, cscope.*, *.a, *.o, *.pyc, *.swp, *.bak"

" taglist
set tags=./tags;
set tags+=/auto////ctags/dopplerds.ctags
nmap tl :TlistToggle<CR>
let Tlist_Ctags_Cmd ='/usr/bin/ctags'
let Tlist_Use_Left_Window = 1
let Tlist_WinWidth = 50
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type ='name'
let Tlist_GainFocus_On_ToggleOpen = 1

"cscope
nmap cs :cs add /auto////cscope/cscope.out <CR>

filetype on
filetype plugin on
filetype plugin indent on

"pyflakes disable(0)/enable(1)::
"let g:pyflakes_use_quickfix = 1

"limit each line length
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"""""vundle setting start
set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"Bundle 'Valloric/YouCompleteMe'
Bundle 'Yggdroot/indentLine'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'flazz/vim-colorschemes'
Bundle 'kien/tabman.vim'
" Bundle 'Shougo/vimshell.vim'
" Bundle 'Shougo/vimproc.vim'
" Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'dkprice/vim-easygrep'
Bundle 'verilog_systemverilog.vim'

Bundle 'a.vim'
Bundle 'fontsize'
Bundle 'bufexplorer.zip'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'The-NERD-tree'
" Bundle 'DirDiff.vim'
Bundle 'tComment'
"Bundle 'AutoComplPop'
"Bundle 'neocomplcache'
"It allows you to use for all your insert completion needs
Bundle 'ervandew/supertab'

" Easier to make a column of increasing or decreasing numbers, dates, or daynames.
Bundle 'vim-scripts/VisIncr'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/taglist.vim'
Bundle 'chazy/cscope_maps'

" Bundle 'python.vim'
" Bundle 'pythoncomplete'
" Bundle 'pyflakes.vim'
" Bundle 'python_fold'

" Bundle 'bash-support.vim'

filetype plugin indent on
"call vundle#end()
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"""""vundle setting end

