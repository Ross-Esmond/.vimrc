set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'bhurlow/vim-parinfer'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'bagrat/vim-buffet'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

"" CoC

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" use tab for CoC for autocomplete navigation
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" use <c-space> to trigger CoC completion
inoremap <silent><expr> <c-space> coc#pum#visible() ? coc#pum#confirm() : coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" File renaming
nmap <leader>frn <cmd>CocCommand workspace.renameCurrentFile<cr>

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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Telescope find commands
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
