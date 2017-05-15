set nu
set nowrap

" put backup/swap files in one location
set backup
set backupdir=~/.vim/backup
set dir=~/.vim/backup

" ---- Persistent Undo from http://stackoverflow.com/a/22676189 ----
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . vimDir)
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif
" ---- End ----

" Spaces, not tabs!
set tabstop=4
set shiftwidth=4
set expandtab

" vim-plug (Vundle-like) plugin system
" Make sure you use single quotes
" Install with :PlugInstall
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'rhysd/vim-crystal'
Plug 'pivotal/tmux-config'
Plug 'vimwiki/vimwiki'
Plug 'arcticicestudio/nord-vim'
Plug 'ervandew/supertab'
call plug#end()
" end vim-plug

" CtrlP config
let g:ctrlp_map = 'mm'

" Colorscheme config
colorscheme nord

" NERDTree config
map <C-n> :NERDTreeToggle<CR>

" Map `jj` to ESC
inoremap jj <ESC>

" Highlight for color and column
set colorcolumn=81
set cursorline
highlight ColorColumn ctermbg=242

" Wrap on 80 character column (to match guide above)
set wrap
set textwidth=80

" Disable up, down, left, right
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Make <Enter> select autocomplete suggestion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ---- Language specific ----
" Crystal
autocmd Filetype crystal setlocal ts=2 sw=2

" Ruby
autocmd Filetype ruby setlocal ts=2 sw=2

" PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Make
autocmd FileType make setlocal noexpandtab
