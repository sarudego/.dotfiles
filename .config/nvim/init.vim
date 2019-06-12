call plug#begin('~/.config/nvim/plugged')
" Git tools
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Quake-like terminal
Plug 'Lenovsky/nuake'

" Easy align
Plug 'junegunn/vim-easy-align'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Denite easy search
Plug 'Shougo/denite.nvim'

" Grep
Plug 'mhinz/vim-grepper'

" Theme
Plug 'kristijanhusak/vim-hybrid-material'

" Lightline and tmuxline, statusbars
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

" Python highlight
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Debugger
Plug 'vim-vdebug/vdebug'

" Autoformatting
Plug 'sbdchd/neoformat'

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Deoplete, autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

" Devicons and emoji help showing nice icons on your vim setup
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'

" Startify, a nice startup page
Plug 'mhinz/vim-startify'

call plug#end()

" Configure lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Theme config
let g:enable_bold_font = 1
set laststatus=2
set bg=dark
colorscheme hybrid_material

" Basic vim configuration
set mouse=a
set expandtab
set number
set wrap
set linebreak
set showbreak=>\ \ \
let mapleader=","
set syntax=auto
syntax on

" Standard python configuration
autocmd FileType python set ts=4
highlight ColorColumn ctermbg=gray
autocmd FileType python set colorcolumn=80
filetype plugin indent on

" Fuzzy
nmap <C-p> :Denite file/rec buffer<CR>

" Enable  Autocompletion on startup
let g:deoplete#enable_at_startup = 1

" F4 to pull a quake-like console
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

" ctrl-o to open nerdtree
nnoremap <C-O> :NERDTreeToggle<CR>

" Enable Auto-lint for all files
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" But disable black autoformatter
" if available, only allow yapf and docformatter
let g:neoformat_enabled_python = ['yapf', 'docformatter']


source ~/.zplug/repos/XayOn/c64b066d69734f6d0f5cbf2236d21bd5/pt.vim
