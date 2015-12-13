" Enable Pathogen, and let it manage itself.
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

if has('autocmd')
  filetype plugin indent on  " Turn on file type detection.
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable              " Turn on syntax highlighting.
endif

let mapleader=","            " <Leader> - Why would you pick anything else?!

" ================ General ==========================
set backspace=2              " Always allow backspace in insert mode.
set history=1000             " Keep a lot more command history.
set scrolloff=2              " Keep at least 2 lines (offset) visible above and below the cursor when scrolling.
set sidescrolloff=5          " Same as scrolloff, horizontally. For off-screen text.
set nowrap                   " Don't wrap text, extend off-screen.

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j       " When joining commented lines, delete comment chars no longer necessary.
endif

" ================ Visual ===========================
set showcmd                  " Show partial commands as they're being typed.
set showmode                 " Show visual indication of having changed modes in the statusline.
set ruler                    " Show current line and cursor position.
set relativenumber           " Relative line numbers for super fast motions (because math is hard).
set laststatus=2             " 2 == always show the status line

" Enable list mode (visual listchars, below) by default.
" While we're at it, let's improve the default listchars.
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" ================ Indentation ======================
set autoindent               " When starting a new line, infer indentation from the current line.
set smartindent              " Smart indenting when starting a new line (eg. align with opening bracket).
set expandtab                " Replace tabs with the corresponding number of spaces.
set shiftwidth=2             " Number of columns for an indent step (<<, >>, autoindent).
set shiftround               " Round indent to a multiple of `shiftwidth`.
set tabstop=2                " Number of columns a <Tab> counts for (actual, how 'big' a tab is).
set softtabstop=2            " Number of columns Vim uses when <Tab> is hit. 'Feels' like a real tab, but might be a combination of tabs and spaces.

" ================ Input ============================
" This is so that, for example, having left INSERT mode by pressing <ESC>,
" there's not a delay when doing something like SHIFT+O (in this case, to
" re-enter INSERT mode on the line above).
set ttimeout                 " Enable tweaking the ~1s wait separately for key codes and mappings.
set ttimeoutlen=100          " For key codes specifically, only wait 100ms between key presses.

" ================ Search ===========================
set incsearch                " Find the next match as we type the search.
set hlsearch                 " Highlight searches by default.
set ignorecase               " Ignore case when searching...
set smartcase                " ...unless we type a capital letter.

" In normal mode, clear hlsearch (search highlighting) with <ESC>.
" Because we're using :nohlsearch (as opposed to :set nohlsearch), the
" highlighting is automatically re-enabled on subsequent searches.
:nnoremap <silent> <esc> :nohlsearch<Return><ESC>

" ================ Buffers ==========================
set autoread                 " Reload files changed outside of Vim.
set hidden                   " Allow switching buffers with pending changes.
set nobackup                 " Don't create permanent backups for files modified.
set nowritebackup            " Don't create temporary backups while files are being modified (transactional).
set noswapfile               " Swapfiles are rarely useful and just clutter things up.

" ================ Splits ===========================
set splitright               " When :vsp, place new window to the right of the current.
set splitbelow               " When :sp, place new window below the current.

" Make moving between split windows easier.
" eg. <CTRL+W><H> ===> <CTRL+H>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" ================ Command-line Completion ==========
set wildmenu                 " When <Tab> is pressed on the command-line, show possible matches.
set wildmode=list:longest    " List all matches & complete to longest substr.

" As of Vim >= 6.0, the plugin matchit.vim is included but not enabled.
"
" matchit.vim greatly improves/extends the functionality of % to match things
" like HTML opening/closing tags, regular expressions, etc....
"
" Enable it, but only if the user hasn't installed a newer version already.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" vim:set ft=vim et sw=2:
