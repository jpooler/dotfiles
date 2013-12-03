set runtimepath^=~/.vim/bundle/ctrlp.vim
execute pathogen#infect()
autocmd vimenter * if !argc() | NERDTree | endif
syntax on
filetype plugin indent on

set relativenumber
let g:ackprg = 'ag --nogroup --nocolor --column'

