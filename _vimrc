set nocompatible													" Be Improved

" install vundle first if not yet installed
 if (!isdirectory(expand("$HOME/.vim/repos/github.com/Shougo/dein.vim")))
   call system(expand("mkdir -p $HOME/.vim/repos/github.com"))
   call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.vim/repos/github.com/Shougo/dein.vim"))
 endif

" Creating directories if they don't exist
call system(expand("!mkdir -p $HOME/.vimbackup"))
call system(expand("!mkdir -p $HOME/.vimswap"))
call system(expand("!mkdir -p $HOME/.vimviews"))
call system(expand("!mkdir -p $HOME/.vimundo"))

set runtimepath+=$HOME/.vim/repos/github.com/Shougo/dein.vim/

call dein#begin("$HOME/.vim")
let pluginsExist = 0

call dein#add('Shougo/dein.vim')                 					" Let NeoBundle manage itself

" Visuals
call dein#add('frankier/neovim-colors-solarized-truecolor-only')	" Solarized Colorscheme
call dein#add('vim-airline/vim-airline')				            " Airline Custom Status Bar
call dein#add('vim-airline/vim-airline-themes')					    " Airline Themes
call dein#add('powerline/fonts')									" Powerline fonts for Airline
call dein#add('scrooloose/nerdtree')								" File explorer
call dein#add('Yggdroot/indentLine')								" Shows indentation lines
call dein#add('valloric/MatchTagAlways')					        " Highlight closing tags of markup languages
call dein#add('editorconfig/editorconfig-vim')        				" Editor presentation configurator
call dein#add('ap/vim-css-color')								   	" Visualize color via Highlighting
call dein#add('ryanoasis/vim-devicons')							    " Adds filetype icons to NERDTree and Airline
call dein#add('ujihisa/unite-colorscheme')							" Colorschemes for unite

" Editing Functionalities
call dein#add('Raimondi/delimitMate')						        " Auto pairing of delimeters
call dein#add('tomtom/tcomment_vim')							    " File sensitive comment refactor
call dein#add('Chiel92/vim-autoformat')				            	" Code formatter
call dein#add('AndrewRadev/switch.vim')	            				" Easily switch values under cursor (ex. True -> False but not limited to, can also do format switch)
call dein#add('tpope/vim-surround')								    " Easily add, change, or delete surrounds such as \" -> '
call dein#add('godlygeek/tabular')									" Text alignment
call dein#add('Shougo/neosnippet.vim')								" Snippet handler
call dein#add('Shougo/neosnippet-snippets')							" Pre-made Snippets
call dein#add('honza/vim-snippets')									" Pre-made Snippets
call dein#add('Shougo/neocomplete.vim')				       			" Code completion
call dein#add('Shougo/neoinclude.vim')			    				" Include completion framework for neocomplete/deoplete
call dein#add('ujihisa/neco-look')					       			" Completion for the English Language
call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})    				" Auto completion for .vim files

" General Functionalities
call dein#add('tpope/vim-repeat')               					" More powerful command repeat using '.'
call dein#add('mattn/emmet-vim')				                	" Tag based code generation for markup languages
call dein#add('mhinz/vim-sayonara')             					" Faster, safer, easier buffer closing
call dein#add('terryma/vim-multiple-cursors')    					" Add multiple cursors in visual mode like sublime
call dein#add('junegunn/goyo.vim')			    					" Distraction free mode
call dein#add('vim-scripts/SyntaxRange')            				" Multiple syntax in 1 file
call dein#add('majutsushi/tagbar')									" Provides a tag highlight of the file structure
call dein#add('ervandew/supertab')									" Use tab for all completions
call dein#add('Shougo/unite.vim')									" Fuzzy searching
call dein#add('Shougo/unite-outline')								" File outline view
call dein#add('junkblocker/unite-codesearch')						" Adds code searching to unite

