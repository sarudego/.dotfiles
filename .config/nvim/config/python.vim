" Python
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Plug 'davidhalter/jedi-vim', { 'for': 'python' }      " Autocompletion Python

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }     " Allow python virtualenvs

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Plug 'mindriot101/vim-yapf'
"nnoremap <leader>y :call Yapf()<cr>
"nnoremap <leader>y :Yapf<cr>

let g:yapf_style = "pep8"
autocmd BufWritePre *.py 0,$!yapf

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Python highlight
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Debugger
Plug 'vim-vdebug/vdebug'

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Autoformatting
Plug 'sbdchd/neoformat'
" But disable black autoformatter
" if available, only allow yapf and docformatter
let g:neoformat_enabled_python = ['yapf', 'docformatter']


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Deoplete, autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
" Enable  Autocompletion on startup
let g:deoplete#enable_at_startup = 1


