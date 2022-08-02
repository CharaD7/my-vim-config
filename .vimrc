" .vimrc
" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let mapleader = ' '
let g:mapleader = ','

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Synstastic loading
" execute pathogen#infect()

" ---- PLUGINS ----------------------------------------------------------------
"
" https://github.com/junegunn/vim-plug
" install plugins with :PlugInstall
" clean unused plugins :PlugClean
"
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-projectionist' "{{{
    " Provides granular project configuration using 'Projections'
  "}}}

  Plug 'Valloric/ListToggle' "{{{
    " Toggles the display of the QuickFix and the Location list
    " Mappings:
    let g:lt_location_list_toggle_map = '<leader>tl'
    let g:lt_quickfix_list_toggle_map = '<leader>tq'
    " <leader>tl for toggling the Location List
    " <leader>q for toggling the QuickFix
  "}}}

  Plug 'valloric/MatchTagAlways' "{{{
  " Always highlights the enclosing HTML/XML tags
    let g:mta_filetypes = {
          \ 'javascript.jsx' : 1,
          \ 'erb' : 1
          \}
  "}}}

  " Navigation     {{{
  "------------------+
  Plug 'liuchengxu/vista.vim' "{{{
    " Tag and LSP symbols viewer
  "}}}

  Plug 'SirVer/ultisnips' "{{{
    " The Ultimate snippet solution for Vim
    let g:UltiSnipsExpandTrigger='<c-s>'
    let g:UltiSnipsJumpForwardTrigger='<c-s>n'
    let g:UltiSnipsJumpBackwardTrigger='<c-s>p'
  "}}}

  Plug 'honza/vim-snippets' "{{{
    " A community-maintained snippet repository for several languages and
    " frameworks
  "}}}

  Plug 'dsznajder/vscode-es7-javascript-react-snippets' "{{{
  " Snippets for react
  "}}}

  Plug 'epilande/vim-es2015-snippets' "{{{
    " Snippets for ES2015
  "}}}

  Plug 'epilande/vim-react-snippets' "{{{
    " Snippets for React
  "}}}
  Plug 'lifepillar/vim-gruvbox8'      " color scheme
  Plug 'tpope/vim-fugitive'   " git integration
  Plug 'lyuts/vim-rtags'      " C++
  Plug 'mbbill/undotree'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'dense-analysis/ale' " for linting
  " Plug 'zxqfl/tabnine-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
  " Config to support C#
  Plug 'OmniSharp/omnisharp-vim'
  "--------------------------------------------------------------"
  Plug 'frazrepo/vim-rainbow'
  Plug 'tpope/vim-commentary'
  Plug 'vim-scripts/vim-gitgutter'
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'doy/vim-foldtext' " folding
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-projectionist'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-surround'

  "   	FILE TYPES	            "
  "-----------------------------"
  Plug 'git@github.com:jelera/vim-javascript-syntax.git', { 'for': 'javascript' }
  Plug 'leafgarland/typescript-vim' " TypeScript syntax
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  Plug 'jparise/vim-graphql'        " GraphQL syntax
  Plug 'mattn/emmet-vim'
  Plug 'othree/html5.vim'
  Plug 'vim-python/python-syntax'
  " MARKDOWN
  Plug 'tpope/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
  " Python ---------------{{{
  Plug 'vim-python/python-syntax'
      let g:python_highlight_all = 1
  "}}}
  " Use release branch (recommend)
  Plug 'Yggdroot/indentLine' "{{{
    " It displays the indentation level with thin vertical lines
    let g:indentLine_char_list = ['┊']
    let g:indentLine_enabled = 1
  "}}}
  Plug 'tpope/vim-unimpaired'
  "------------------+
  " Git {{{
  "------------------+
  Plug 'tpope/vim-fugitive' "{{{
    " Provides a nice interface and extra commands for Git
    augroup Fugitive
      autocmd!
      autocmd FileType fugitive setl nonumber
      autocmd FileType gitcommit setl nonumber
      autocmd FileType gitcommit setl spell
      autocmd FileType gitcommit setl formatoptions+=tn formatoptions-=l
      autocmd FileType gitcommit setl colorcolumn=72 textwidth=72

      if executable('par')
        autocmd FileType gitcommit setl formatprg=par\ -w72
      endif
    augroup END
  "}}}

  Plug 'tpope/vim-rhubarb' "{{{
    " Adds :Gbrowse for opening in Github
  "}}}

  Plug 'rhysd/committia.vim' "{{{
    " Provides a more pleasant editing on Git commit messages
  "}}}

  Plug 'rhysd/git-messenger.vim'
  Plug 'rhysd/conflict-marker.vim'
  Plug 'knsh14/vim-github-link'

  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'rhysd/github-complete.vim'
      augroup config-github-complete
          autocmd!
          autocmd FileType gitcommit setl omnifunc=github_complete#complete
      augroup END
  "}}}

  "------------------+
  " Text helpers   {{{
  "------------------+
  Plug 'vim-scripts/matchit.zip' "{{{
    " Extends the existing functionality of the % command, matching also
    " parentheses, square and curly brackets, as well as conditional statements.
  "}}}

  Plug 'tmux-plugins/vim-tmux-focus-events' "{{{
    " FocusGained and FocusLost autocommand events are not working in terminal vim. This plugin restores them when using vim inside Tmux.

    " Here's where that matters:

    " vim-fugitive plugin uses FocusGained for refreshing git branch in status line
    " vim-gitgutter uses FocusGained for refreshing ... (wait for it) git gutter
    " vim-tmux-clipboard uses FocusGained and FocusLost for refreshing clipboard.
  "}}}
