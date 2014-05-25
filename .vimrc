" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
" }

" Environment {
	" Basics {
		set nocompatible			" must be first line
		set clipboard=unnamedplus	" Sets the clipboard to + for linux
		set t_Co=256				" Tell vim to use 256 colors
	" }
	" Setup Bundle Support {
		" The next 3 lines ensure that the ~/.vim/bundle system works
		filetype off
		set rtp+=~/.vim/bundle/vundle
		call vundle#rc()
	" }
	" Setup Plugins { 
		" Dependencies {
			" Vundle, the plugin manager
			Bundle 'gmarik/vundle'
			" useful library, including cached file contents, tiny-cmd, and funcref
			Bundle 'MarcWeber/vim-addon-mw-utils'
			" 'Some utility functions for VIM' (?)
			Bundle 'tomtom/tlib_vim'
			" Plugin for the perl module / CLI script 'ack'
			if executable('ack-grep')
				let g:ackprg="ack-grep -H --nocolor --nogroup --column"
				Bundle 'mileszs/ack.vim'
			elseif executable('ack')
				Bundle 'mileszs/ack.vim'
			endif
		" }
		" General {
			" Tree explorer
			Bundle 'scrooloose/nerdtree'
			" Solarized colorscheme
			Bundle 'altercation/vim-colors-solarized'
			" 4 colors
			Bundle 'spf13/vim-colors'
			" Makes surrounding things easy
			Bundle 'tpope/vim-surround'
			" Automatically closes matching braces
			Bundle 'AutoClose'
			" fuzzy file finder
			Bundle 'kien/ctrlp.vim'
			" Session Manager
			Bundle 'vim-scripts/sessionman.vim'
			" Extends % to matching HTML, LaTeX, etc
			Bundle 'matchit.zip'
			" Vim Status bar
			Bundle 'Lokaltog/vim-powerline'
			" Maps ,,(movement) for quicker navigation
			Bundle 'Lokaltog/vim-easymotion'
			" Messing with colors
			" makes gvim-only colorschemes work transparently in vim
			" Bundle 'godlygeek/csapprox' 
			" Combines NERDTree with tabs
			Bundle 'jistr/vim-nerdtree-tabs'
			" Adds a ton of color schemes
			Bundle 'flazz/vim-colorschemes' 
			" Lets you quickly and easily switch between buffers
			Bundle 'corntrace/bufexplorer'
			" Graphs undo history
			Bundle 'mbbill/undotree'
			" Does relative numbers in normal mode and absolute in insert mode
			Bundle 'myusuf3/numbers.vim' 
			" Visually displays indent levels
			Bundle 'nathanaelkane/vim-indent-guides'
			" Salt sls syntax highlighting
			Bundle 'saltstack/salt-vim'
		" }
		" General Programming {
			" Pick one of the checksyntax, jslint, or syntastic
			" syntax checking hacks (requires pylint or pyflakes for python, similar tools for other languages)
			Bundle 'scrooloose/syntastic'
			" Git wrapper
			Bundle 'tpope/vim-fugitive'
			" Interface to web APIs
			Bundle 'mattn/webapi-vim'
			" Lets you create gists with :Gist (Requires webapi)
			Bundle 'mattn/gist-vim'
			" Lets you comment/uncomment blocks of code
			" Bundle 'scrooloose/nerdcommenter'
			" Text alignment
			" :Tab/=
			Bundle 'godlygeek/tabular'
			" Super useful fuzzy code completion plugin
			Bundle 'Valloric/YouCompleteMe'
			if executable('ctags')
				Bundle 'majutsushi/tagbar'
			endif
		" }
		" Snippets & AutoComplete {
			" Has problems when pushing tab
			" Lets you insert common code snippets
			Bundle 'garbas/vim-snipmate'
			" Has problems with tabs
			Bundle 'honza/vim-snippets'
			" Source support_function.vim to support snipmate-snippets.
			if filereadable(expand("~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim"))
				source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim
			endif
			" adds snippet support (fails at startup)
			Bundle 'Shougo/neosnippet'
		" }
		" PHP {
			" ???
			" Bundle 'spf13/PIV'
		" }
			" Python {
			" Pick either python-mode or pyflakes & pydoc
			" Strong python plugin
			" Bundle 'klen/python-mode'
			" adds python functionality
			Bundle 'python.vim'
			" Extends the %
			Bundle 'python_match.vim'
			" Enables omnicompletion with python
			Bundle 'pythoncomplete'
		" }
		" Javascript {
			" ???
			" Bundle 'leshill/vim-json'
			" ???
			" Bundle 'groenewege/vim-less'
			" ???
			" Bundle 'pangloss/vim-javascript'
			" ???
			" Bundle 'briancollins/vim-jst'
		" }
			" Java {
			" ???
			" Bundle 'derekwyatt/vim-scala'
			" ???
			" Bundle 'derekwyatt/vim-sbt'
		" }
		" HTML {
			" ???
			" Bundle 'amirh/HTML-AutoCloseTag'
			" ???
			" Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
		" }
		" Ruby {
			" ???
			" Bundle 'tpope/vim-rails'
			" ???
			" let g:rubycomplete_buffer_loading = 1
		" }
		" Misc {
			" ???
			" Bundle 'tpope/vim-markdown'
			" ???
			" Bundle 'spf13/vim-preview'
			" ???
			" Bundle 'tpope/vim-cucumber'
			" ???
			" Bundle 'quentindecock/vim-cucumber-align-pipes'
			" ???
			" Bundle 'Puppet-Syntax-Highlighting'
		" }
		" Twig {
			" ???
			" Bundle 'beyondwords/vim-twig'
		" }

		" Plugin Configuration {
			" { Powerline
				" let g:Powerline_symbols = 'fancy' " Making the powerline fancy.. doesn't appear to be working
			" }
			" CtrlP {
				" For CtrlP
				let g:ctrlp_map = '<c-p>'
				let g:ctrlp_cmd = 'CtrlP'
				let g:ctrlp_custom_ignore = {
					\ 'dir':  '\.git$\|\.hg$\|\.svn$',
					\ 'file': '\.exe$\|\.so$\|\.dll$' }
				" Map undotree toggle to F5
				nnoremap<F5> :UndotreeToggle<cr>
			" }
			" Config for gists {
				let g:gist_post_private = 1
				let g:gist_detect_filetype = 1
				let g:gist_open_browser_after_post = 1
			" }
			" AutoCloseTag {
				" Let's close xml tags too
				au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim

				au BufNewFile,BufRead *.gradle setf groovy
				nmap <Leader>ac <Plug>ToggleAutoCloseMappings
			" }
			" NerdTree {
				map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
				map <leader>e :NERDTreeFind<CR>
				nmap <leader>nt :NERDTreeFind<CR>

				let NERDTreeShowBookmarks=1
				let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
				let NERDTreeChDirMode=0
				let NERDTreeQuitOnOpen=1
				let NERDTreeMouseMode=2
				let NERDTreeShowHidden=1
				let NERDTreeKeepTreeInNewTab=1
				let g:nerdtree_tabs_open_on_gui_startup=0
			" }
			" Tabularize {
				nmap <Leader>a= :Tabularize /=<CR>
				vmap <Leader>a= :Tabularize /=<CR>
				nmap <Leader>a: :Tabularize /:<CR>
				vmap <Leader>a: :Tabularize /:<CR>
				nmap <Leader>a:: :Tabularize /:\zs<CR>
				vmap <Leader>a:: :Tabularize /:\zs<CR>
				nmap <Leader>a, :Tabularize /,<CR>
				vmap <Leader>a, :Tabularize /,<CR>
				nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
				vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
			" }
			" Fugitive {
				nnoremap <silent> <leader>gs :Gstatus<CR>
				nnoremap <silent> <leader>gd :Gdiff<CR>
				nnoremap <silent> <leader>gc :Gcommit<CR>
				nnoremap <silent> <leader>gb :Gblame<CR>
				nnoremap <silent> <leader>gl :Glog<CR>
				nnoremap <silent> <leader>gp :Git push<CR>
			" }
			" indent_guides {
				if !exists('g:spf13_no_indent_guides_autocolor')
					let g:indent_guides_auto_colors = 1
				else
					" for some colorscheme ,autocolor will not work,like 'desert','ir_black'."
					autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121   ctermbg=3
					autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
				endif
				let g:indent_guides_start_level = 2
				let g:indent_guides_guide_size = 1
				let g:indent_guides_enable_on_vim_startup = 0
			" }
		" } (End Plugin Config)
	"} (End Setup Plugins)
