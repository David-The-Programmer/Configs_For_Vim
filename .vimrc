" Turning on the line numbers on the side
set number

" Setting on the line numbers on the side to be relative
set relativenumber

" Limit size of tab to be 4 for proper indentation
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight match brackets
set showmatch

" Highlight when searching
set incsearch
set hlsearch

" Remove highlight searches
nnoremap <silent> <esc> :nohlsearch<CR>

" Remap for shifting between tabs
nnoremap Q gT
nnoremap W gt

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

" Get the oceanic next theme
Plug 'mhartington/oceanic-next'

" Plugin for JS Syntax
Plug 'pangloss/vim-javascript'

" Plugin for JSON Syntax
Plug 'elzr/vim-json'

" Plugin for emmet abreviations
Plug 'mattn/emmet-vim'

" Plugin for vim surround
Plug 'tpope/vim-surround'

" Plugin for replace with register
Plug 'vim-scripts/ReplaceWithRegister'

" Plugin for Intellisense
" NOTE! Plugin only really works with vim 8.2 and above
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin for fzf (fuzzy finder) in vim 
" Remember to git clone fzf and install as stated on README
Plug 'junegunn/fzf', { 'do':  { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plugin for displaying file system explorer
Plug 'preservim/nerdtree'

" Plugin to show git status flags in NERDTree file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plugin for syntax highlighting
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Plugin for commenting with ctrl /
Plug 'preservim/nerdcommenter'

" Plugin for git gutter
Plug 'airblade/vim-gitgutter'

" Plugin for vim-airline
Plug 'vim-airline/vim-airline'

" Plugin for dev icons with NERDTree
" Need to make sure terminal is using nerd font(FiraMono Nerd Font)
" Make sure nerd font is installed
Plug 'ryanoasis/vim-devicons'

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

" Config for coc plugin
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ ]
"  Set the updatetime to be lower to trigger coc faster
set updatetime=200

" Use K to trigger tool tip documentation
nnoremap <silent> K :call CocAction('doHover')<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use [`g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Config for FZF plugin
" Remap for :Files command to be ctrl f
nnoremap <silent> <C-f> :Files<CR>

" Config for NERDTree Plugin
" Get NERDTree to show dot files
let NERDTreeShowHidden=1

" Open NERDTree automatically when vim starts
autocmd vimenter * NERDTree

" Key binding to open/close NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" Config NERDTree arrows
let g:NERDTreeDirArrowExpandable = '⮞'
let g:NERDTreeDirArrowCollapsible = '⮟'

" Config to highlight current file opened in NERDTree
" Check if NERDTree is open or active
function! IsNerdTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a
" modifiable file, and we are not in vimdiff
function! SyncTree()
    if &modifiable && IsNerdTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd w
    endif
endfunction

" Hightlight current open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Config for NERDTree Git Plugin
" Config for custom symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"   : "M",
    \ "Staged"     : "S",
    \ "Untracked"  : "U",
    \ "Renamed"    : "R",
    \ "Unmerged"   : "═",
    \ "Deleted"    : "D",
    \ "Dirty"      : "●",
    \ "Clean"      : "✔︎",
    \ "Ignored"    : "I",
    \ "Unknown"    : "?"
    \ }

" Config for dev icons plugin
set encoding=UTF-8

" Config for NERD Commenter plugin
filetype plugin on
" Invoke comments by pressing ctrl /
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle

" Config for vim git gutter plugin
" Do not let git gutter setup any key mapping
let g:gitgutter_map_keys = 0

" Set sign column to always appear
set signcolumn=yes

" Config for the vim airline plugin
" Need this for airline status bar to display properly
let g:airline_powerline_fonts = 1

" OceanicNext theme for vim airline plugin
let g:airline_theme = 'oceanicnext'

" Show buffer details in tab line
" Remember to delete buffers using :bd <filename>
" to make sure that buffers of closed files do not appear
" on the tab line
let g:airline#extensions#tabline#enabled = 1

" Config for how file paths are displayed on tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Show number of matches of search
set shortmess-=S

" No need to show current mode
set noshowmode

" -----------------------------------------------------------------------
" THEME SECTION
syntax enable

if (has("termguicolors"))
	set termguicolors
endif

colorscheme OceanicNext
" -----------------------------------------------------------------------

