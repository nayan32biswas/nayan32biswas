# VIM

## File Action

- `:q` exit
- `:w` save
- `:wq` save and exit
- `:q!` Fource exit without save

## Insert

- `i` Inserts text before current cursor location.
- `I` Inserts text at beginning of current line.
- `o` Creates a new line for text entry below cursor location.
- `O` Creates a new line for text entry above cursor location.
- `a` Inserts text after current cursor location.
- `A` Inserts text at end of current line.
- `a` Inserts text after current cursor location.
- `a` Inserts text after current cursor location.
- `r` Replace single character under the cursor with the next character typed.
- `R` Replaces text from the cursor to right.
- `s` Replaces single character under the cursor with any number of characters.
- `S` Replaces entire line.

## Coursor Move

- `h` Moves the cursor left charecter.
- `H` Move to top of screen.
- `<n>H` Moves to nth line from the top of the screen.
- `:<n>` Moves to nth line from the top of the screen.
- `j` Moves the cursor down one line.
- `k` Moves the cursor upper one line.
- `l` Moves the cursor right charecter.
- `L` Move to bottom of screen.
- `<n>L` Moves to nth line from the bottom of the screen.
- `0 or | or ^` Positions cursor at beginning of line.
- `$` Positions cursor at end of line.
- `w` Positions cursor to the next word.
- `W` Positions cursor to the next word with all charecter.
- `b` Positions cursor to previous word.
- `B` Positions cursor to previous word with all charecter.
- `(` Positions cursor to beginning of current sentence.
- `)` Positions cursor to beginning of next sentence.
- `CTRL+d` Move forward 1/2 screen.
- `CTRL+f` Move forward one full screen.
- `CTRL+u` Move backward 1/2 screen.
- `CTRL+b` Move backward one full screen.
- `CTRL+e` Moves screen up one line.
- `CTRL+y` Moves screen down one line.
- `CTRL+u` Moves screen up 1/2 page.
- `CTRL+d` Moves screen down 1/2 page.
- `CTRL+b` Moves screen up one page.
- `CTRL+f` Moves screen down one page.
- `CTRL+I` Redraws screen.

## Delete

- `x` delete currect charecter.
- `X` delete previous charecter.
- `dd` delete line
- `d<*>` Here you can delete base on cursore move example `dB` will delete previous word.

## Copy Past

- `Yy` Copies the current line.
- `9yy` Yank current line and 9 lines below.
- `p` Puts the copied text after the cursor.
- `P` Puts the yanked text before the cursor.

## Search and Replace

- `/matched_pattern` Press n to find next match.
- `:s/matched_pattern` Show **next** matched_pattern
- `:s/matched_pattern/new_text` This will replace **next** matched_pattern with next_text
- `:%s/matched_pattern/new_text` This will replace **first matched_pattern of all sentence** matched_pattern with next_text
- `:%s/matched_pattern/new_text/g` This will replace **all** matched_pattern with next_text. Here **g** for global


## Setup

- `sudo apt install vim-gtk3` Advance version
### Setup vim config at **~/.vimrc**
```bash

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


set number
set tabstop=4
```