" Versioning
call dein#add('tpope/vim-fugitive')					    			" GIT Wrapper
call dein#add('jreybert/vimagit')						       		" GIT Workflow Visualizer
call dein#add('mhinz/vim-signify')						   			" Version Control Change Visualizer
call dein#add('Xuyuanp/nerdtree-git-plugin')          				" NERDTree GIT Visualizer
	 
" call dein#add('mattn/webapi-vim')						       		" Interface to Web APIs

if dein#check_install()
  call dein#install()
endif
call dein#end()



" Editor Configurations
filetype plugin indent on 											" Detection, plugin, and indent on	
filetype on 														" Filetype detection on
set noshowmode														" Hide default status indicator
set relativenumber number 											" Shows row number as relative numbers from wheren the focus is
set syntax  														" Enables syntax hightlighting
set mouse=a                                                         " Enables mouse usage
set viewoptions=folds,options,cursor,unix,slash						" Better unix / windows compatibility
set history=1000													" Have 1000 undos available
set cursorline														" Higlight current line
set linespace=0														" No extra space between rows
set showmatch														" Highlight matching delimeters
set foldenable														" Auto fold code
set autoindent														" Indent at the same level of the previous line
set shiftwidth=4                									" Use indents of 4 spaces
set expandtab                   									" Tabs are spaces, not tabs
set tabstop=4                   									" An indentation every four columns
set softtabstop=4               									" Let backspace delete indent


set conceallevel=0 													" Shows text normally without hiding any concealed text
set virtualedit=all 												" Allows block selection to be not limited to end of lines
set wildmenu														" Command-line completion using <TAB>
set wildmode=list:longest,full										" Complete the first match then use original text for the next matches
set laststatus=2													" Always show a status line

set nowrap          												" Disables text wrapping
set scrolloff=5         								        	" Padding of 5 lines when scrolling up or down
if has('cmdline_info')
    set ruler														" Shows where you are within a file on bottom right corner
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)|		        " A ruler on steroids     
endif
set showcmd                											" show partial commands in status line and
set ignorecase          											" Ignores case when searching, noignorecase to turn off
set incsearch         												" Enable search while typing, noincsearch to turn off
set hlsearch          												" Highlight searcj hits, nohlsearch to turn off 
set backspace=2														" More powerful backspacing
let $NVIM_TUI_ENABLE_TRUE_COLOR=1									" Enable true color on NVIm
set t_Co=256														" Sets Terminal Colors to 256

colorscheme solarized 												" Set colorscheme to solarized
set background=dark													" Set to dark version of colorscheme

set nobackup          												" Disables file backup, backup to turn on
set clipboard+=unnamedplus											" Always use the clipboard for yanks and deletes
set autochdir														" Automatically change directory when opening files
set pastetoggle=<F12>|												" Set <F10> as the key to enable/disable paste mode
let mapleader=','													" Sets <Leader> to ,

set undofile														" Enables undofiles
set backup															" Enables file backups
set swapfile														" Enables swapfile in case of application crash
" Set backup directory
set backupdir=$HOME/.vimbackup

" Set swapfile directory			
set dir=$HOME/.vimswap

" Sets views directory					
set viewdir=$HOME/.vimviews											

" Sets undo directory
set undodir=$HOME/.vimundo

set nolist 															" Disables listing
set listchars=tab:>.,trail:.,extends:\#,nbsp:.|						" Highlight problematic whitespace

set comments=sl:/\*,mb:\*,elx:\*/|  								" Auto format comment blocks

" Commands
au BufWinLeave \* silent! mkview|  									"make vim save view (state, folds, cursor, etc)
au BufWinEnter \* silent! loadview|									"make vim load view (state, folds, cursor, etc)

autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
              " center buffer around cursor when opening files
autocmd BufRead * normal zz
     
" Remove trailing whitespaces and \^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\\\s\\\\+$","","")'))





