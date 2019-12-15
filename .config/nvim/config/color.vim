" ---------------------------------------------------------------------------
" | Color Scheme                                                            |
" ---------------------------------------------------------------------------

set t_Co=256                   " Enable full-color support.

set background=dark            " Use colors that look good
                               " on a dark background.

"if has ('nvim')
"  set term=screen-256color
"endif

"colorscheme desert             " Use custom color scheme.
colorscheme hybrid_material

hi Search ctermbg=111 ctermfg=056 cterm=underline

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

" Change the cursor at insert mode
let &t_ti.="\<Esc>[1 q"
let &t_SI.="\<Esc>[5 q"
let &t_EI.="\<Esc>[1 q"
let &t_te.="\<Esc>[0 q"
