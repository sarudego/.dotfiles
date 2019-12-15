 " Automatic Commands
 " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if has("autocmd")

  " Autocommand Groups.
  " http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  " Automatically reload the configurations from
  " the `~/.vimrc` file whenever they are changed.

  augroup auto_reload_vim_configs
      autocmd!
      autocmd BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
      "autocmd BufWritePost vimrc source $MYVIMRC | echom "Reloaded " . $MYVIMRC | redraw
  augroup END


  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif



  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  " Use relative line numbers.
  " http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/

  augroup relative_line_numbers
      autocmd!

      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
      " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      " Automatically switch to absolute
      " line numbers when Vim loses focus.
      " autocmd FocusLost * :set number
      " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      " Automatically switch to relative
      " line numbers when Vim gains focus.
      " autocmd FocusGained * :set relativenumber
      " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      " Automatically switch to absolute
      " line numbers when Vim is in insert mode.
      " autocmd InsertEnter * :set number
      " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      " Automatically switch to relative
      " line numbers when Vim is in normal mode.
      " autocmd InsertLeave * :set relativenumber
  augroup END

  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  " Automatically strip the trailing
  " whitespaces when files are saved.
  " function! StripTrailingWhitespace()
    " normal mZ
    " %s/\s\+$//e
    " if line("'Z") != line(".")
      " echo "Stripped whitespace\n"
    " endif
    " normal `Z
  " endfunction
  function! StripTrailingWhitespace()
    normal mZ
    let l:chars = col("$")
    %s/\s\+$//e
    if (line("'Z") != line(".")) || (l:chars != col("$"))
      echo "Trailing whitespace stripped\n"
    endif
    normal `Z
  endfunction
  autocmd BufWritePre * :call StripTrailingWhitespace()

  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  " Standard python configuration
  autocmd FileType python set ts=4
  highlight ColorColumn ctermbg=gray
  autocmd FileType python set colorcolumn=80
  filetype plugin indent on

  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  " Enable Auto-lint for all files
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END




endif
