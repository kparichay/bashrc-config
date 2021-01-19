"execute pathogen#infect()

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" use Vim mode instead of pure Vi, it must be the first instruction
set nocompatible
map <space> zA

" display settings
set encoding=utf-8 " encoding used for displaying file
set ruler " show the cursor position all the time
set showmatch " highlight matching braces
set showmode " show insert/replace/visual mode
set number " enable line number
set mouse=a " enable mouse usage
set tags=tags " select tags as default tags file
set wildmenu " shows availabe menu
set wrap " wordwrap visually
set magic " intend same pattern as grep
set splitright " by deafult splits to right
set cursorline

" write settings
set confirm " confirm :q in case of unsaved changes
set fileencoding=utf-8 " encoding used when saving file
set nobackup nowritebackup noswapfile " do not keep the backup~ file

" search settings
set hlsearch " highlight search results
" set ignorecase " do case insensitive search...
set incsearch " do incremental search
set smartcase " ...unless capital letters are used

" file type specific settings
filetype on " enable file type detection
filetype plugin on " load the plugins for specific file types
filetype indent on " automatically indent code

" syntax highlighting
set t_Co=256
set guifont=Ubuntu\ Mono\ 11
let g:molokai_original=1
colorscheme molokai " set color scheme, must be installed first
set background=dark " dark background for console
syntax enable " enable syntax highlighting

" characters for displaying non-printable characters
set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+

" automatic commands
if has('autocmd')
        " file type specific automatic commands

        " don't replace Tabs with spaces when editing makefiles
        autocmd Filetype makefile setlocal noexpandtab

        " disable automatic code indentation when editing TeX and XML files
        autocmd FileType tex,xml setlocal indentexpr=

        " delete empty or whitespaces-only lines at the end of file
        autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

        " replace groups of empty or whitespaces-only lines with one empty line
        autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

        " delete any trailing whitespaces
        autocmd BufWritePre * :%s/\s\+$//ge
endif

" ctrl + \ opens tag in split window
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" map alt + arrow keys to shift tabs in commandline and insert mode
" map <Esc>[1;3C :tabn<CR>
" map <Esc>[1;3D :tabp<CR>
" imap <Esc>[1;3C <Esc>:tabn<CR>i
" imap <Esc>[1;3D <Esc>:tabp<CR>i
map! <S-Insert> <MiddleMouse>

" override some highlight settings
let &colorcolumn="80,".join(range(160,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight DiffText gui=none

" edit settings
set backspace=indent,eol,start " backspacing over everything in insert mode
set expandtab " fill tabs with spaces
set nojoinspaces " no extra space after '.' when joining lines
set shiftwidth=2 " set indentation depth to 2 columns
set softtabstop=2 " backspacing over 2 spaces like over tabs
set tabstop=2 " set tabulator length to 2 columns
" set textwidth=80 " wrap lines automatically at 80th column
set laststatus=2 " always show status bar
set statusline=%f "tail of the filename
set smarttab

set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
