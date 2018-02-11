" ========================================
" General vim sanity improvements
" ========================================

" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap <leader>yw yiww

" <leader>ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap <leader>ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$

"Go to last edit location with <leader>.
nnoremap <leader>. '.

"Move back and forth through previous and next buffers
"with <leader>z and <leader>x
nnoremap <silent> <leader>z :bp<CR>
nnoremap <silent> <leader>x :bn<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" create <%= foo %> erb tags using Ctrl-k in edit mode
" imap <silent> <C-K> <%=  %><Esc>2hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
" imap <silent> <C-J> <%  %><Esc>2hi

" ============================
" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent> <leader>cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nnoremap <silent> // :nohlsearch<CR>

"Double tapping // is often tedious
autocmd InsertEnter * set nohlsearch
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?

" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" Commonly opened vim config files
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>vb :e ~/dotfiles/vimrc.bundles<CR>
nnoremap <leader>vk :e ~/dotfiles/vim/plugin/settings/keymap.vim<CR>

" Could use instead of <ESC>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <Esc> <nop>

cnoremap jk <Esc>
cnoremap kj <Esc>

" Saving should be easier
nnoremap <silent> <leader><CR> :w<CR>

" Index ctags from any project, including those outside Rails
nnoremap <leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <silent> Q :q<CR>

" Easier system clipboard copy/paste
vnoremap <silent> <leader>y "*y
vnoremap <silent> <leader>p :r !pbpaste<CR>

" Open the current GEM_PATH with lusty explorer
nnoremap <leader>lg :LustyFilesystemExplorer ~/.rbenv/versions/1.9.3-p392-railsexpress/lib/ruby/gems/1.9.1/gems<CR>

" Make Vim's command line behave like Emacs
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" Easier paste toggle keybinding
set pastetoggle=<F2>

" Easier beginning/end of line movement
nnoremap H ^
nnoremap L $

" Clone current window to the other pane
nnoremap <C-c><C-c> <C-w>o<C-w>v
