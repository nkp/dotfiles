" Don't bother with vi compatibility
set nocompatible
" Code completion
"
" Avoid storing backups and swap files in the working directory.
set backupdir=~/.vim/backups//
set directory=~/.vim/swaps//
" Force Unix line endings
set ff=unix
" configure Vundle
" without this vim emits a zero exit status, later, because of :ft off
filetype on 
filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=$GOROOT/misc/vim
call vundle#rc()

" install Vundle bundles

Plugin 'gmarik/vundle'

" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" File System Explorer
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Powerful status bar
Plugin 'bling/vim-airline'

" Sublime-like multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Jinja 2
Plugin 'Glench/Vim-Jinja2-Syntax'

" Typescript
Plugin 'leafgarland/typescript-vim'

" Go
Plugin 'fatih/vim-go'

" Spacing 'Distraction-free mode'
Plugin 'mikewest/vimroom'

" Pretty syntax
Plugin 'nkp/fruity-term.vim'

if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on
" All powerful backspace
set backspace=2

" enable syntax highlighting
syntax on

" Colourful terminal when supported
set t_Co=256
set background=dark
colorscheme fruity-term

" Indentation
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Line numbers
set number

" Enable the mouse in normal mode.
set mouse=n

" Display column and line numbers in the bottom right.
set ruler

" When printing, print line numbers, syntax highlighting and wrap lines.
set printoptions=paper:A4,syntax:y,wrap:y,number:y

" Only make searches case sensitive if they contain a capital letter
set smartcase
set hlsearch

" When splitting, display the new pane to the right of the existing pane for 
" vertical splits...
set splitright
" and below the existing pane for horizontal splits.
set splitbelow

" Put pastemode on a toggle.
set pastetoggle=<F2>

set colorcolumn=+1,79
" Save a keystroke, no need to hit shift.
map ;           :
" Break line at cursor.
map <c-j>       i<CR><Esc>
" Capital Y yanks to end of line.
nnoremap Y y$

" Map to visual line navigation - next line on lines that wrap.
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Bash-like command mode movement
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-j>		i<CR><Esc>

" No more blinking
set gcr=a:blinkon0

"" Mappings
" Browser style tab switching.
map <C-PageDown>    :tabnext<CR>
map <C-PageUp>    :tabprev<CR>

" Auto-commands
if has("autocmd")
    " Have Vim jump to the last position when
    " reopening a file
    autocmd VimResized * :wincmd =
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal! g'\"" | endif

    """ File type specific settings.
    " Enable spell check for text files
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
    " Enable text wrap in text files
    autocmd BufNewFile,BufRead *.txt setlocal tw=79
    " Indent 2 spaces in Javascript + CSS
    autocmd BufNewFile,BufRead *.js setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.json setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.css setlocal shiftwidth=2 tabstop=2
    " Indent 2 spaces in Haskell, HTML, Java, C, C++, and Lua.
    autocmd BufNewFile,BufRead *.html setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.hs setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.java setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.c setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.h setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.lua setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.cpp setlocal shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.h setlocal shiftwidth=2 tabstop=2
    " Disable swapfiles in encrypted files and use blowfish for encryption
    autocmd BufNewFile,BufReadPre *.enc setlocal nobackup noswapfile viminfo=|
                \ setlocal cryptmethod=blowfish 
    au FileType go nmap <Leader>e <Plug>(go-rename)
endif

" Use internationalised encoding when possible.
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

" """""" "
" Ctrl P "
" """""" "
" Exclude source control, virtualenv, images, videos, archives and compiled files
" Library ignore is an ugly hack and should be fixed so it only affects
" ~/Library.
let g:ctrlp_custom_ignore = {
    \ 'dir' : '\v[\/](\.(git|hg|svn)|env|Library)$',
    \ 'file': '\v\.(pyc|swp|so|png|jpg|jpeg|gif|avi|mp3|mp4|jar|zip|tar|gz)$',
    \}

" """""""" "
" NERDTree "
" """""""" "
"let g:NERDTreeDirArrows=0
" autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.class$']

" """"""""""""""" "
" You complete Me "
" """"""""""""""" "
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" """""" "
" Python "
" """""" "
let g:pymode_folding = 0
let ropevim_vim_completion=0
let ropevim_extended_complete=0
let ropevim_enable_shortcuts=1

" "" "
" Go "
" "" "
" let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" let g:go_fmt_fail_silently = 1