"}}}

  Plug 'christoomey/vim-tmux-navigator' "{{{
    " Seemless navigation between tmux panes and vim splits
  "}}}

  Plug 'SirVer/ultisnips'
  Plug 'dsznajder/vscode-es7-javascript-react-snippets'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Plug 'valloric/youcompleteme'
  Plug 'tmsvg/pear-tree' " For pairing tags and parentheses
  " Debugger plugins"
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " NERDTree Plugins
  " ================================================================================================
  " Adds syntax highlighting to NERDTree based on filetype
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Saves and restores the state of the NERDTree between sessions
  " Plug 'scrooloose/nerdtree-project-plugin'
  " Highlights open files in a different color, Closes a buffer directly from NERDTree
  Plug 'PhilRunninger/nerdtree-buffer-ops'
  " Enables NERDTree to open, delete, move, or copy multiple Visually-selected files at once
  Plug 'PhilRunninger/nerdtree-visual-selection'
  " Adds filetype-specific icons to NERDTree files and folders
  Plug 'ryanoasis/vim-devicons'
  " Airline (status bar on the bottom)
  Plug 'vim-airline/vim-airline' "{{{
    " Lean and mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline-themes'
    " Themes for airline
    let g:airline_mode_map = {
          \ '__'     : '-',
          \ 'c'      : 'C',
          \ 'i'      : 'Ins',
          \ 'ic'     : 'Ins',
          \ 'ix'     : 'Ins',
          \ 'n'      : 'Nrm',
          \ 'multi'  : 'M',
          \ 'ni'     : 'N',
          \ 'no'     : 'N',
          \ 'R'      : 'R',
          \ 'Rv'     : 'R',
          \ 's'      : 'S',
          \ 'S'      : 'S',
          \ ''       : 'S',
          \ 't'      : 'T',
          \ 'v'      : 'Visual',
          \ 'V'      : 'Visual',
          \ 'VBlock'       : 'Visual Blk',
          \ }
    let g:airline_powerline_fonts = 1
    let g:airline_skip_empty_sections = 1
    let g:airline#extensions#branch#format = 2
    let g:airline_theme = 'luna'
    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = '◀'
    " let g:airline_symbols.crypt = '🔒'
    " let g:airline_symbols.linenr = '␊'
    " let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.maxlinenr = '☰'
    " let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    " let g:airline_symbols.spell = 'Ꞩ'
    " let g:airline_symbols.notexists = '∄'
    " let g:airline_symbols.whitespace = 'Ξ'
    let g:airline#extensions#ale#enabled = 1
    let airline#extensions#ale#error_symbol = '❗ '
    let airline#extensions#ale#warning_symbol = '⚠️  '
    let airline#extensions#ale#open_lnum_symbol = " [\uE0A1 "
    let airline#extensions#ale#close_lnum_symbol = '] '
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline#extensions#coc#enabled = 1
    let g:airline#extensions#languageclient#enabled = 1
  "}}}
  " REACH support "{{{
  "
  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  ""}}}
  Plug 'frazrepo/vim-rainbow' " Rainbow parenthesis
  Plug 'mtth/scratch.vim' "For taking notes (Uses 'gs' to invoke command)
