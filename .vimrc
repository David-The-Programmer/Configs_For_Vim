"Turning on the line numbers on the side
set number

" Setting on the line numbers on the side to be relative
set relativenumber

" Limit size of tab to be 4 for proper indentation
set tabstop=4

" Highlight match brackets
set showmatch

" Highlight when searching
set incsearch

" -----------------------------------------------------------------------
" PLUGINS SECTION
" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Example
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-plug'

"Get the oceanic next theme
Plug 'mhartington/oceanic-next'

"Plugin for JS Syntax
Plug 'pangloss/vim-javascript'

"Plugin for JSON Syntax
Plug 'elzr/vim-json'

"Plugin for emmet abreviations
Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()
" After that, Reload .vimrc and :PlugInstall to install plugins.
" -----------------------------------------------------------------------
" PLUGINS CONFIG
" Config for vim-json plugin
" Disable conceal to stop weird behaviour when navigating in a json
let g:vim_json_syntax_conceal = 0

" Config for emmet-vim plugin
" Remap the default <C-Y> emmet leader key to ,
let g:user_emmet_leader_key=','
" -----------------------------------------------------------------------
" THEME SECTION
syntax enable

if (has("termguicolors"))
	set termguicolors
endif

colorscheme OceanicNext
" -----------------------------------------------------------------------

