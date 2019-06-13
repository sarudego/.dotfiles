" | Key Mappings                                                            |
" ---------------------------------------------------------------------------

" Use a different mapleader (default is "\").
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" [<Space>w] Fast saving

nmap <leader>w :w!<cr>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" [<Space>q] Fast closing
" [<Space>bd] Buffer delete

nmap <leader>q :q!<cr>
nmap <leader>bd :bd<cr>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Quickly open/reload vim

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" [<F6>] Smart indent the current file

map <F6> mzgg=G'zmz

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>* ] Search and replace the word under the cursor.

nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>/] Clear search.

map <leader>/ <Esc>:noh<CR>
nmap <silent> ,/ :nohlsearch<CR>
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>st] Toggle Git differences.

" map <leader>st :SignifyToggle<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>h ] JSHint the code.
" https://github.com/Shutnik/jshint2.vim

"nmap <leader>h :JSHint<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>l ] Toggle `set list`.

nmap <leader>l :set list!<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>n ] Toggle `set relativenumber`.

" nmap <leader>n :call ToggleRelativeLineNumbers()<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>ss] Strip trailing whitespace.
nmap <leader>ss :call StripTrailingWhitespace()<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>t ] Toggle NERDTree.

map <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <F11> :NERDTreeToggle<CR>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>ti] Toggle indent.

"nmap <leader>ti <Plug>IndentGuidesToggle

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>tl] Toggle show limits.

" nmap <leader>tl :call ToggleLimits()<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>ts] Toggle Syntastic.

"nmap <leader>ts :SyntasticToggleMode \| w<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>v ] Make the opening of the `.vimrc` file easier.

nmap <leader>v :vsp $MYVIMRC<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<Space>W ] Sudo write.

map <leader>W :w !sudo tee %<CR>


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<F2> ] Paste.

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<F3> ] Tagbar toogle.

nmap <F3> :TagbarToggle<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<F6> ] Local spell.

"nn <F6> :setlocal spell! spell?<CR>


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
nmap <Leader>sl :setlocal spell! spelllang=es<CR>
nmap <Leader>se :setlocal spell! spelllang=en_us<CR>


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [<F8> & <F9>] Comment & uncomment.
" need NerdCommenter plugin
map <F8> <leader>cc
map <F9> <leader>cu

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" [tn & td] Tabs.

nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" split and move it

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Max out the height of the current split
" ctrl+w _

"Max out the width of the current split
" ctrl+w |

"Normalize all split sizes, which is very handy when resizing terminal
" ctrl+w =

"Swap top/bottom or left/right split
" Ctrl+W R

"Break out current window into a new tabview
" Ctrl+W T

"Close every window in the current tabview but the current one
" Ctrl+W o

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