call plug#end()

" ============================================================================
" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif
" ============================================================================

filetype plugin indent on " Required!

set mouse-=a               " disable custom mouse in vim (so that we can select)
set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h12
syntax on                   " syntax highlighting
set nomodeline
set updatetime=300
set signcolumn=yes
set shortmess+=c
set encoding=utf-8
set iskeyword+=_,$,@,%,#
" hides buffers instead of closing them. This means that you can have unwritten
" changes to a file and open a new file using :e, without being forced to write
" or undo your changes first
"set hidden
set title
set visualbell
set noerrorbells            " no sounds
set tabstop=2               " size of tabs   (set ts=2 also works)
set shiftwidth=2            " indent using '>' uses 2 spaces
set softtabstop=2
set expandtab               " tabs => spaces
set smartindent
set autoindent
set cindent
" For characters that forms pairs for using % commands, this is for HTML Tags
set matchpairs+=<:>
" Set to autoread when a file is changed from the outside
set autoread
" Hide the mouse cursor when typing
set mousehide
" Reports always the amount of changed lines
set report=0
" marks: 1000 files, history lines: 1000 lines, search queries: 1000 patterns, registers: 1000
set viminfo='1000,f1,:1000,/1000,<1000,s100
" Swap directory to store temporary files
set directory=$HOME/.vimfiles/swapfiles,/var/tmp,/tmp,.
set nocompatible           " useless
set history=1000
set undolevels=1000
set confirm
set shiftround
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set fileformat=unix " default format
" Read unix,mac,dos formatted files
set fileformats=unix,mac,dos
set number                  " line numbers (set nu)
set relativenumber
set nowrap                  " no wrapping of long lines
" Width value of the Line Number Column
set numberwidth=4
set ruler
set t_u7=
" Shows matching brackets when text indicator is over them
set showmatch
set noswapfile
set nobackup                " because undodir/undofile
" Backspace will delete EOL chars, as well as indents
" set backspace=indent,eol,start
"------------------------------------+
" Undo Directory and files         {{{
"------------------------------------+
set undodir=$HOME/.vim/.cache/undo
set timeoutlen=300
set undofile
set undolevels=999
set hlsearch                " highlight search terms
set incsearch               " incremental search
set ignorecase
set smartcase               " ignore case if search pattern is all lowercase,
                            " case-sensitive otherwise
set cmdheight=2             " more space for displaying msgs
"}}}
"------------------------------------+
" Wild menu (Autocompletion)       {{{
"------------------------------------+
set wildmenu
set laststatus=2
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp
set wildmode=full
" when scrolling, keep cursor 10 lines away from screen border
set scrolloff=10
set sidescrolloff=20
" The screen won't be redrawn unless actions took place
set lazyredraw
" Improves smoothness of redrawing when there are multiple windows and the
" terminal does not support a scrolling region
set ttyfast
" When moving thru the lines, the cursor will try to stay in the previous columns
set nostartofline
" set completeopt=menu,menuone,longest
set completeopt=menu,menuone,preview,noselect,noinsert
"}}}
"----------------------------------------------------------------------------//
" FOLDING                                                                   {{{
"----------------------------------------------------------------------------//
set foldenable
set foldmethod=marker
" set foldlevel=99
set foldcolumn=0
set foldtext=FoldText()

