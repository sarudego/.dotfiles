" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Plugins general
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

"Plug 'sjl/gundo.vim',  { 'on': 'GundoToggle' }     " Undo tree git

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Syntax highlighting
Plug 'tpope/vim-markdown'

" Surroundings parentheses, brackets, quotes...
Plug 'tpope/vim-surround'

" Display thin vertical lines at each indentation level for code
Plug 'Yggdroot/indentLine'

" Theme
Plug 'kristijanhusak/vim-hybrid-material'

" Git tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Quake-like terminal
Plug 'Lenovsky/nuake'
" F4 to pull a quake-like console
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

" Easy align
Plug 'junegunn/vim-easy-align'

" Nerdtree
Plug 'scrooloose/nerdtree'
" ctrl-o to open nerdtree
nnoremap <C-O> :NERDTreeToggle<CR>

" Denite easy search
Plug 'Shougo/denite.nvim'
" Fuzzy
nmap <C-p> :Denite file/rec buffer<CR>

" Grep
Plug 'mhinz/vim-grepper'


" Lightline and tmuxline, statusbars
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'


" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'


" Devicons and emoji help showing nice icons on your vim setup
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'

" Startify, a nice startup page
Plug 'mhinz/vim-startify'

