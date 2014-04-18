" Leader
let mapleader = " "

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set showmode      " display current mode
set incsearch     " do incremental searching
set laststatus=2  " always display the status line
set autoread      " reload files changed outside vim
set hidden        " allow buffers to exist in the background
set backspace=indent,eol,start  "allow backspace in insert mode
set hlsearch      " highlight serached word
set ignorecase    " ignore case in search
set smartcase     " acknowledge case only when searched with capital letters
set gdefault      " substitute globally by default

"Start scrolling when we're 8 lines away from margins
set scrolloff=8

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown  setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Treat .god files as ruby files
  autocmd BufRead,BufNewFile *.god set filetype=ruby

  " Resize splits to equal width and height when window is resized
  autocmd VimResized * wincmd =

  " Remove whitespace before write
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use Ag over grep if available
if executable('ag')
 set grepprg=ag\ --nogroup\ --nocolor

 " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

 " ag is fast enough that CtrlP doesn't need to cache
 let g:ctrlp_use_caching = 0
else
  " Fall back to the custom git file search & caching method
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Color scheme
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

" Numbers
set relativenumber
set numberwidth=5

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Zero time delay when escaping from visual mode
" FIXME: line number colors changed unexpectedly
set timeoutlen=1000 ttimeoutlen=0

" Window with focus should have 80% of total height
" let &winheight = &lines * 8 / 10

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Consider _ as word boundaries
set iskeyword-=_

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" TODO: 
" tab complete 하다가  "(" 있을 때 튕기는 것
" 문단 선택 [ V ] 콤보를 한방에
" 폴더 만드는 것