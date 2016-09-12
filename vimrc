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
" call dein#add('frankier/neovim-colors-solarized-truecolor-only')	" Solarized Colorscheme for True Color GUI
call dein#add('powerline/fonts')									" Powerline fonts for Airline
call dein#add('altercation/vim-colors-solarized')                   " Solarized Colorscheme for Terminals
call dein#add('ryanoasis/vim-devicons')							    " Adds filetype icons to NERDTree and Airline
call dein#add('vim-airline/vim-airline')				            " Airline Custom Status Bar
call dein#add('vim-airline/vim-airline-themes')					    " Airline Themes
call dein#add('scrooloose/nerdtree')								" File explorer
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')            " Add colors to NERDTree
call dein#add('Yggdroot/indentLine')								" Shows indentation lines
call dein#add('editorconfig/editorconfig-vim')        				" Editor presentation configurator
call dein#add('ap/vim-css-color')								   	" Visualize color via Highlighting
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
call dein#add('valloric/MatchTagAlways')					        " Highlight closing tags of markup languages

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
syntax enable													    " Enables syntax hightlighting
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
if has('gui_running')
    set lines = 60 columns=108
    if has('gui_win32')
        set guifont=Inconsolata\ NF\ g:h12:cDEFAULT
    else
        set guifont=Inconsolata\ NF \g \12
    endif
endif

colorscheme solarized 												" Set colorscheme to solarized
set background=dark													" Set to dark version of colorscheme
set encoding=utf-8
set fileencoding=utf-8

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

inoremap <C-v> <F12><C-r>+<F12>|									" Makes CTRL+v toggle paste mode, paste the value in the clipboard, then toggle paste mode again

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
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


" Directory of EditorConfig Core
" let g:EditorConfig_exec_path='C:/ProgramData/chocolatey/lib/editorconfig.core/tools'
" let g:EditorConfig_core_mode='python_external'						" Speficies the mode of EditorConfig, comment out if +python is present in :ver

" Airline
let g:airline_powerline_fonts=1 									" Enables Airline to use Powerline Symbols
let g:airline_theme='solarized'										" Sets Airline theme to Solarized
set laststatus=2    												" Airline permanent visibility
let g:airline#extensions#tabline#enabled = 1                        " Enables enhanced tabline
let g:airline#extensions#tabline#show_tab_nr = 1                    " Shows tab number on tabs
let g:airline#extensions#tabline#buffer_idx_mode = 1                " Exposes taline mappings to allow direct tab switching


" Shortform Mode Notation
let g:airline_mode_map = {
    \   '__' : '-',
    \    'n'  : 'N',
    \    'i'  : 'I',
    \    'R'  : 'R',
    \    'c'  : 'C',
    \    'v'  : 'V',
    \    'V'  : 'V',
    \    '<F10><F10>' : 'V',
    \    's'  : 'S',
    \    'S'  : 'S',
    \ }

" let g:airline_left_sep = "\uE0B8"
" let g:airline_left_alt_sep = 
" let g:airline_right_sep = "\uE0BA"
" let g:airline_right_alt_sep =

" NERDTree
" Disables annoying highlight on executable files
exec 'highlight link NERDTreeExecFile ModeMsg'
let g:NERDTreeCaseSensitiveSort = 1									" Sorts childs alphabetically with the case sensitivity
let g:NERDTreeChDirMode = 2                                         " Auto changes the directory when a new root is set
" TODO: Need to make a function out of this for mode changing idea
" TODO: Map NERDTree-f to a key which toggles ignore mode
" Makes NERDTree ignore directories/files
let g:NERDTreeIgnore = [
    \ '.svn[[dir]]',
    \ '.git[[dir]]',
    \ '.settings[[dir]]',
    \ '.metadata[[dir]]',
    \ '.recommenders[[dir]]',
    \ '.gradle[[dir]]',
    \ '.idea[[dir]]',
    \ 'gradle[[dir]]',
    \ 'bin[[dir]]',
    \ 'gen[[dir]]',
    \ 'build[[dir]]',
    \ '.classpath[[file]]',
    \ '.project[[file]]',
    \ '.iml[[file]]',
    \ 'gradlew[[file]]',
    \ 'gradlew.bat[[file]]',
    \ 'lint.xml[[file]]'
    \ ]
let g:NERDTreeShowHidden = 1                                        " Show hidden files/folders
let g:NERDTreeQuitOnOpen = 1 										" Automatically closes NERDTree on open
let g:NERDTreeShowLineNumbers = 0									" Hide line numbers in NERDTree
let g:NERDTreeSortOrder = [
    \ '\/$',
    \ '\.java$',
    \ '\.xml$', 
    \ '\.json$',
    \ '\.gradle$',
    \ '\.properties$',
    \ '*',
    \ '\.txt$',
    \ '\.log$',
    \ '\.zip$',
    \ '\.7z$',
    \ '\.rar$',
    \ '\.apk$',
    \ '\.swp$',
    \ '\.bak$',
    \ '\~$'
    \ ]
