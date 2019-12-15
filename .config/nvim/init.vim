" ---------------------------------------------------------------------------
" | General                                                                 |
" ---------------------------------------------------------------------------


if has("autocmd")
    filetype plugin indent on
endif

"set autoindent                 " Copy indent to the new line.
"set autoread                   " Autoread on external changes
"set autowrite                  " Autowrite changes on current file

"set backspace=indent           " ┐
"set backspace+=eol             " │ Allow `backspace`
"set backspace+=start           " ┘ in insert mode.

"set cpoptions+=$               " When making a change, don't
                               " redisplay the line, and instead,
                               " put a `$` sign at the end of
                               " the changed text.


"set colorcolumn=80             " Highlight certain column(s).
"set cursorline                 " Highlight the current line.
"set encoding=utf-8 nobomb      " Use UTF-8 without BOM.

"set foldmethod=syntax
"set nofoldenable

"set laststatus=2               " Always show the status line.

"set lazyredraw                 " Do not redraw the screen while
                               " executing macros, registers
                               " and other commands that have
                               " not been typed.

"set linebreak                  " ┐
set showbreak=>\ \ \          " │
"set showbreak=↪                " │ Enable linebreak on 500 characters
"set tw=80                      " │ and wrap it.
"set wrapmargin=2               " ┘

"set list                       " See differences between tabs and spaces
"set listchars=tab:▸\           " ┐
"set listchars+=trail:·         " │ Use custom symbols to
"set listchars+=eol:↴         " │ represent invisible characters.
"set listchars+=nbsp:_          " │
"set listchars+=extends:#       " ┘

"set magic                      " Enable extended regexp.
"set mat=2                      " Blink matching brackets
set mouse=a
"set mousehide                  " Hide mouse pointer while typing.

"set nobackup                   " ┐
"set nowb                       " │ Turn backup off
"set noswapfile                 " ┘

"set noerrorbells               " Disable error bells.

"set nojoinspaces               " When using the join command,
                               " only insert a single space
                               " after a `.`, `?`, or `!`.

"set nostartofline              " Kept the cursor on the same column.

"set number relativenumber      " ┐
"set nonumber norelativenumber  " │ Turn hybrid line numbers off
"set number! relativenumber!    " ┘ toggle hybrid line numbers

"set report=0                   " Report the number of lines changed.
"set ruler                      " Show cursor position.

"set shiftround                 " Multiple shiftwidth indenting with '<' and '>'

"set showcmd                    " Show the command being typed.
"set showmatch                  " Set show matching parenthesis
"set showmode                   " Show current mode.

"set spelllang=en_us            " Set the spellchecking language.

"set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters.

"set smartindent                " Enable smartindent when starting new line

"syntax on
set syntax=auto

"set title                      " change the terminal's title.

"set tabstop=2                  " ┐
"set smarttab                   " │
"set softtabstop=2              " │ Set global <TAB> settings.
"set shiftwidth=2               " │
"set expandtab                  " ┘

"set ttyfast                    " Enable fast terminal connection.

"set wildmenu                   " ┐ Enable enhanced command-line
"set wildmode=full              " ┘ completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted).


" ---------------------------------------------------------------------------
" | Plugins                                                                 |
" ---------------------------------------------------------------------------
" check plugin
function! BuildYCM(info)
 " info is a dictionary with 3 fields
 " - name:   name of the plugin
 " - status: 'installed', 'updated', or 'unchanged'
 " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" Bootstrap Plug
let autoload_plug_path = stdpath('data') . '~/.local/share/nvim/plugged'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path


call plug#begin('~/.config/nvim/plugged')

source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/python.vim


call plug#end()


" ---------------------------------------------------------------------------
" | Automatic Commands                                                      |
" ---------------------------------------------------------------------------

source $HOME/.config/nvim/config/autocmd.vim

" ---------------------------------------------------------------------------
" | Color Scheme                                                            |
" ---------------------------------------------------------------------------

source $HOME/.config/nvim/config/color.vim


" ---------------------------------------------------------------------------
" | Key Mappings                                                            |
" ---------------------------------------------------------------------------

source $HOME/.config/nvim/config/mappings.vim

