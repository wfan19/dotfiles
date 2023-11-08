" ========== Plugin stuff ========== 
" Begin vim-plug
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()

" ========== General vim configuration  ========== 
" activates filetype detection
filetype plugin indent on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

" Enable syntax highlighting
syntax enable
colorscheme monokai

" Tab and shifting
set tabstop=4
set expandtab
set shiftwidth=4

set autochdir

" Turn on line numbers!
set number

" ========== Coc-nvim General Setup ========== 
let g:coc_disable_startup_warning = 1 " Disable Coc vim-version warning

" Remap tab to autocomplete
"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Some general parameters (See coc.nvim Readme for info)
set cmdheight=2
set updatetime=300
" set signcolumn=number

" ========== File tree setup ========== 
" I don't really use netrw but this configuration is here if needed
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 15

" CocExplorer hotkey setup
" <C-@> is equivalent to <Control-Space> in non-neovim setups
function! s:open_explorer()
    CocCommand explorer
                \ --position right
                \ --width 35
                \ --sources=buffer+,file+
                \ --quit-on-open
endfunction

nnoremap <silent> <C-@> :call <SID>open_explorer() <CR>
vnoremap <silent> <C-@> :call <SID>open_explorer() <CR>
inoremap <silent> <C-@> <ESC> :call <SID>open_explorer() <CR>

" ========== Misc keybinds ==========
" Ctrl + Shift + i to replace a single character (kind of a hack)
" Documented in https://vi.stackexchange.com/a/5177
nnoremap <C-I> i <ESC>r

" ========== Remapping hjkl for Norman ========== 
" Remap Y (H position on norman) to H
nnoremap y h
vnoremap y h
nnoremap Y H
vnoremap Y H

" Remap N (J position on Norman) to J
nnoremap n j
vnoremap n j
nnoremap N J
vnoremap N J

nnoremap i k
vnoremap i k
nnoremap I K
vnoremap I K

" Remap O (L position on Norman) to L 
nnoremap o l
vnoremap o l
nnoremap O L
vnoremap O L

" Remap "Yank" to V (originally unbound)
nnoremap v y
vnoremap v y
" We do not remap Capital V because Shift+V -> v is the same as Y (Yank entire line)

" Remap "Next search item" to j (originally Down)
nnoremap j n
vnoremap j n
nnoremap J N
vnoremap J N

" Remap "Insert" to k (origially Up)
nnoremap k i
vnoremap k i
nnoremap K I
vnoremap K I

" Remap "New line" to L (Originally Move Right)
nnoremap l o
nnoremap L O
