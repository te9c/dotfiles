" Variables: {{{

let g:rehash256 = 1

let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
" }}}

"Functions: {{{

" :function ToggleInlayHints()
" :   :if g:ycm_enable_inlay_hints = 0
" :   :   set g:ycm_enable_inlay_hints = 1;
" :   :else
" :   :   set g:ycm_enable_inlay_hints = 0;
" :   :endif
" :endfunction
function GoToLine(num)
    execute "normal" a:num."gg"
endfunction

"}}}

" Settings: {{{

syntax enable

" Cursor changing
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set encoding=utf-8
scriptencoding utf-8

"set completeopt=menuone,noinsert,noselect,popuphidden
"set completepopup=highlight:Pmenu,border:off

" set wfh
" set wfw
set autoindent
set smartindent
set confirm
set belloff=all
set foldmethod=indent
set title
set nocompatible
set number
set cursorline
set backspace=indent,eol,start
set smartcase
set nowrap
set incsearch
set showmatch
set hlsearch
set showcmd
set showmode
set history=500
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set list
set listchars=trail:·
set noshowmode
set signcolumn=yes
set autochdir

set wildmenu
"set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set updatetime=750
set laststatus=2
"}}}

" Mappings: {{{

nnoremap <C-s> :w<CR>
" nnoremap <C-A-q> :q<CR>

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
" nnoremap <silent> <C-f> :NERDTreeFind<CR>

nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-q> :bd<cr>
nnoremap <silent> U :tabp<cr>
nnoremap <silent> I :tabn<cr>

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" cnoremap <expr> <C-h> <C-w>h
" cnoremap <expr> <C-j> <C-w>j
" cnoremap <expr> <C-k> <C-w>k
" cnoremap <expr> <C-l> <C-w>l

" nnoremap <silent> <A-t> :terminal<cr>vsdevcmd<cr><C-w>N<C-w>J15<C-w>_:set wfh<cr>:set wfw<cr>i

nnoremap <leader>vr :tabedit ~/.vimrc<cr>

" YouCompleteMe navigation
nnoremap yr :YcmCompleter RefactorRename 
nnoremap <silent> <C-a> :YcmCompleter FixIt<cr>
nnoremap <silent> Y :YcmCompleter 
nnoremap <silent> dia :YcmDiags<cr>
nnoremap <silent> gd :YcmCompleter GoToDefinition<cr>
nnoremap <silent> gD :YcmCompleter GoToDeclaration<cr>
nnoremap <silent> gr :YcmCompleter GoToReferences<cr>
nnoremap <silent> gt :YcmCompleter GetType<cr>
nnoremap <silent> <C-i> <Plug>(YCMToggleInlayHints) 
nnoremap <silent> fw <Plug>(YCMFindSymbolInWorkspace)

" Cmake4vim is working very bad at the moment 04/11/2022
" And vim-cmake doesnt support vim under windows.
" nnoremap <silent> cmm :CMake<cr>
" nnoremap <silent> cmr :CMakeRun<cr>
" nnoremap <silent> cmb :CMakeBuild<cr>
" nnoremap <silent> cmt :CMakeSelectTarget<cr>
" nnoremap <silent> cmf :FZFCMakeSelectTarget<cr>

nnoremap fzf :Files<cr>

" copy all lines in windows buffer
nnoremap cpa :let b:lastline = line(".")<cr>ggvG$"*y:call GoToLine(b:lastline)<cr>

" copy/paste in windows clipboard
" nnoremap <A-P> "*p
" inoremap <A-P> "*p
" vnoremap <A-Y> "*y

nnoremap o o<esc>
nnoremap O O<esc>
nnoremap <space> :
inoremap jj <esc>
xnoremap <silent> x "_d
nnoremap <silent> x "_x
"}}}

" Plugins: {{{
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    Plug 'OmniSharp/omnisharp-vim'

    Plug 'jiangmiao/auto-pairs'

    " Vim FZF integration, used as OmniSharp selector
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Autocompletion
    Plug 'ycm-core/YouCompleteMe'

    " Statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Colorshemes
    Plug 'rafi/awesome-vim-colorschemes'
    " Plug 'sainnhe/everforest'

    " Icons
    Plug 'ryanoasis/vim-devicons'
    Plug 'lambdalisue/nerdfont.vim'

    " Start screen
    " Plug 'mhinz/vim-startify'

    " Comments
    Plug 'tpope/vim-commentary'

    " Build integration
    Plug 'cdelledonne/vim-cmake'
    " Plug 'ilyachur/cmake4vim'
    " Plug 'tpope/vim-dispatch'

    " Debugger
    " Plug 'puremourning/vimspector'

    " File templates
    Plug 'tibabit/vim-templates'

    " Snippets
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'ervandew/supertab'

    "Git integration
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    "Markdown Preview
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()
"}}}

" GUI settings: {{{

    " set t_Co=256

    set termguicolors

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    " colorscheme molokai 
    colorscheme gruvbox

    " Set a custom font you have installed on your computer.
    set guifont=Hack_NFM:h12:cANSI:qDRAFT

if has('gui_running')

    " Use console dialogs instead of popup dialogs for simple choices
    set guioptions+=c

    " Disable gui tabline
    set guioptions-=e

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the right-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Enable toolBar when pressing F4
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar><CR>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>
endif
"}}}

" NERDTree: {{{
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
let NERDTreeMininmalUI=1
let NERDTreeShowHidden=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
"}}}

" Airline: {{{
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'
let g:airline_theme='gruvbox'
"}}}

" YouCompleteMe: {{{

" let g:ycm_error_symbol = '•'
" let g:ycm_warning_symbol = '·'

let g:ycm_semantic_triggers =  {
  \   'c,cpp,objc,cs': [ 're!\w{3}', '_' ],
  \ }


let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_enable_semantic_highlighting= 1

let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"

" let g:ycm_enable_inlay_hints = 1
let g:ycm_clear_inlay_hints_in_insert_mode = 1

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" }}}

" FZF: {{{
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '/home/flosg/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
" }}}

" " Vimspector: {{{

" " let g:vimspector_base_dir='C:\Users\flosg\vimfiles\plugged\vimspector'
" let g:vimspector_enable_mappings = 'HUMAN'

" let g:tmpl_auto_initialize = 0

" " }}}

" Snippets: {{{
let g:UltiSnipsExpandTrigger = "<s-tab>"
let g:UltiSnipsJumpForwardTrigger = "<s-tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-tab>"

let g:UltiSnipsEditSplit="vertical"

" }}}

" Autocmd: {{{

autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR><cr>
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR><cr>
autocmd filetype cpp nnoremap <S-F5> :w <bar> exec '!g++ -std=c++20 '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR><cr>
autocmd filetype cpp nnoremap <A-b> :w <bar> :silent exec '!/B g++ -std=c++20 '.shellescape('%').' -o '.shellescape('%:r').''<cr><cr>
" autocmd filetype cpp :terminal<cr>vsdevcmd<cr><C-w>N<C-w>J10<C-w>_<C-k><C-n><C-l>
autocmd BufRead /home/flosg/.vimrc  setlocal foldmethod=marker

"}}}
