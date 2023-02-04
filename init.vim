set encoding=UTF-8
set number relativenumber
set showmatch
syntax on

" set tab to 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autochdir

"switch buffers
nnoremap <C-l> <cmd>bnext<cr>
nnoremap <C-h> <cmd>bprev<cr>

"close buffer
nnoremap <C-c> <cmd>bdelete<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"add telescope shortcuts
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"set current dir as working dir shortcuts
nnoremap <leader>cd :cd %:p:h<CR>

"remap for copying to clipboard
nnoremap Y "+y
vnoremap Y "+y
nnoremap yY ^"+y$

"" ctr+n will open and close NERDTree
nnoremap <C-N> :NERDTreeToggle<CR>
"" <leader> + o will open NERDTree in the file your editing
nnoremap <leader>o :NERDTreeFind<CR>

" CoC settings
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" VimPlug plugin manager
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'preservim/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'bling/vim-bufferline'
Plug 'ThePrimeagen/vim-be-good'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

let g:NERDTreeChDirMode = 2
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'app']
let g:NERDTreeWinPos = "left"

autocmd VimEnter * wincmd w
autocmd VimEnter * wincmd p

set background=dark
colorscheme PaperColor