" } (End Environment)

" General {
" set background=dark			" Use a dark background
filetype plugin indent on		" Automatically detect file types
syntax on						" Syntax highlighting
" set mouse=a						" Automatically enable mouse usage
scriptencoding utf-8			" Assume utf-8
" set autowrite					" Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows cross compatibility
set virtualedit=onemore			" allow for cursor beyond last character
set history=1000				" Store a ton of history (default is 20)
set nospell						" spell checking off
set hidden						" allow buffer switching without saving

" Setting up directories {
set backup
if has('persistent_undo')
	set undofile			" persistent undo file
	set undolevels=1000		" maximum number of changes that can be undone
	set undoreload=10000	" maximum number lines to save for undo on a buffer reload
endif
" }
" }
" Vim UI {
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
	" color solarized				" load a color scheme
endif
set tabpagemax=15				" only show 15 tabs
set showmode					" display the current mode
" set cursorline					" highlight current line

if has('cmdline_info')
	set ruler					" show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " an awesome ruler
	set showcmd					" show partial commands in status line and selected characters/lines in visual mode
endif

if has('statusline')
	set laststatus=2							" Always show status line for the last window
	set statusline=%<%f\						" Filename
	set statusline+=%w%h%m%r					" Options
	set statusline+=%{fugitive#statusline()}	" Git Hotness
	set statusline+=\ [%{&ff}/%Y]				" filetype
	set statusline+=\ [%{getcwd()}]				" current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%		" Right aligned file nav info
endif

set backspace=indent,eol,start  " backspace for dummies
set linespace=0					" No extra spaces between rows
set nu							" Line numbers on
set showmatch					" show matching brackets/parenthesis
set incsearch					" find as you type search
set hlsearch					" highlight search terms
set winminheight=0				" windows can be 0 line high
set ignorecase					" case insensitive search
set smartcase					" case sensitive when uc present
set wildmenu					" show list instead of just completing
set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
" set scrolljump=5				" lines to scroll when cursor leaves screen
set scrolloff=5					" minimum lines to keep above and below cursor
set foldenable					" auto fold code
" set list							" Shows nonprintable characters
" set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace (include tabs)
set listchars=trail:.,extends:#,nbsp:. " Highlight problematic whitespace
" }
" Formatting {
set nowrap						" wrap long lines
set autoindent					" indent at the same level of the previous line
set shiftwidth=4				" use indents of 4 spaces
" set expandtab					" tabs are spaces, not tabs
set tabstop=2					" an indentation every two columns
set softtabstop=2				" let backspace delete indent
" }

" Key Mappings {
let mapleader = ','				" Set leader to comma instead of \
" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Shift key fixes
if has("user_commands")
	command! -bang -nargs=* -complete=file E e<bang> <args>
	command! -bang -nargs=* -complete=file W w<bang> <args>
	command! -bang -nargs=* -complete=file Wq wq<bang> <args>
	command! -bang -nargs=* -complete=file WQ wq<bang> <args>
	command! -bang Wa wa<bang>
	command! -bang WA wa<bang>
	command! -bang Q q<bang>
	command! -bang QA qa<bang>
	command! -bang Qa qa<bang>
endif

cmap Tabe tabe
nnoremap Y y$					" Y will yank to end of line

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14

" Remaps %% to directory of open file
cnoremap %% <C-R>=expand('%:h').'/'<cr>	

" Expands to 'edit file in working directory (pwd)'
map <leader>ew :e %%
" map <leader>es :sp %%			" Expands to 'edit file in pwd in a viewport above this one'
" map <leader>ev :vsp %%		" Expands to 'edit file in pwd in a viewport left of this one'
" Expands to 'edit file in pwd in a [v]ertical viewport above this one'
map <leader>ev :sp %%
" Expands to 'edit file in pwd in a [h]orizontal viewport left of this one'
map <leader>eh :vsp %%
" Expands to 'edit file in pwd in a new tab'
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=
" }
" Init directories {
function! InitializeDirectories()
	let separator = "."
	let parent = $HOME
	let prefix = '.vim'
	let dir_list = {
		\ 'backup': 'backupdir',
		\ 'views': 'viewdir',
		\ 'swap': 'directory' }

	if has('persistent_undo')
		let dir_list['undo'] = 'undodir'
	endif

	for [dirname, settingname] in items(dir_list)
		let directory = parent . '/' . prefix . dirname . "/"
		if exists("*mkdir")
			if !isdirectory(directory)
				call mkdir(directory)
			endif
		endif
		if !isdirectory(directory)
			echo "Warning: Unable to create backup directory: " . directory
			echo "Try: mkdir -p " . directory
		else
			let directory = substitute(directory, " ", "\\\\ ", "g")
			exec "set " . settingname . "=" . directory
		endif
	endfor
endfunction
call InitializeDirectories()

" }



		color darkblue
		" autocommand FileType java set tags=/home/josephbass/src/attask/.tags

" { Old vimrc settings (for reference)
" Make auto-complete Ctr+space
" inoremap <C-space> <C-x><C-o>

"" Improve searching ""

" Make regex more like perl/python
" nnoremap / /\v
" vnoremap / /\v

" apply substitutions globally on lines. Override with /g
" set gdefault

" Highlight search results as you type 
" set incsearch
" set showmatch
" set hlsearch

" Prevent text from wrapping
" set nowrap

" \<space> clears search
" nnoremap <leader><space> :noh<cr>

" 80char lines
" set textwidth=79
" set colorcolumn=80

" Use textmate whitespace characters
" set list
" set listchars=tab:▸\ ,eol:¬

" Only allow real-vim navigation
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

" Save on focus lost
" au FocusLost * :wa

" Sort CSS with \S
" nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

"" Split windows

" vertical split with \w 
" nnoremap <leader>w <C-w>v<C-w>l

"ctr+h/j/k/l moves around split windows
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" }
