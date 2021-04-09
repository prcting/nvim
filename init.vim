"  __  ____   __ __     _____ __  __ ____   ____
" |  \/  \ \ / / \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /   \ \ / / | || |\/| | |_) | |
" | |  | | | |     \ V /  | || |  | |  _ <| |___
" |_|  |_| |_|      \_/  |___|_|  |_|_| \_\\____|
"
"
" Github: Prcting
" Maintainer: Scott


" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


"===
"=== Base
"===
if &compatible
	" Don't compatible vi
	set nocompatible
endif

if has('syntax')
	syntax enable
	syntax on
endif

if has('autocmd')
	filetype plugin indent on
endif

" in normal can use mouse
set mouse=n

" color compatibility
let &t_ut=''

" auto change work dir
set autochdir

" copy in system
set clipboard=unnamedplus

" set Backspace mode
set bs=eol,start,indent

" display line number
set number

" display relative line number
set relativenumber

" the current line displays line
set cursorline

" auto indent
set autoindent

" timeout
set ttimeoutlen=0
set notimeout

" searching
set ignorecase

" smart search
set smartcase

" expert search
set incsearch

" search result highlight
set hlsearch

" matching parentheses
set showmatch

" should make scrolling faster
set ttyfast

" delay to draw（improve performance）
set lazyredraw

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" display status
set laststatus=2

" display sidebar
set signcolumn=yes

" display tab bar
set showtabline=2

" display command line
set showcmd

" display or enable mode
set noshowmode

" complete command
set wildmenu

" row 5 content
set scrolloff=5

" the new windows open in right
set splitright

" the new windows open in below
set splitbelow

" display visual bell
set visualbell

" view options
set viewoptions=cursor,folds,slash,unix

" space display
set tw=0
set indentexpr=

" enable code
set foldmethod=indent
set foldlevel=99
set foldenable

" text formatting
set formatoptions-=tc

" ex in preview (neovim)
set inccommand=split

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" file auto read in
set autoread
" file auto write to
set autowrite

" smart auto complete me
set completeopt=longest,noinsert,menuone,noselect,preview

" file coding
if has('multi_byte')
	" in vim
	set encoding=utf-8
	" file
	set fileencoding=utf-8
	" auto
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

" cursor change line
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Go back to the last edit
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Key Mapping
" ===
" set <LEADER> as <SPACE>
let mapleader="\<Space>"

" set ; as :
noremap ; :

" disable the default s key
noremap s <nop>

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" open the vimrc file anytime
noremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>

" undo operations
noremap l u

" insert Key
noremap k i
noremap K I

" make Y to copy till the end of the line
nnoremap Y y$

" copy to system clipboard
vnoremap Y "+y

" indentation
nnoremap < <<
nnoremap > >>

" search
nnoremap = n
nnoremap - N
noremap <LEADER><CR> :nohlsearch<CR>

" folding
noremap <silent> <LEADER>o za


" ===
" === Cursor Movement
" ===
" new cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
noremap <silent> gu gk
noremap <silent> ge gj

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" N key: go to the start of the line
noremap <silent> N 0
" I key: go to the end of the line
noremap <silent> I $

" faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>


" ===
" === Insert mode cursor movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command mode cursor movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>


" ===
" === Window management
" ===
" use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" place the two screens up and down
noremap sh <C-w>t<C-w>K
" place the two screens side by side
noremap sv <C-w>t<C-w>H

" rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" create a new tab with tu
noremap tu :tabe<CR>
" move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>


" ===
" === Other useful stuff
" ===
" open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" move the next character to the end of the line with ctrl+9
inoremap <C-u> <ESC>lx$p

" opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" press ` to change case (instead of ~)
noremap ` ~

" redraw the screen
noremap <C-c> zz

" auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" call figlet
noremap tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>

" set wrap
noremap <LEADER>sw :set wrap<CR>


" compile function
noremap <F5> :call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		CocCommand flutter.dev.openDevLog
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('$HOME/.cache/vim/plugins/')
	" Better Comments
	Plug 'tpope/vim-commentary'

	" Status line
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ojroques/vim-scrollstatus'

	" Undo Tree
	Plug 'mbbill/undotree'
	
	" Rainbow
	Plug 'luochen1990/rainbow'

	" Themes
	Plug 'crusoexia/vim-monokai'

	" vim-snippets
	Plug 'honza/vim-snippets'

	" Autoformat
	Plug 'google/vim-maktaba'
	Plug 'google/vim-codefmt'
	Plug 'google/vim-glaive'

	" Taglist
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
	Plug 'liuchengxu/vista.vim'

	" General Highlighter
	Plug 'RRethy/vim-illuminate'

	" start screen
	Plug 'mhinz/vim-startify'

	" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
	Plug 'elzr/vim-json'
	Plug 'neoclide/jsonc.vim'
	Plug 'othree/html5.vim'
	Plug 'alvan/vim-closetag'
	" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
	" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	"Plug 'jaxbot/browserlink.vim'
	Plug 'HerringtonDarkholme/yats.vim'
	" Plug 'posva/vim-vue'
	" Plug 'evanleck/vim-svelte', {'branch': 'main'}
	" Plug 'leafOfTree/vim-svelte-plugin'
	" Plug 'leafgarland/typescript-vim'

	" Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" ===================== Start of Plugin Settings =====================

" ===
" === Themes
" ===
colorscheme monokai

" in iTerm2
set t_Co=256
set termguicolors


" ===
" === Rainbow
" ===
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


" ===
" === Eleline
" ===
let g:airline_powerline_fonts = 0


" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ===
" === Google Autoformat
" ===
augroup autoformat_settings
	" autocmd FileType bzl AutoFormatBuffer buildifier
	" autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	" autocmd FileType dart AutoFormatBuffer dartfmt
	" autocmd FileType go AutoFormatBuffer gofmt
	" autocmd FileType gn AutoFormatBuffer gn
	" autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	" autocmd FileType java AutoFormatBuffer google-java-format
	" autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	" autocmd FileType rust AutoFormatBuffer rustfmt
	" autocmd FileType vue AutoFormatBuffer prettier
augroup END


" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" function! NearestMethodOrFunction() abort
" 	return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:scrollstatus_size = 15


" ===
" === UndoTree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc


" ===
" === Commentary
" ===
function! Comment()
  if (mode() == "n" )
    execute "Commentary"
  else    
    execute "'<,'>Commentary"
  endif
 endfunction
vnoremap <silent> <space>/ :call Comment()


" ===
" === CoC
" ===
" coc插件安装目录
let g:coc_data_home = '$HOME/.cache/vim/coc/'
" coc-settings.json所在目录
let g:coc_config_home = '$HOME/.config/nvim/config/'

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-actions',
  \ 'coc-sh',
  \ 'coc-java-debug',
  \ 'coc-java',
  \ 'coc-lists',
  \ 'coc-tasks',
  \ 'coc-clangd',
  \ 'coc-python',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-floaterm',
  \ 'coc-html',
  \ 'coc-html-css-support',
  \ 'coc-css',
  \ 'coc-stylelintplus',
  \ 'coc-emoji',
  \ 'coc-pyright',
  \ 'coc-explorer',
  \ 'coc-svg',
  \ 'coc-vimlsp',
  \ 'coc-xml',
  \ 'coc-yank',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-highlight',
  \ 'coc-marketplace',
  \ ]

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
