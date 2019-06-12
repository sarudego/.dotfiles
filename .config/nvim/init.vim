call plug#begin('~/.vim/plugged')
" VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Terminal
Plug 'Lenovsky/nuake'

" Easy align
Plug 'junegunn/vim-easy-align'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Denite easy search
Plug 'Shougo/denite.nvim'

" Grep
Plug 'mhinz/vim-grepper'

" Airline, nerdtree, tagbar, vimux.
" Theme
Plug 'jdkanani/vim-material-theme'
Plug 'kristijanhusak/vim-hybrid-material'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

" Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'python/black'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


" Unclasified
Plug 'ryanoasis/vim-devicons'
Plug 'bagrat/vim-workspace'
Plug 'junegunn/vim-emoji'
Plug 'mhinz/vim-startify'


call plug#end()

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


filetype plugin indent on

" Theme config
let g:enable_bold_font = 1
set laststatus=2
set bg=dark
colorscheme hybrid_material

" Basic vim configuration
set mouse=a
set expandtab
set wrap
set linebreak
set showbreak=>\ \ \
let mapleader=","
set syntax=auto
syntax on

" Remove extra spaces
autocmd BufWritePre * :%s/\s\+$//e

" Standard python configuration
autocmd FileType python set ts=4
autocmd FileType php set ts=4
autocmd FileType php set sw=4
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType python match OverLength /\%79v.\+/
autocmd FileType python autocmd BufWritePre * :%s/\s\+$//e

" Useful when working with big cucumber files.
autocmd FileType cucumber match none
autocmd FileType cucumber set nowrap

" Basic mappings
nmap <C-p> :Denite file/rec buffer<CR> " Fuzzy

" vim test, set bindings, configure to use tmux and pytest + vagrant
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#strategy = "vimux"
let test#python#runner = 'pytest'

" autocmd vimenter * NERDTree

let g:deoplete#enable_at_startup = 1

nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

nnoremap <C-O> :NERDTreeToggle<CR>


" Black
let g:black_linelength=80
autocmd BufWritePre *.py execute ':Black'
