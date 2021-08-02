
set number
set incsearch
set statusline=2
let &titlestring = @% 
:set nofixendofline
:let mapleader = ","
"/// Jump to misspelled [s ]s then z= for a list of words
set spell

"/////// Clear search highlighting//////
:let @/ = ""

call plug#begin('~/.vim/plugged')
" Using Vim-Plug
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'navarasu/onedark.nvim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'codota/tabnine-vim'
Plug 'eslint/eslint'
call plug#end()
let g:coc_global_extensions = ['coc-tslint-plugin',  'coc-tabnine', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
" Start autocompletion after 4 chars
command! -nargs=0 Pret :CocCommand prettier.formatFile

"////////// My Custom Mapings /////////////////

inoremap $  ${``}<Left><Left>
inoremap { { }
inoremap [ [ ]
inoremap ( ( )
inoremap ' ''<Left>
inoremap lll console.log()<Left>
inoremap => () =>
inoremap /* /* */
"//////////////// Split window Nav //////////

map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k


"///////// Open NerdTree with command t
nmap <C-t> :NERDTreeToggle<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"// for vimcommenter
filetype plugin on

syntax on
let g:onedark_style = 'darker'

colorscheme onedark
syntax match jsNumber /\<-\=\d\+\(L\|[eE][+-]\=\d\+\)\=\>\|\<0[xX]\x\+\>/
hi jsNumber guifg=#c500ff guibg=NONE gui=NONE