let g:NERDTreeWinSize=45                                            " Sets the size of NERDTree to 45 characters long
let g:NERDTreeAutoDeleteBuffer=1                                    " Auto deletes buffer on file changes

" Runs NERDTree on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Closes VIm if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" function! NERDTreeHighlightFile(extension,fg,bg,guifg,guibg)
" exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
" exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" call NERDTreeHighlightFile('jpg', 'Gray', 'none', '#657B83', '#002B36')
" call NERDTreeHighlightFile('jpeg', 'Gray', 'none', '#657B83', '#002B36')
" call NERDTreeHighlightFile('png', 'Gray', 'none', '#657B83', '#002B36')
" call NERDTreeHighlightFile('gif', 'Gray', 'none', '#657B83', '#002B36')

" DevIcons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1                     " Enables directory icons
let g:DevIconsEnableFoldersOpenClose = 1                            " Enables opening/closing of directory icons
let g:DevIconsEnableFolderExtensionPatternMatching = 0              " Enable pattern matching on directories
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1                        " Single width glyphs
let g:webdevicons_conceal_nerdtree_brackets = 1                     " Hide NERDTree brackets around flags
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1                   " Force align icons

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jar'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['aar'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['apk'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['7z'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rar'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zip'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jks'] = '' 
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['keystore'] = '' 
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pro'] = '' 
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['otf'] = ''   
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ttf'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['wav'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['mp3'] = ''     
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['log'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['xml'] = '' 

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['AndroidManifest.xml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['gradle.properties'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['build.gradle'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['local.properties'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['settings.gradle'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['project.properties'] = ''   
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = ''   

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\/$'] = ''   

" change the default dictionary mappings for file extension matches
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = 'ƛ'
"
" change the default dictionary mappings for exact file node matches
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['MyReallyCoolFile.okay'] = 'ƛ'
"
" add or override individual additional filetypes
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['myext'] = 'ƛ'
"
" add or override pattern matches for filetypes
" these take precedence over the file extensions
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*jquery.*\.js$'] = 'ƛ'

"NERDTree Syntax Highlight
let s:base03='002B36'
let s:base02='073642'
let s:base01='586E75'
let s:base00='657B83'
let s:base0='839496'
let s:base1='93A1A1'
let s:base2='EEE8D5'
let s:base3='FDF6E3'
let s:yellow='B58900'
let s:orange='CB4B16'
let s:red='DC322F'
let s:magenta='D33682'
let s:violet='6C71C4'
let s:blue='268BD2'
let s:cyan='2AA198'
let s:green='859900'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['jar'] = s:yellow
let g:NERDTreeExtensionHighlightColor['aar'] = s:yellow
let g:NERDTreeExtensionHighlightColor['zip'] = s:orange
let g:NERDTreeExtensionHighlightColor['7z'] = s:orange
let g:NERDTreeExtensionHighlightColor['rar'] = s:orange  
let g:NERDTreeExtensionHighlightColor['jks'] = s:base00
let g:NERDTreeExtensionHighlightColor['keystore'] = s:base00
let g:NERDTreeExtensionHighlightColor['pro'] = s:base00
let g:NERDTreeExtensionHighlightColor['otf'] = s:base00
let g:NERDTreeExtensionHighlightColor['ttf'] = s:base00
let g:NERDTreeExtensionHighlightColor['wav'] = s:base00
let g:NERDTreeExtensionHighlightColor['mp3'] = s:base00
let g:NERDTreeExtensionHighlightColor['png'] = s:base00
let g:NERDTreeExtensionHighlightColor['log'] = s:base01
let g:NERDTreeExtensionHighlightColor['java'] = s:base3
let g:NERDTreeExtensionHighlightColor['xml'] = s:blue
let g:NERDTreeExtensionHighlightColor['json'] = s:cyan
let g:NERDTreeExtensionHighlightColor['gradle'] = s:violet
let g:NERDTreeExtensionHighlightColor['properties'] = s:violet

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['AndroidManifest.xml'] = s:green 

" let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue
" 
" let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
" 
" let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color files ending with _spec.rb

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

let g:delimitMate_expand_cr = 2 									" Expands on <CR> puts end match one line below active cursor line
let g:delimitMate_expand_space = 1									" Expands on <Space> puts space after and before the opening and closing delimiter puts cursor in middle
let g:delimitMate_jumpexpansion = 0									" Jumps expansions
let g:delimitMate_smart_quotes = 1									" Haven't figured it out
let g:delimitMate_balance_matchpairs = 1 							" Balance matching pairs

" let g:tagbar_ctags_bin="D:/app/CTags/ctags.exe"

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
