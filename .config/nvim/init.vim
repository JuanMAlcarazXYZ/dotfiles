let mapleader = ","
let g:mapleader = ","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

" Essentials
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

Plug 'preservim/nerdtree'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'tomasiser/vim-code-dark' "VSCode Theme
call plug#end()

set title
" set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus

" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set tabstop=4
	set shiftwidth=4
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright
" d is for delete, <leader>d for cut (x still cuts in visual mode)
	nnoremap c "_c
	vnoremap c "_c
	nnoremap C "_C
	nnoremap x "_x
	nnoremap X "_X
	nnoremap d "_d
	nnoremap D "_D
	vnoremap d "_d

	nnoremap <leader>d "+d
	vnoremap <leader>d "+d
	nnoremap <leader>D "+D
	nnoremap <leader>c "+c
	vnoremap <leader>c "+c
	nnoremap <leader>C "+C

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Save file as sudo on files that require root permission
	" cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	" autocmd BufWritePre * %s/\s\+$//e
	" autocmd BufWritePre * %s/\n\+\%$//e
	" autocmd BufWritePre *.[ch] %s/\%$/\r/e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Control+S to save
	map <C-s> :w<CR>

" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" Ctrl+U and Ctrl+W undoable
if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" Fixes vim-commentary for Python
filetype plugin indent on

" VSCode Colors
" colorscheme codedark
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" for transparent background
" function! AdaptColorscheme()
"    highlight clear CursorLine
"    highlight Normal ctermbg=none
"    highlight LineNr ctermbg=none
"    highlight Folded ctermbg=none
"    highlight NonText ctermbg=none
"    highlight SpecialKey ctermbg=none
"    highlight VertSplit ctermbg=none
"    highlight SignColumn ctermbg=none
" endfunction
" autocmd ColorScheme * call AdaptColorscheme()

" highlight Normal guibg=NONE ctermbg=NONE
" highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
" highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
" highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
" highlight clear LineNr
" highlight clear SignColumn