function! FoldText(...) "{{{
  " This function uses code from doy's vim-foldtext:
  " https://github.com/doy/vim-foldtext
  "}}}
  " Prepare fold variables {{{

  " Use function argument as line text if provided
  let l:line = a:0 > 0 ? a:1 : getline(v:foldstart)
  let l:line_count = v:foldend - v:foldstart + 1
  let l:indent = repeat(' ', indent(v:foldstart))
  let l:w_win = winwidth(0)
  let l:w_num = getwinvar(0, '&number') * getwinvar(0, '&numberwidth')
  let l:w_fold = getwinvar(0, '&foldcolumn')
  " }}}

  " Handle other foldmethods {{{
  let l:text = l:line
   " Center-align the foldtext
   return repeat('=', (l:w_win - strchars(l:text) - l:w_num - l:w_fold) / 2) . l:text
  endif
  " }}}

  " Handle other foldmethods {{{
  let l:text = l:line

  " Remove foldmarkers {{{
  let l:foldmarkers = split(&foldmarker, ',')
  let l:text = substitute(l:text, '\V' . l:foldmarkers[0] . '\%(\d\+\)\?\s\*', '', '')
  " }}}

  " Remove comments {{{
  let l:comment = split(&commentstring, '%s')
  if l:comment[0] !=? ''
    let l:comment_begin = l:comment[0]
    let l:comment_end = ''
    if len(l:comment) > 1
      let l:comment_end = l:comment[1]
    endif
    let l:pattern = '\V' . l:comment_begin . '\s\*' . l:comment_end . '\s\*\$'
    if l:text =~ l:pattern
      let l:text = substitute(l:text, l:pattern, ' ', '')
    else
      let l:text = substitute(l:text, '.*\V' . l:comment_begin, ' ', '')
      if l:comment_end !=? ''
        let l:text = substitute(l:text, '\V' . l:comment_end, ' ', '')
      endif
    endif
  endif
  " }}}

  " Remove preceding non-word characters {{{
  let l:text = substitute(l:text, '^\W*', '', '')
  " }}}

  " Remove surrounding whitespace {{{
  let l:text = substitute(l:text, '^\s*\(.\{-}\)\s*$', '\1', '')
  " }}}

  " Make unmatched block delimiters prettier {{{
  let l:text = substitute(l:text, '([^)]*$',   '( ... )', '')
  let l:text = substitute(l:text, '{[^}]*$',   '{ ... }', '')
  let l:text = substitute(l:text, '\[[^\]]*$', '[ ... ]', '')
  " }}}

  " Add arrows when indent level > 2 spaces {{{
  if indent(v:foldstart) > 2
    let l:cline = substitute(l:line, '^\s*\(.\{-}\)\s*$', '\1', '')
    let l:clen = strlen(matchstr(l:cline, '^\W*'))
    let l:indent = repeat(' ', indent(v:foldstart) - 2)
    let l:text = '▪︎' . l:text
  endif
  " }}}

  " Prepare fold text {{{
  let l:fnum = printf(' [ Lines: %s ]           ', l:line_count)
  let l:ftext = printf('‣  %s%s ', l:indent, l:text)
" }}}

  return l:ftext . repeat(' ', l:w_win - strchars(l:fnum) - strchars(l:ftext) - l:w_num - l:w_fold) . l:fnum . ' '

  " }}}

endfunction "}}}
"}}}

" colours/theme
set background=dark
" use 256 colors when possible
if has('gui_running') || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || (&term =~? 'mlterm\|fbterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme gruvbox8_hard
else
    colorscheme delek       "tres moche
endif
set cursorline              " highlight the line of the cursor
set showcmd
set pumheight=15
set diffopt+=context:3
set linebreak " Maintain the whole word when wrapping

" Highlight conflict markers"
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" Shortcut to jump to next conflict marker"
nmap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>
" Highlight problematic whitespace (spaces before tabs)
hi RedundantSpaces ctermfg=214 ctermbg=160 cterm=bold guifg=red gui=bold
match RedundantSpaces / \+\ze\t/

"Mark Tabs not used for indentation in Code"
match errorMsg /[^\t]\zs\t+/

let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

hi  Comment  cterm=italic
hi  gitcommitFirstLine ctermfg=81
hi  gitcommitSummary ctermfg=81
hi  RubyKeywordAsMethod ctermfg=44

let g:closetag_filetypes = 'html,tsx,xhtml,erb,jsx,html.erb,eruby'
let g:mta_filetypes = {
      \ 'javascript.jsx' : 1,
      \ 'erb' : 1
     \}

let g:user_emmet_leader_key='<C-Tab>'
let g:python_highlight_all = 1

nnoremap <silent> <S-p> :GFiles<Return>
nnoremap <silent> <S-b> :Buffers<Return>
nnoremap <silent> <S-h> :History<Return>
nnoremap <silent> <Leader>ag :Rg <C-R><C-W><CR>
" Ripgrep support with FZF
nnoremap <silent> \ :Rg<CR>
let g:fzf_layout = { 'window': { 'width': 1.9, 'height': 0.6 } }
let g:fzf_layout = { 'down' : '~40%' }

" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
endfunction

let g:fzf_action = {
     \ 'ctrl-q': function('s:build_quickfix_list'),
     \ 'ctrl-t': 'tab split',
     \ 'ctrl-x': 'split',
     \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <space> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <space> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <c-space> coc#refresh()
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>ft  <Plug>(coc-format-selected)
nmap <leader>ft  <Plug>(coc-format-selected)

nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>



"Coc mappings
nmap <leader>f [fzf-p]
xmap <leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }


" floating window size ratio
let g:fzf_preview_floating_window_rate = 0.9

" fzf window position settings
let g:fzf_preview_direct_window_option = ''

" fzf command default options
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }

