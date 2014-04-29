"source /Users/jarrod/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
set runtimepath^=~/.vim/bundle/ctrlp.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

set autoindent
set visualbell
set smarttab
set noexpandtab

let g:ackprg = 'ag --nogroup --nocolor --column'
set background=dark
colorscheme solarized

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


if exists("+relativenumber")
  if v:version >= 400
    set number
  endif
  set relativenumber  " show relative line numbers
  set numberwidth=3   " narrow number column
  " cycles between relative / absolute / no numbering
  if v:version >= 400
    function! RelativeNumberToggle()
      if (&number == 1 && &relativenumber == 1)
        set nonumber
        set relativenumber relativenumber?
      elseif (&number == 0 && &relativenumber == 1)
        set norelativenumber
        set number number?
      elseif (&number == 1 && &relativenumber == 0)
        set norelativenumber
        set nonumber number?
      else
        set number
        set relativenumber relativenumber?
      endif
    endfunc
  else
    function! RelativeNumberToggle()
      if (&relativenumber == 1)
        set number number?
      elseif (&number == 1)
        set nonumber number?
      else
        set relativenumber relativenumber?
      endif
    endfunc
  endif
  nnoremap <C-n> :call RelativeNumberToggle()<CR>
else                  " fallback
  set number          " show line numbers
  " inverts numbering
  nnoremap <C-n>n :set number! number?<CR>
endif
