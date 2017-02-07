set runtimepath^=~/.vim/bundle/
call pathogen#incubate()
call pathogen#helptags()
"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"set runtimepath^=~/.vim/bundle/
execute pathogen#infect()
syntax enable
filetype plugin indent on

set noswapfile
set nocompatible
filetype on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:ctrlp_show_hidden = 1

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "vadv/vim-chef"

set autoindent
set visualbell
set smarttab
set noexpandtab
set paste
"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
set background=dark
"colorscheme solarized

let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized256_dark'

let g:Powerline_symbols = "fancy"

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set backspace=indent,eol,start
"autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *Vagrantfile* set filetype=ruby

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

autocmd FileType ruby,eruby set filetype=ruby.eruby.chef



let g:hcl_fmt_autosave = 0
let g:tf_fmt_autosave = 0
let g:nomad_fmt_autosave = 0
