" Plugins managed by vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/site/plug.vim')

" Make sure you use single quotes for plugin paths

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" RLS and async autocomplete plugins
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'elmcast/elm-vim'

call plug#end()

" RLS setup, source: https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" Run rustfmt on save
let g:rustfmt_autosave = 1

" Turn on Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['cargo']
let g:elm_syntastic_show_warnings = 1

" Asyncomplete setup
" Enable tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Further status line customisation
" Source: https://stackoverflow.com/a/9121083
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f       "file name
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

" Puts in the current git status
set statusline+=%{fugitive#statusline()}

" Puts in syntastic warnings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number

" Indentation
set tabstop=3
set shiftwidth=3
set expandtab
set ai
set smartindent
filetype on
filetype plugin on
filetype indent on

" Show matching paren
set showmatch

" Show trailing whitespace
highlight Trail ctermbg=52
call matchadd('Trail', '\s\+$', 100)

" Enable line numbering
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Minimum number of lines to keep above and below the cursor
set scrolloff=15

" Map 'kj' to exit insert mode - avoid the long reach of the Esc key
:imap kj <Esc>

" Disable word wrapping
set wrap!

" Remap the leader (normally \ ) to comma key (easier to type)
" Credit - stevelosh.com
let mapleader= ","

" Show coloured colunm to indicate when lines are too long
set colorcolumn=81
highlight ColorColumn ctermbg=8

" Get rid of ~ characters at the end of buffers
set fillchars=eob:\ 

" Remap semicolon to colon, to save one keypress whenever : is required
nnoremap ; :

" Disable the arrow keys in normal and insert modes
" Useful for new users. Prevents cheating :-)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>t : NerdTree toggle
nnoremap <leader>t :NERDTreeToggle<cr>

" <leader>e : exit, saving session and all changes
nnoremap <leader>e :mks!<cr>:x<cr>

" <leader>m - save current buffer (very quick to type)
nnoremap <leader>m :w<cr>

" <leader>W - Strip all trailing whitespace in the current file.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" <leader>a - start Ack
nnoremap <leader>a :Ack

" <leader>v - Reselect text that was just pasted, for easy indenting, etc.
nnoremap <leader>v V`]

" <leader>ec - Quickly open our config in a vertically split window
nnoremap <leader>ev <C-w>v<C-w>l:e ~/Dropbox/.config/nvim/init.vim<cr>

" Working with Split Windows
""""""""""""""""""""""""""""
" <leader>w - Open a window and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" <leader>x - Close the current window (and save if changes have been made)
nnoremap <leader>x :x<CR>

" <leader>h/l or a/d (think wasd) - move window focus left/right
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>a <C-w>h
nnoremap <leader>d <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
" Enable folding, but nothing is folded automatically
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable folding
set foldenable

" Make folding work by indents
set fdm=indent

" Don't autofold anything
set foldlevel=100

" Don't open folds when you search into them
set foldopen-=search

" Don't open folds when we undo
set foldopen-=undo

"set space to toggle a fold
nnoremap <space> za

