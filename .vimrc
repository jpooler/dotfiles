set runtimepath^=~/.vim/bundle/
set encoding=utf-8
set hlsearch
set incsearch
set smartcase

"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

call plug#begin('~/.vim/plugged')
Plug 'MarcWeber/vim-addon-mw-utils'
" This one disables tab completion for some reason
"Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
"Plug 'chase/vim-ansible-yaml'
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
Plug 'pearofducks/ansible-vim'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
Plug 'mattn/calendar-vim'

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

"call deoplete#initialize()

"let g:deoplete#enable_at_startup = 1

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
"let g:terraform_remap_spacebar=1

" Terraform magic!
command! -bar PrettifyTerraformKeywords %s/^"\(module\|resource\|data\)"/\1/e
command! -bar PrettifyTerraformNewlines %s/.*=.*\zs\n\n\ze/\r/e
command! -bar PrettifyTerraformAssigns %s/\s\+\zs"\(.*\)"\ze.*=/\1/e
command! -bar FormatTerraform %!terraform fmt -
command! PrettyFormatTerraform PrettifyTerraformKeywords|PrettifyTerraformAssigns|PrettifyTerraformNewlines|FormatTerraform

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


set nomodeline
" COC Testing

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <c-@> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


let g:snipMate = { 'snippet_version' : 1 }
map <leader>md :InstantMarkdownPreview<CR>
let g:instant_markdown_autostart = 0	" disable autostart



" vimwiki - Personal Wiki for Vim
" https://github.com/vimwiki/vimwiki
set nocompatible
filetype plugin on
syntax on
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax

let g:vimwiki_list = [
            \{'path': '~/Tools/work/vimwiki/index.wiki', 'syntax': 'markdown'}
                \]
au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab
"au BufRead,BufNewFile *.wiki set filetype=vimwiki
":autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()