" Mappings
map <C-J> <C-W>j<C-W>_|												" Easier moving down in splits and windows
map <C-K> <C-W>k<C-W>_| 											" Easier moving up in splits and windows
map <C-L> <C-W>l<C-W>_|												" Easier moving right in splits and windows
map <C-H> <C-W>h<C-W>_|												" Easier splits and windows to the far left
map <C-K> <C-W>k<C-W>_|												" Easier moving left in splits and windows
map <C-s> :w!<CR>|													" Maps CTRL+s to force save 
map <M-q><q> :close|                                                " Maps ALT+q+q to close file
map <C-\> :NERDTreeToggle<CR>|										" Opens/Closes NERDTree
map <F8> :TagbarToggle<CR>	|										" Maps F8 to open tagbar

nnoremap ; :|														" ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap <ESC> :noh<RETURN><ESC>|									" Clears the last search highlight by hitting esc
nnoremap j gj|														" Wrapped lines goes down to next row, rather than next line in file.
nnoremap k gk|														" Wrapped lines goes up to next row, rather than next line in ile.

inoremap <C-v> <F10><C-r>+<F10>|									" Makes CTRL+v toggle paste mode, paste the value in the clipboard, then toggle paste mode again

vnoremap <C-c> "+y|													" Makes CTRL+c yank to clipboard for pasting outside VIm
vnoremap < <gv|														" Visual shifting to the left (does not exit Visual mode)
vnoremap > >gv|														" Visual shifting to the right (does not exit Visual mode)

cmap W w| 															" Shift key fix when entering commands                      
cmap WQ wq| 														" Shift key fix when entering commands
cmap wQ wq| 														" Shift key fix when entering commands
cmap Q q| 															" Shift key fix when entering commands
cmap Tabe tabe| 													" Shift key fix when entering commands

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>


" Directory of EditorConfig Core
" let g:EditorConfig_exec_path='C:/ProgramData/chocolatey/lib/editorconfig.core/tools'	
" let g:EditorConfig_core_mode='python_external'						" Speficies the mode of EditorConfig, comment out if +python is present in :ver


let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

let g:NERDTreeCaseSensitiveSort = 1									" Sorts childs alphabetically
let g:NERDTreeQuitOnOpen = 1 										" Automatically closes NERDTree on open
let g:NERDTreeShowLineNumbers = 0									" Hide line numbers in NERDTree
let g:NERDTreeSortOrder = ['\/$', '*']								" Sorts directories first then everything else
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1

" Runs NERDTree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree D:/wrk/ | endif


" Closes VIm if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:delimitMate_expand_cr = 2 									" Expands on <CR> puts end match one line below active cursor line
let g:delimitMate_expand_space = 1									" Expands on <Space> puts space after and before the opening and closing delimiter puts cursor in middle
let g:delimitMate_jumpexpansion = 0									" Jumps expansions
let g:delimitMate_smart_quotes = 1									" Haven't figured it out
let g:delimitMate_balance_matchpairs = 1 							" Balance matching pairs

let g:tagbar_ctags_bin="D:/app/CTags/ctags.exe"
" Airline
let g:airline_powerline_fonts=1 									" Enables Airline to use Powerline Symbols
let g:airline_theme='solarized'										" Sets Airline theme to Solarized
set laststatus=2    												" Airline permanent visibility

hi PreProc ctermfg=magenta cterm=bold guifg=#FF00FF

hi javaAnnotation guifg=#FFFFFF
hi javaParenT guifg=#D6C248
hi javaExternal gui=bold guifg=#859900
hi javaComment guifg=#93A1A1
hi javaDocComment guifg=#93A1A1
hi javaCommentTitle guifg=#93A1A1
hi javaDocTags guifg=#657B83
hi javaDocParam guifg=#93A1A1
hi javaScopeDecl gui=bold guifg=#859900
hi javaClassDecl gui=bold guifg=#859900
hi javaType gui=bold guifg=#859900
hi javaStorageClass gui=bold guifg=#859900
hi javaNumber guifg=#657B83
hi javaString guifg=#657B83
hi javaConstant gui=bold guifg=#859900
hi javaSpecialChar guifg=#93A1A1
