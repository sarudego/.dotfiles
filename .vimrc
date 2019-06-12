"----------------------------------------------------------------------------
" | .vimrc                                                                  |
" | Author: Sarudego                                                        |
" | Source: github.es/sarudego/.dotfiles                                    |
" | Web: sarudego.es                                                        |
" |                                                                         |
" | Sections:                                                               |
" |       -> General                                                        |
" |       -> Bundle Setup                                                   |
" |       -> Plugins                                                        |
" |       -> Color Scheme                                                   |
" |       -> Mappings                                                       |
" |                                                                         |
" ---------------------------------------------------------------------------



" ---------------------------------------------------------------------------
" | General                                                                 |
" ---------------------------------------------------------------------------

set nocompatible               " Don't make Vim vi-compatibile.

syntax on                      " Enable syntax highlighting.

if has("autocmd")
    filetype plugin indent on
    "           │     │    └──── Enable file type detection.
    "           │     └───────── Enable loading of indent file.
    "           └─────────────── Enable loading of plugin files.
endif

set autoindent                 " Copy indent to the new line.
set autoread                   " Autoread on external changes
set autowrite                  " Autowrite changes on current file

set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace`
set backspace+=start           " ┘ in insert mode.

"set backupdir=~/.vim/backups   " Set directory for backup files.

"set backupskip=/tmp/*          " ┐ Don't create backups
"set backupskip+=/private/tmp/* " ┘ for certain files.


set clipboard=unnamed          " ┐
                               " │ Use the system clipboard
if has("unnamedplus")          " │ as the default register.
    set clipboard+=unnamedplus " │
endif                          " ┘

set cpoptions+=$               " When making a change, don't
                               " redisplay the line, and instead,
                               " put a `$` sign at the end of
                               " the changed text.

set colorcolumn=80             " Highlight certain column(s).
set cursorline                 " Highlight the current line.
"set directory=~/.vim/swaps     " Set directory for swap files.
set encoding=utf-8 nobomb      " Use UTF-8 without BOM.

set foldmethod=syntax
set nofoldenable

set hidden                     " hides buffer
set history=5000               " Increase command line history.
set hlsearch                   " Enable search highlighting.
set ignorecase                 " Ignore case in search patterns.

set incsearch                  " Highlight search pattern
                               " as it is being typed.

set laststatus=2               " Always show the status line.

set lazyredraw                 " Do not redraw the screen while
                               " executing macros, registers
                               " and other commands that have
                               " not been typed.

set linebreak                  " ┐
set showbreak=↪                " │ Enable linebreak on 500 characters
set tw=80                      " │ and wrap it.
set wrapmargin=2               " ┘

set list                       " See differences between tabs and spaces

set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
" set listchars+=eol:↴         " │ represent invisible characters.
set listchars+=nbsp:_          " │
set listchars+=extends:#       " ┘


set magic                      " Enable extended regexp.
set mat=2                      " Blink matching brackets
set mousehide                  " Hide mouse pointer while typing.

set nobackup                   " ┐
set nowb                       " │ Turn backup off
set noswapfile                 " ┘

set noerrorbells               " Disable error bells.

set nojoinspaces               " When using the join command,
                               " only insert a single space
                               " after a `.`, `?`, or `!`.

set nostartofline              " Kept the cursor on the same column.

set numberwidth=5              " Increase the minimal number of
                               " columns used for the `line number`.

set number relativenumber      " ┐
set nonumber norelativenumber  " │ Turn hybrid line numbers off
set number! relativenumber!    " ┘ toggle hybrid line numbers

set report=0                   " Report the number of lines changed.
set ruler                      " Show cursor position.

set scrolloff=5                " When scrolling, keep the cursor
                               " 5 lines below the top and 5 lines
                               " above the bottom of the screen.

set shiftround                 " Multiple shiftwidth indenting with '<' and '>'

set shortmess=aAItW            " Avoid all the hit-enter prompts.
set showcmd                    " Show the command being typed.
set showmatch                  " Set show matching parenthesis
set showmode                   " Show current mode.
set so=7                       " Set 7 lines to the cursor when movin vertically using j/k
set spelllang=en_us            " Set the spellchecking language.

set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters.

set smartindent                " Enable smartindent when starting new line

set synmaxcol=250              " Limit syntax highlighting (this
                               " avoids the very slow redrawing
                               " when files contain long lines).

set title                      " change the terminal's title.

set tabstop=2                  " ┐
set smarttab                   " │
set softtabstop=2              " │ Set global <TAB> settings.
set shiftwidth=2               " │
set expandtab                  " ┘

set ttyfast                    " Enable fast terminal connection.
"set undodir=~/.vim/undos      " Set directory for undo files.
"set undofile                  " Automatically save undo history.
set virtualedit=all            " Allow cursor to be anywhere.

set viminfo^=%                 " Remember info about open buffers on close

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

set wildmenu                   " ┐ Enable enhanced command-line
set wildmode=full              " ┘ completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted).

set winminheight=0             " Allow windows to be squashed.


set splitbelow                 " Split below
set splitright                 " Split right


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


" Use Plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
 if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
 endif

call plug#begin('~/.vim/plugged')



source ~/.vim/plug_general.vim
" source ~/.vim/plug_web.vim
source ~/.vim/plug_python.vim
source ~/.vim/plug_other.vim



call plug#end()

" ---------------------------------------------------------------------------
" | Automatic Commands                                                      |
" ---------------------------------------------------------------------------

source ~/.vim/autocmd.vim

" ---------------------------------------------------------------------------
" | Color Scheme                                                            |
" ---------------------------------------------------------------------------

source ~/.vim/color.vim


" ---------------------------------------------------------------------------
" | Key Mappings                                                            |
" ---------------------------------------------------------------------------

source ~/.vim/mappings.vim