" Add fzf quit mapping
let g:fzf_preview_quit_map = 1

" jump to the buffers by default, when possible
let g:fzf_preview_buffers_jump = 0

" Commands used for fzf preview.
" The file name selected by fzf becomes {}
" let g:fzf_preview_command = 'cat'                               " Not installed bat
let g:fzf_preview_command = 'bat --color=always --plain {-1}' " Installed bat

" g:fzf_binary_preview_command is executed if this command succeeds, and g:fzf_preview_command is executed if it fails
let g:fzf_preview_if_binary_command = '[[ "$(file --mime {})" =~ binary ]]'

" Commands used for binary file
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'

" Commands used to get the file list from project
" let g:fzf_preview_filelist_command = 'git ls-files --exclude-standard'               " Not Installed ripgrep
let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep

" Commands used to get the file list from git repository
let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'

" Commands used to get the file list from current directory
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'

" Commands used to get the git status file list
let g:fzf_preview_git_status_command = 'git -c color.status=always status --short --untracked-files=all'

" Commands used for git status preview.
let g:fzf_preview_git_status_preview_command =  "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} || " .
\ "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} || " .
\ g:fzf_preview_command

" Commands used for project grep
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never'

" MRU and MRW cache directory
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')

" If this value is not 0, disable mru and mrw
let g:fzf_preview_disable_mru = 0

" Limit of the number of files to be saved by mru
let g:fzf_preview_mru_limit = 1000

" Commands used for current file lines
" let g:fzf_preview_lines_command = 'cat -n'                                " Not Installed bat
let g:fzf_preview_lines_command = 'bat --color=always --plain --number' " Installed bat

" Commands used for preview of the grep result
let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h:h') . '/bin/preview_fzf_grep'

" Cache directory for mru and mrw
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')

" Keyboard shortcuts while fzf preview is active
let g:fzf_preview_preview_key_bindings = ''
" let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'

" Specify the color of fzf
let g:fzf_preview_fzf_color_option = ''

" Set the processes when selecting an element with fzf
let g:fzf_preview_custom_processes = {}
" For example, set split to ctrl-s
" let g:fzf_preview_custom_processes['open-file'] = fzf_preview#remote#process#get_default_processes('open-file')
" on coc extensions
" let g:fzf_preview_custom_processes['open-file'] = fzf_preview#remote#process#get_default_processes('open-file', 'coc')
" let g:fzf_preview_custom_processes['open-file']['ctrl-s'] = g:fzf_preview_custom_processes['open-file']['ctrl-x']
" call remove(g:fzf_preview_custom_processes['open-file'], 'ctrl-x')

" Use as fzf preview-window option
let g:fzf_preview_fzf_preview_window_option = ''
" let g:fzf_preview_fzf_preview_window_option = 'up:30%'

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1

" Use fzf history option
" let g:fzf_preview_history_dir = false
let g:fzf_preview_history_dir = '~/.fzf'

" devicons character width
let g:fzf_preview_dev_icon_prefix_string_length = 3

" Devicons can make fzf-preview slow when the number of results is high
" By default icons are disable when number of results is higher that 5000
let g:fzf_preview_dev_icons_limit = 5000

" The theme used in the bat preview
let g:fzf_preview_preview_bat_theme = 'ansi'


" Example: Exclude filename with FzfPreviewProjectGrep
nnoremap <leader>g :<C-u>FzfPreviewProjectGrep --add-fzf-arg=--nth=3<Space>
" nnoremap <Leader>g :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--nth=3<Space>

" Example: Reuse last query for project grep.
nnoremap <leader>G :<C-u>FzfPreviewProjectGrep . --resume<Space>
" nnoremap <Leader>G :<C-u>CocCommand fzf-preview.ProjectGrep . --resume<Space>

