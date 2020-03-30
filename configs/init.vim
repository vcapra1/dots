let term = $TERM

set mouse=a

" Start Pathogen
execute pathogen#infect()

" Use system clipboard
set clipboard=unnamedplus

" Vimtex
let &rtp  = '/usr/share/nvim/runtime/bundle/vimtex,' . &rtp . ',/usr/share/nvim/runtime/bundle/vimtex/after'
let g:tex_flavor = 'latex'

" Enable coloring of CUDA files
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda

" Enable line numbers
set number

" Enable undo files
set undofile
set undodir=~/.config/nvim/undodir

" Set inverted colors for visual selection
hi Visual term=reverse cterm=reverse guibg=Grey

" Cursor settings
let &t_SI = "\e[4 q"
let &t_EI = "\e[4 q"

:set guicursor=n-v-c:hor25,i-ci-ve:hor25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" Javaimp
let g:JavaImpDataDir = $HOME . ".config/nvim/javaimp"

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq=0

if term =~ 'linux'

else

endif

" rainbow parens
au FileType rkt call rainbow#load()

" Vimtex options
let g:vimtex_enable = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:LatexBox_latexmk_options = '-pdflatex="xelatex\ -synctex=1"'

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Polyglot config
let g:polyglot_disabled = ['latex', 'rust']

" Git gutter delay
set updatetime=100

" Set syntax coloring
syntax on
colorscheme onedarker

" Enable line highlighting
set cursorline

let w:airline_disabled = 1
if term =~ 'linux'
else
    " Set airline theme
    let g:airline_powerline_fonts=1
    let g:airline_theme='onedarker'

    " Enable tabline
    let g:airline#extensions#tabline#enabled=1

    let w:airline_disabled = 0
endif

" Transparency
hi Normal guibg=NONE ctermbg=NONE

" Enable OCaml Merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Tab settings: 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Why the crap do I have to do this
:autocmd Filetype ruby set softtabstop=4
:autocmd Filetype ruby set sw=4
:autocmd Filetype ruby set ts=4

