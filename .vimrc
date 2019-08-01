" ===================== Matt's vimrc =======================
"
" ==================== General Config ======================
"
"
set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
"set visualbell
set autoread
set cursorline
set laststatus=2

" Syntax
syntax on
syntax enable

" Yaml indenting
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Tabs and Spaces as Chars
set list
set listchars=tab:--
set listchars+=trail:◦

" Markdown Spell Check
autocmd BufRead,BufNewFile *.md setlocal spell

" Autosave
autocmd FocusLost * silent! wa

" =================== Turn Off Swap Files ==================
"
"
set noswapfile
set nobackup
set nowb

" ====================== Indentation =======================
"
"
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ======================== Scrolling ========================

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ======================== Plugins ==========================
"
"
call plug#begin('~/.vim/plugged')

" Look and feel
"Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'kaicataldo/material.vim'

" Code Completion
Plug 'valloric/youcompleteme'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" C
Plug 'vim-scripts/c.vim'
Plug 'wolfgangmehner/c.vim'
Plug 'pboettch/vim-cmake-syntax'

" Groovy
Plug 'rdolgushin/groovy.vim'

" Jenkins
Plug 'thanethomson/vim-jenkinsfile'

" Puppet
Plug 'rodjek/vim-puppet'

" Docker
Plug 'ekalinin/dockerfile.vim'
Plug 'docker/docker'

" Vagrant
Plug 'hashivim/vim-vagrant'

" White Space
Plug 'ntpeters/vim-better-whitespace'

" Numbers
Plug 'myusuf3/numbers.vim'

" Indents
Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'

" Git
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tpope/vim-fugitive'

" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

" TOML
Plug 'cespare/vim-toml'

" Json
Plug 'elzr/vim-json'

" Helm
Plug 'towolf/vim-helm'

" Latex
Plug 'lervag/vimtex'

call plug#end()


" ==================== Plugin Settings ======================

" ===== Vim Airline =====

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'material'


" Nerd Tree
let NERDTreeDirArrows = 1
nmap <C-n> :NERDTreeToggle<CR>
set modifiable

" Better White Space
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1

" Numbers
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" Indenting
let g:indentLine_setConceal = 2
let g:indentLine_char = '¦'
set conceallevel=1
let g:indentLine_conceallevel=2

" Ale (async lint engine)
let g:ale_completion_enabled = 1

" Material Colour Scheme
set background=dark
colorscheme material
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" ===== Vim Go =====

"" Go Imports
let g:go_fmt_command = "goimports"

"" Go Fmt
let g:go_fmt_fail_silently = 1

"" Go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

"" Metalinter
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
"" Go Def
let g:go_def_mode = 'godef'

" Tmux
if exists('$TMUX')
  let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
  let &t_EI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=0\x7\<esc>\\"
else
  let &t_SI = "\<esc>]50;CursorShape=1\x7"
  let &t_EI = "\<esc>]50;CursorShape=0\x7"
endif

hi htmlArg cterm=italic
hi Argument cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
highlight StatusLine   cterm=none ctermfg=white ctermbg=black guibg=red
highlight StatusLineNC cterm=none ctermfg=white ctermbg=black guibg=green