" Setting the shell
set shell=tmux
set suffixesadd=.js,.es,.jsx,.json,.tsx,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType apache set commentstring=#\ %s

" Emmet Configuration
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_leader_key='<C-Tab>'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_<filetype>_checkers = ['<checker-name>']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']
let g:syntastic_aggregate_errors = 1
let g:syntastic_ruby_mri_args = "--my --args --here"
let g:syntastic_always_populate_loc_list = 1


" NERDTree trigger
map <C-e> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <S-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

nnoremap <leader>t :terminal<CR>

" Experimental {
" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
" }


" Customizing Indentlines
let g:indentLine_setColors = 1
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1
let g:indentLine_char = '\u206'

" Use the stdio version of OmniSharp-roslyn - this is the default
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'    " Use fzf
let g:OmniSharp_selector_findusages = 'fzf'
" let g:OmniSharp_popup_mappings.close = '<Esc>'
" Configuring popup options
let g:OmniSharp_popup_options = {
\ 'highlight': 'Normal',
\ 'padding': [1],
\ 'border': [1]
\}

if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" Enable snippet completion, using the ultisnips plugin
" let g:OmniSharp_want_snippet=1


" Keybindings {
"Copy and paste from system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P


"Use this variable to change symbols.
"vim
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'✹',
    \ 'Staged'    :'✚',
    \ 'Untracked' :'✭',
    \ 'Renamed'   :'➜',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'✖',
    \ 'Dirty'     :'✗',
    \ 'Ignored'   :'☒',
    \ 'Clean'     :'✔︎',
    \ 'Unknown'   :'?',
    \ }
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 0 " a heavy feature may cost much more time. default: 0
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusConcealBrackets = 0 " default: 0
let NERDTreeShowHidden=1 " Show hidden files in NERDTree


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn=number
set signcolumn=yes
set notimeout

" Default rules for matching in pear-tree:
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ '{/**': {'closer': '**/}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'},
            \ '/**': {'closer': '**/'},
            \ '<!--': {'closer': '-->'}
            \ }
" See pear-tree/after/ftplugin/ for filetype-specific matching rules

" Pear Tree is enabled for all filetypes by default:
let g:pear_tree_ft_disabled = []

" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 1

" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 0

" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60

" Automatically map <BS>, <CR>, and <Esc>
" let g:pear_tree_map_special_keys = 1

" Default mappings:
" imap <BS> <Plug>(PearTreeBackspace)
" imap <CR> <Plug>(PearTreeExpand)
" imap <Esc> <Plug>(PearTreeFinishExpansion)
" Pear Tree also makes <Plug> mappings for each opening and closing string.
"     :help <Plug>(PearTreeOpener)
"     :help <Plug>(PearTreeCloser)

" Not mapped by default:
" <Plug>(PearTreeSpace)
" <Plug>(PearTreeJump)
" <Plug>(PearTreeExpandOne)
" <Plug>(PearTreeJNR)


" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual


" For adding multiple characters
nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>

" For editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


" REMAPs
" move cursor to other splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" open explorer
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" resize splits
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <leader>hs <Plug>GitGutterStageHunk
nmap <leader>hu <Plug>GitGutterUndoHunk


" Clear search highlighting
nnoremap <Esc> :nohlsearch<CR>
" Select all
nmap <C-a> gg<S-v>G
" Save easily
nmap <C-s> :w<CR>
" Save with root permission
command! W w !sudo tee > /dev/null %

" Cycle through buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-
" Quit a buffer
map q :quit<Return>
map Q :qa<Return>
" Move lines up or down
" Normal mode
nnoremap <c-a>j :m .+1<CR>==
nnoremap <c-a>k :m .-2<CR>==
" Insert mode
inoremap <c-a>j <ESC>:m .+1<CR>==gi
inoremap <c-a>k <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <c-a>j :m '>+1<CR>gv=gv
vnoremap <c-a>k :m '<-2<CR>gv=gv


" Spread buffer on tabline
let g:buftabline_numbers = 1

" Vim Commentary
nnoremap <C-/> :Commentary<CR>
vnoremap <C-/> :Commentary<CR>

" Source vimrc file
map <S-s> :source ~/.vimrc<CR>

