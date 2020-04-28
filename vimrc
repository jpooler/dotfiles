set runtimepath^=~/.vim/bundle/
set encoding=utf-8
set hlsearch
set incsearch
set smartcase

call plug#begin('~/.vim/plugged')
Plug 'MarcWeber/vim-addon-mw-utils'
" This one disables tab completion for some reason
"Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go'
Plug 'fatih/vim-hclfmt'
Plug 'garbas/vim-snipmate'
Plug 'hashivim/vim-terraform'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'mileszs/ack.vim'
Plug 'pearofducks/solarized-powerlines'
Plug 'rodjek/vim-puppet'
Plug 'sunaku/vim-ruby-minitest'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'vim-ruby/vim-ruby'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vadv/vim-chef'
Plug 'wycats/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
call plug#end()


" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = {'level': 'warnings'}

"" (Optional)Remove Info(Preview) window
set completeopt-=preview
"
"" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"
"" (Optional) Enable terraform plan to be include in filter
"let g:syntastic_terraform_tffilter_plan = 1
"
"" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
"let g:terraform_completion_keys = 1
"
"" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
"let g:terraform_registry_module_completion = 1

"let g:deoplete#enable_at_startup = 1

"let g:deoplete#omni_patterns = {}

"call deoplete#custom#option('omni_patterns', {
"\ 'complete_method': 'omnifunc',
"\ 'terraform': '[^ *\t"{=$]\w*',
"\})
" Use <TAB> to select the popup menu:

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

call deoplete#initialize()

let g:deoplete#enable_at_startup = 1

syntax enable
filetype plugin indent on


set noswapfile
set nocompatible
let g:ctrlp_show_hidden = 1

"Time to break some habits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Not ready for this yet!
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>

set autoindent
set visualbell
set smarttab
set noexpandtab
set pastetoggle=<F4>
set copyindent
let g:ackprg = 'ag --nogroup --nocolor --column'
set background=dark

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
autocmd BufNewFile,BufRead *Vagrantfile* set filetype=ruby
" Pre 7.4
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
nnoremap <C-y> :call RelativeNumberToggle()<CR>
else                  " fallback
  set number          " show line numbers
  " inverts numbering
  nnoremap <C-y>n :set number! number?<CR>
endif

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


"autocmd FileType ruby,eruby set filetype=ruby.eruby.chef


"autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

let g:hcl_fmt_autosave = 1
let g:tf_fmt_autosave = 1
let g:nomad_fmt_autosave = 1

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|^.git$\|_site'

let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  


let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <F8> :TagbarToggle<CR>

nmap <C-T> :NERDTreeToggle<CR>

let g:go_def_mapping_enabled=0

"This is for vim-go

let mapleader = ","
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

"set completefunc=syntaxcomplete#Complete
"nmap <leader>t :!thyme -d<cr>
"" ruby-runner set ruby buffer
"command! FR set filetype=ruby

" Remove autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Terraform fmt
let g:terraform_fmt_on_save = 1
let g:terraform_fold_sections=0
let g:terraform_remap_spacebar=1

" Terraform magic!
command! -bar PrettifyTerraformKeywords %s/^"\(module\|resource\|data\)"/\1/e
command! -bar PrettifyTerraformNewlines %s/.*=.*\zs\n\n\ze/\r/e
command! -bar PrettifyTerraformAssigns %s/\s\+\zs"\(.*\)"\ze.*=/\1/e
command! -bar FormatTerraform %!terraform fmt -
command! PrettyFormatTerraform PrettifyTerraformKeywords|PrettifyTerraformAssigns|PrettifyTerraformNewlines|FormatTerraform

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


set nomodeline

