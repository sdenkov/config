set nocompatible
source $VIMRUNTIME/vimrc_example.vim
behave mswin
set selectmode=key

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set ignorecase smartcase nowrap nobackup writebackup
set shortmess+=A

set undofile
set undodir=~/.vim/undo.d

nmap <F4> :! %<.out<Enter>
nmap <F5> :! gcc -o %<.out %<Enter>

vmap <F3> y:echo "<CR>gV
nmap <F3> :echo "<CR>

set guioptions-=T
set guioptions+=b
nmap <Leader>c :set cursorline!<Enter>
nmap <Leader>b :set scrollbind!<Enter>
nmap <Leader>f :vertical normal <Enter>
nmap <Leader>d :diffthis<Enter>

silent! unmap <C-Y>
silent! unmap <C-A>

imap <C-Down> <C-O><C-E>
imap <C-Up> <C-O><C-Y>
