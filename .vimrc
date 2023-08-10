set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
"Plugin 'nvie/vim-flake8' 
Plugin 'vim-scripts/indentpython.vim'
Plugin 'preservim/nerdtree'
Plugin 'PhilRunninger/nerdtree-visual-selection'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/emmet-vim'
Plugin 'mru.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
"Git related plugins 
Plugin 'tpope/vim-fugitive'
"paranthesse,brackets options and  jump out"
Plugin 'delimitMate.vim' 
"google code format plugin
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
"Theme
Plugin 'dracula/vim'
"LATEX 
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
"FZF
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Javascipt
Plugin 'pangloss/vim-javascript'

" add all your plugins here (note older versions of Vundle
"used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"


filetype plugin indent on    " required
set termbidi
syntax on

"html formatting
filetype indent on
set filetype=html          
set smartindent       

set number
set showmatch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc
set noerrorbells
set encoding=utf-8
set foldmethod=indent
set foldlevel=99
set backspace=indent,eol,start
se mouse+=a
set clipboard=unnamedplus
set modifiable 
"Automatic close preview window after autocomplete 
autocmd CompleteDone * pclose

"enabling auto format for google code formater 
augroup autoformat_settings
	autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
	autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType css,sass,scss,less,json,javascript,vue AutoFormatBuffer prettier
	autocmd FileType java AutoFormatBuffer google-java-format
	autocmd FileType python AutoFormatBuffer autopep8
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	autocmd FileType rust AutoFormatBuffer rustfmt
augroup END


"Theme config
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" Nerd commenter 
let g:NERDToggleCheckAllLines = 1

"Save with ctrl+s  
"nnoremap <c-s> :w<cr>
nnoremap <c-s> :w<cr>
inoremap <c-s> <Esc>:w<CR><Esc>

nnoremap <c-x> :x<cr>
inoremap <c-x> <Esc>:x<CR>a


"Status bar 
set laststatus=2
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" Auto save
autocmd CursorHold,CursorHoldI * update

" ----------Rename Variable---------
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>


"----------------NERDTREE CONFIGS-----------------
"Nerdtree toggle view (open and close)
nmap <tab> :NERDTreeToggle<CR>


"---------------- MAP NAVIGATIONS---------------------
"map alt + arrows
nnoremap <Esc>[1;3C <C-w>l
nnoremap <Esc>[1;3D <C-w>h
nnoremap <Esc>[1;3A <C-w>k
nnoremap <Esc>[1;3B <C-w>j
"nap ctrl+w to close
noremap <c-w> :q <CR>
"map page up and page down to move between tabs
nnoremap <PageUp> gT
nnoremap <PageDown> gt
"arrange tabs
nmap <C-PageUp>   :tabmove -1<cr>
nmap <C-PageDown> :tabmove +1<cr>

"-------------------Python settings-------------------------
au BufNewFile,BufRead *.py
			\set tabstop=4
			\set softtabstop=4
			\set shiftwidth=4
			\set textwidth=79
			\set expandtab
			\set autoindent
			\set fileformat=unix
let python_highlight_all=1


au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=darkred

"---------------------JAVASCRIPT settings---------------------------
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=0 expandtab

"---------Syntastic configs-----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["flake8", "pyflakes"]
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
"------------FZF-----------
nnoremap <C-e> :Files<Enter>


"--------DOCKER-------------
autocmd BufNewFile,BufRead *ockerfile.*,*.*ockerfile :set filetype=dockerfile

"-------YCM------------
nnoremap f :tab split \| YcmCompleter GoToDefinition<CR>
nnoremap t :YcmCompleter GetDoc<CR>
nnoremap t :YcmCompleter GetDoc<CR>
let g:ycm_enable_inlay_hints=1
map <Esc>l :lopen <CR> 

"------Emoji------
" Use emoji-fzf and fzf to fuzzy-search for emoji, and insert the result
function! InsertEmoji(emoji)
    let @a = system('cut -d " " -f 1 | emoji-fzf get', a:emoji)
    normal! "agP
endfunction

command! -bang Emoj
  \ call fzf#run({
      \ 'source': 'emoji-fzf preview',
      \ 'options': '--preview ''emoji-fzf get --name {1}''',
      \ 'sink': function('InsertEmoji')
      \ })
" Ctrl-e in normal and insert mode will open the emoji picker.
" Unfortunately doesn't bring you back to insert mode 😕
map <C-n> :Emoj<CR>
imap <C-n> <C-o><C-e>