" Open vimrc for editing
map <leader>v :e ~/.vimrc<CR>

" Toggle Foldings with the Ctrl+space bar
nnoremap <C-Space> za<CR>

" Indent visual selected code without unselecting
" As seen in vimcasts.org
vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

" CTRL-X is cut
vnoremap <C-X> "+x

" CTRL-C is copy
vnoremap <C-C> "+y

" Smart Paste CTRL-V from the system's clipboard and indents code automatically
nnoremap <leader>v "+P=']
inoremap <C-V> <C-o>"+P<C-o>=']
"}}}

"------------------------------------+
" Common typing mistakes          "{{{
"------------------------------------+
iab retunr return
iab Flase False
iab sefl self
iab pritn print
iab prnt print
iab edn end
iab dfe def

iab Whta What
iab whta what

iab becuase because
iab becuas because
"}}}

"------------------------------------+
" Fillchars/listchars/showbreak    {{{
"------------------------------------+
set list                    " Show line breaks and carriage returns in editor
set fillchars=vert:║
set listchars=tab:↹\ ,eol:↴,trail:⋅,extends:❯,precedes:❮
" set listchars=tab:↹\ ,eol:↴,trail:⋅,extends:❯,precedes:❮,space:⋅
set showbreak=↪⋯⋯
"}}}

"------------------------------------+
" Signatures                      "{{{
"------------------------------------+
iab ssig Jija Chara
iab lsig Jija Chara (https://github.com/CharaD7)
"}}}

"------------------------------------+
" Placeholders                    "{{{
"------------------------------------+
iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sollicitudin quam eget libero pulvinar id condimentum velit sollicitudin. Proin cursus scelerisque dui ac condimentum. Nullam quis tellus leo. Morbi consectetur, lectus a blandit tincidunt, tortor augue tincidunt nisi, sit amet rhoncus tortor velit eu felis.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
"}}}


"----------------------------------------------------------------------------//
" AUTOCOMMANDS                                                              {{{
"------------------------------------+---------------------------------------//
augroup Code Comments             "{{{
"------------------------------------+
  " Horizontal Rule (78 char long)
  autocmd FileType vim                           map <leader>hr 0i""---------------------------------------------------------------------------//<ESC>
  autocmd FileType javascript,typescript,php,c,cpp,css      map <leader>hr 0i/**-------------------------------------------------------------------------**/<ESC>
  autocmd FileType python,perl,ruby,sh,zsh,conf  map <leader>hr 0i##---------------------------------------------------------------------------//<ESC>
  " Comment Banners (adds 5 spaces at each end)
  autocmd FileType vim                           map <leader>cb I"     <ESC>A     "<ESC>yyp0lv$hhr-yykPjj
      autocmd FileType python,perl,ruby,sh,zsh,conf  map <leader>cb I#     <ESC>A     #<ESC>yyp0lv$hhr-yykPjj
      autocmd FileType javascript,php,c,cpp,css      map <leader>cb I/*     <ESC>A     */<ESC>yyp0llv$r-$hc$*/<ESC>yykPjj
augroup END "}}}

"------------------------------------+
augroup General                   "{{{
"------------------------------------+
  autocmd!
  " Help file settings
  au FileType help au BufEnter,BufWinEnter <buffer> setlocal spell!
  au FileType help au BufEnter,BufWinEnter <buffer> call <SID>SetupHelpWindow()

 function! s:SetupHelpWindow() "{{{
    wincmd W
    vertical resize 93
    " vertical resize 83
    setl nonumber winfixwidth colorcolumn=
 endfunction "}}}

 " Fix space highlighting in diff files
 au FileType diff hi clear RedundantSpaces
      \ | hi DiffCol ctermbg=238 cterm=bold
      \ | match DiffCol /^[ +-]\([+-]\)\@!/

 " Save on losing focus (after tabbing away or switching buffers)
 au FocusLost * :wa

 " Open in last edit place
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

 autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

  function s:MkNonExDir(file, buf) "{{{
    " Creates a directory if there is none
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
       let dir=fnamemodify(a:file, ':h')
      if !isdirectory(dir)
         call mkdir(dir, 'p')
      endif
    endif
  endfunction "}}}

augroup END " }}}

"------------------------------------+
augroup Formatting                "{{{
"------------------------------------+
  autocmd!
  " Format plain text and e-mails correctly
  autocmd BufNewFile,BufRead *.txt setl ft=text
augroup END "}}}

"------------------------------------+
augroup Whitespace                "{{{
"------------------------------------+
  autocmd!
  " Remove trailing whitespace from selected filetypes
  au FileType html,css,sass,javascript,typescript,php,python,ruby,sql,vim au BufWritePre <buffer> :silent! call <SID>StripTrailingWhitespace()

augroup END "}}}

"------------------------------------+
augroup Filetype Specific         "{{{
"------------------------------------+
	autocmd!
	"------------------+
	" Markdown       {{{
	"------------------+
	autocmd FileType markdown setlocal spell
	autocmd FileType markdown setlocal autoindent
	autocmd FileType markdown setlocal textwidth=80
	autocmd FileType markdown setlocal formatoptions=tcroqn2 comments=n:>
	" }}}

	"----------------------+

	"----------------------+
	" Reach              {{{
	"----------------------+

	au BufReadPost *.rsh set filetype=reach
	au Filetype reach set syntax=javascript

	let g:LanguageClient_serverCommands = {
	\ 'reach': ['node', '~/.vim/reach-ide/server/out/server.js', '--stdio']
													\ }

	let g:LanguageClient_loggingLevel = 'DEBUG'
	let g:LanguageClient_loggingFile =  expand('~/.vim/reach-ide/reach-language-client.log')
	let g:LanguageClient_serverStderr = expand('~/.vim/reach-ide/reach-language-server.log')

	nnoremap <silent> <F4> :call LanguageClient#textDocument_hover()<CR>
	nnoremap <silent> <F3> :call LanguageClient#textDocument_codeAction()<CR>
	"}}}

	" HTML/XHTML/XML     {{{
	"----------------------+
	autocmd FileType html,xhtml,xml setlocal textwidth=0
	autocmd FileType html,xhtml,xml setlocal tabstop=3 shiftwidth=3 noexpandtab
	" }}}

	"------------------+
	" JavaScript     {{{
	"------------------+
	autocmd FileType javascript,javascript.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
	" }}}

	"------------------+
	" TypeScript     {{{
	"------------------+
	autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	" }}}

	"------------------+
	" CSS            {{{
	"------------------+
	autocmd FileType css setlocal smartindent
	autocmd FileType css setlocal tabstop=2 shiftwidth=2 noexpandtab
	autocmd FileType css setlocal equalprg=prettier\ --parser\ css\ --stdin\ --tab-width\ 2
	autocmd FileType css noremap <leader>css %s/{\_.\{-}}/\=substitute(submatch(0), '\n', '', 'g')/
	" }}}

	"------------------+
	" Ruby           {{{
	"------------------+
	autocmd FileType ruby,eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd FileType ruby,eruby setlocal foldmethod=expr foldlevel=99
	" }}}

	"------------------+
	" YAML           {{{
	"------------------+
	autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	" }}}

	"------------------+
	" Slim           {{{
	"------------------+
	" Enable slim syntax highlight
	autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
	autocmd FileType slim setlocal foldmethod=indent
	" }}}

	"------------------+
	" Python         {{{
	"------------------+
	au FileType python setlocal nocindent
	au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	au BufNewFile,BufRead *.py setlocal autoindent
	au BufNewFile,BufRead *.py setlocal textwidth=79
	" }}}

	"------------------+
	" Nginx          {{{
	"------------------+
	au BufNewFile,BufRead /etc/nginx/conf/* setl ft=nginx
	" }}}

	"------------------+
	" Arch Linux     {{{
	"------------------+
	au BufNewFile,BufRead PKGBUILD setl syntax=sh ft=sh
	au BufNewFile,BufRead *.install setl syntax=sh ft=sh
	" }}}

	"------------------+
	" SQL            {{{
	"------------------+
	au FileType sql setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType sql setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	au BufNewFile,BufRead *.sql set ft=sql foldmethod=marker

augroup END "}}}
"}}}

" Using supertabs and previews for youcompleteme
" let g:SuperTabClosePreviewOnPopupClose = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1


 " Remove newbie crutches in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
" inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
" nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
" nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
" vnoremap <Down> <Nop>
" vnoremap <Left> <Nop>
" vnoremap <Right> <Nop>
" vnoremap <Up> <Nop>
