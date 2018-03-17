"'filetype on
"filetype plugin on
filetype plugin indent on
"autocmd FileType c, cpp
set shiftwidth=2
set expandtab
set tabstop=2
set cindent
set number
set tabpagemax=100
set hlsearch
set visualbell


"Change color of text and turn on syntax highlighting
color desert
"color torte
"colorscheme evening
syntax on "Turn on syntax highlighting
set showmatch "show matching braces
set showmode "show current mode
"when one of the chars is typed, the matching is typed and the cursor moves left
"the line below is single quotes
"inoremap '"<Left>
"line below is double quotes
"inoremap '""<Left>
"inoremap {{}<Left>
"inoremap (()<Left>


"highlight current line on current window
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul "colorcolumn=80
  autocmd WinLeave * set nocul "colorcolumn=0
augroup END


no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>

ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

map <F5> :w<CR> :!tmux send-keys -t 0 C-a C-k "echo -e '\n\n\n\n\n'" Enter; tmux send-keys -t 0 "make" Enter; tmux select-pane -t 0; tmux send-keys -t 0 "./smallsh" <CR><CR>
map <F6> :w<CR> :!tmux send-keys -t 0 C-a C-k "echo -e '\n\n\n\n\n'" Enter; tmux send-keys -t 0 "make" Enter <CR><CR>


"Learn:
" 10j, 15j, etc
"F a: go before current location to previous 'a' on line
"gi : last edited location
"z z: move current line to middle
" z t: move current line to top
" z b: move current line to bottom
"C-e: move window up, no cursor move
" C-y: move window down, no cursor move
" C-d
" C-u
"ciw,
"ci"
"ci(
""_d, "_x, etc :using registers
"ma : set mark 'a' at current location
"   'a : go to mark 'a'
""add : paste into 'a' register
"C-r : combine with register, ", etc to paste when in insert mode
"
"gt, gT :tab navigation
"hjkl navigation
"* : on word, go to next instance */ */ */ */ */
"   # : previous instance
"C-w, arrow: move buffers
"C-w, s: split horizontal
"C-w, v: split vertical
"C-w, =: resize windows equally
":g/^baz/s/foo/bar/g  : replace foo with bar on lines starting with baz
":r !ls : paste in output of ls
":mks!  : save again
"
"caps lock : ctrl
"ctrl-[ : escape
"
"
"issues:
"C-S disables screen output when in screen
"C-Q to reenable
"
"syntastic
"nerdtree
"fugitive
"vimtutor
