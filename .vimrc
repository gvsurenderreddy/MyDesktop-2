" Bundles {{{1
call plug#begin()
Plug 'altercation/vim-colors-solarized'
    let g:solarized_menu = 0
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    let g:solarized_bold = 1
    let g:solarized_italic = 1
    let g:solarized_underline = 1
    let g:solarized_contrast = "normal"
    let g:solarized_visibility = "normal"
Plug 'chrisbra/NrrwRgn'
        " <leader>nr                            Open the current visual selection in a new narrowed window
        " :NR                                   Open the selected region in a new narrowed window
        " :NW                                   Open the current visual window in a new narrowed window
        " :WidenRegion                          (In the narrowed window) write the changes back to the original buffer.
        " :NRV                                  Open the narrowed window for the region that was last visually selected.
        " :NUD                                  (In a unified diff) open the selected diff in 2 Narrowed windows
        " :NRP                                  Mark a region for a Multi narrowed window
        " :NRM                                  Create a new Multi narrowed window (after :NRP)
        " :NRS                                  Enable Syncing the buffer content back (default on)
        " :NRN                                  Disable Syncing the buffer content back
        " :NRL                                  Reselect the last selected region and open it again in a narrowed window
Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPMixed'
    let g:ctrlp_reuse_window  = 'startify'
    let g:ctrlp_custom_ignore = {
                              \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                              \ 'file': '\v\.(exe|so|dll)$',
                              \ }
Plug 'dimasg/vim-mark'
        " <Leader>m                             Mark the word under the cursor, or clear the mark
        " <Leader>n                             Clear the mark, or clear all marks if not on a mark
        " :Marks                                List all mark highlight groups and the search patterns
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabLongestEnhanced = 1
Plug 'easymotion/vim-easymotion', {'on': ['<Plug>(easymotion-overwin-f)', '<Plug>(easymotion-overwin-f2)']}
    let g:EasyMotion_smartcase = 1
    nmap f <Plug>(easymotion-overwin-f)
    nmap s <Plug>(easymotion-overwin-f2)
Plug 'eshock/vim-matchit'
Plug 'fatih/vim-go', {'for': 'go'}
    let g:go_auto_type_info = 1
    let g:go_fmt_command = "goimports"
Plug 'gregsexton/gitv', {'on': 'Gitv'}
Plug 'honza/vim-snippets'
Plug 'idanarye/vim-merginal'
Plug 'itchyny/landscape.vim'
Plug 'itchyny/screensaver.vim', {'on': 'ScreenSaver'}
Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
        " :EasyAlign[!] [OPTIONS]               Interactive mode
        " :LiveEasyAlign[!] [...]               Live interactive mode
        " :EasyAlign[!] [N] DELIMITER [OPTIONS] Non-interactive mode
        " :EasyAlign[!] [N] /REGEXP/ [OPTIONS]  Non-interactive mode
Plug 'KabbAmine/vCoolor.vim'
        " :VCoolor                              Insert an HEX color
        " :VCoolIns r                           Insert an rgb color
        " :VCoolIns h                           Insert an hsl color
        " :VCoolIns ra                          Insert an rgba color
Plug 'kshenoy/vim-signature'
        " mx                                    Toggle mark 'x' where x is a-zA-Z
        " dmx                                   Remove mark 'x' where x is a-zA-Z
        " m,                                    Place the next available mark
        " m-                                    Delete all marks from the current line
        " m<space>                              Delete all marks from the current buffer
        " ]` / [`                               Jump to next / prev mark
        " ]' / ['                               Jump to start of next / prev line containing a mark
        " m/                                    Open location list and display marks from current buffer
        " m[0-9]                                Toggle the corresponding marker
        " m<S-[0-9]>                            Remove all markers of the same type
        " ]- / ]-                               Jump to next / prev line having a marker of the same type
        " ]= / ]=                               Jump to next / prevline having a marker of any type
        " m?                                    Open location list and display markers from current buffer
        " m<BS>                                 Remove all markers
Plug 'lilydjwg/colorizer'
    let g:colorizer_nomap = 1
        " :ColorHighlight                       Start/Update highlighting
        " :ColorClear                           Clear all highlights
        " :ColorToggle                          Toggle highlights
Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1
Plug 'luochen1990/select-and-search'
    let g:select_and_search_active = 1
Plug 'majutsushi/tagbar'
    let g:tagbar_autofocus = 1
Plug 'mattn/calendar-vim'
    let g:calendar_weeknm = 1
    let g:calendar_mark = 'right'
    let g:calendar_datetime='statusline'
        " :Calendar [YYYY MM]                   Bring up a calendar
        " :CalendarH [YYYY MM]                  Bring up a calendar in a horizontally split window
        " :CalendarVR [YYYY MM]                 Bring up a calendar in a right vertically split window
        " :CalendarT [YYYY MM]                  Bring up a calendar a full-screen
Plug 'mattn/gist-vim', {'on': 'Gist'}
    let g:gist_post_private = 1
Plug 'mattn/webapi-vim'
Plug 'mbbill/echofunc'
Plug 'mbbill/fencview'
    let g:fencview_autodetect = 1
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
    let g:undotree_SetFocusWhenToggle = 1
    let g:undotree_WindowLayout = 2
Plug 'mbbill/VimExplorer', {'on': 'VE'}
Plug 'mhinz/vim-hugefile'
Plug 'mhinz/vim-signify'
    let g:signify_sign_add = '+'
    let g:signify_sign_change = '~'
    let g:signify_sign_delete = '-'
    let g:signify_sign_delete_first_line = '-'
Plug 'mhinz/vim-startify'
    let g:startify_custom_header = []
    let g:startify_session_autoload = 1
    let g:startify_session_persistence = 1
    let g:startify_skiplist = [
                            \ 'COMMIT_EDITMSG',
                            \ $VIMRUNTIME.'/doc',
                            \ 'plugged/.*/doc',
                            \ '/\.git/',
                            \ ]
Plug 'Mizuchi/STL-Syntax', {'for': 'cpp'}
" Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}
    " let g:indent_guides_guide_size = 1
Plug 'NLKNguyen/papercolor-theme'
Plug 'pelodelfuego/vim-swoop'
Plug 'Raimondi/delimitMate'
Plug 'reedes/vim-colors-pencil'
    let g:pencil_higher_contrast_ui = 1
    let g:pencil_gutter_color = 1
" Plug 'reedes/vim-lexical'
" Plug 'reedes/vim-litecorrect'
" Plug 'reedes/vim-pencil'
" Plug 'reedes/vim-textobj-quote'
" Plug 'reedes/vim-textobj-sentence'
" Plug 'reedes/vim-wordy'
Plug 'scrooloose/nerdtree'
    let g:NERDTreeQuitOnOpen = 1
    let g:NERDTreeShowHidden = 1
    let g:NERDTreeShowBookmarks = 1
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-expand-region'
    " let g:expand_region_use_select_mode = 1
        " +                                     Expand the visual selection
        " -                                     Shrink the visual selection
Plug 'terryma/vim-multiple-cursors'
        " <c-n>                                 Highlight the current word and find the next
        " <c-p>                                 Go back to the previous virtual cursor
        " <c-x>                                 Remove the current virtual cursor and skip to the next
Plug 'tomasr/molokai'
    let g:molokai_original = 0
Plug 'tpope/vim-commentary', {'on': ['<Plug>Commentary', '<Plug>CommentaryLine']}
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
        " <c-a>/<c-x>                           +/- dates, times, and more
Plug 'tpope/vim-surround'
        " ys                                    Add a surrounding
        " cs                                    Change a surrounding
        " ds                                    Delete a surrounding
Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'vim-scripts/a.vim', {'for': ['c', 'cpp']}
Plug 'vim-scripts/CRefVim', {'for': ['c', 'cpp']}
        " <Leader>cr normal mode:               Get help for word under cursor
        " <Leader>cr visual mode:               Get help for visually selected text
        " <Leader>cw:                           Prompt for word CRefVim should search for
        " <Leader>cc:                           Jump to table of contents of the C-reference manual
Plug 'vim-scripts/DoxygenToolkit.vim'
" Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/luarefvim', {'for': 'lua'}
        " <Leader>lr normal mode:               Get help for word under cursor
        " <Leader>lr visual mode:               Get help for visually selected text
Plug 'vim-scripts/stlrefvim', {'for': 'cpp'}
        " <Leader>tr normal mode:               Go to documentation for this function
        " <Leader>te normal mode:               Go to an example that uses this function
Plug 'vim-scripts/utl.vim'
Plug 'vim-voom/VOoM'
" Plug 'vimim/vimim'
Plug 'vimwiki/vimwiki'
    let g:vimwiki_menu = ''
    let g:vimwiki_folding = 'expr'
    let g:vimwiki_hl_cb_checked = 1
    autocmd! FileType vimwiki nmap <Leader><space> <Plug>VimwikiToggleListItem
        " <Leader>ww                            Open default wiki index file
        " <Leader>wt                            Open default wiki index file in a new tab
        " <Leader>ws                            Select and open wiki index file
        " <Leader>wd                            Delete wiki file you are in
        " <Leader>wr                            Rename wiki file you are in
        " <Leader>wi                            Open diary index file
        " <Leader>w<Leader>w                    Open diary wiki-file for today
        " <Leader>w<Leader>t                    Open diary wiki-file for today in a new tab
        " <Leader>w<Leader>i                    Update diary section
        " <enter>                               Follow/create wiki link
        " <s-enter>                             Split and follow/create wiki link
        " <c-enter>                             Vertical split and follow/create wiki link
        " <backspace>                           Go back to parent(previous) wiki link
        " <tab> or <s-tab>                      Find next or previous wiki link
        " :VimwikiAll2HTML                      Convert all your wiki links to HTML
        " <Leader>wh  or :Vimwiki2HTML          Convert current wiki link to HTML
        " <Leader>whh or :Vimwiki2HTMLBrowse    Convert current wiki link to HTML and open it in a webbrowser
Plug 'xuhdev/SingleCompile', {'on': 'SCCompileRun'}
    let g:SingleCompile_menumode = 0
Plug 'Yggdroot/indentLine'
    let g:indentLine_enabled = 0
if has("python") || has("python3")
    Plug 'iamcco/dict.vim'
    Plug 'klen/python-mode', {'for': 'python'}
    Plug 'rip-rip/clang_complete', {'for': ['c', 'cpp']}
    Plug 'Shougo/vinarise.vim', {'on': 'Vinarise'}
    Plug 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger = '<tab>'
        let g:UltiSnipsListSnippets = '<c-tab>'
        let g:UltiSnipsJumpForwardTrigger = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    " Plug 'Valloric/YouCompleteMe'
    Plug 'waylan/vim-markdown-extra-preview', {'for': 'markdown'}
            " :Me                               Preview the current buffer
            " :Mer                              Refresh the current buffer
else
    Plug 'garbas/vim-snipmate'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'vim-scripts/OmniCppComplete', {'for': ['c', 'cpp']}
endif
if has("gui_running")
    Plug 'yonchu/accelerated-smooth-scroll'
else
    Plug 'godlygeek/csapprox'
endif
call plug#end()


" Settings {{{1
filetype plugin indent on
syntax on
set magic
set ruler
set hidden
set number
set showcmd
set ttyfast
set showmode
set wrapscan
set autochdir
set linebreak
set mousehide
set showmatch
set visualbell
set noswapfile
set nocompatible
set expandtab smarttab
set incsearch hlsearch
set ignorecase smartcase
set autoindent smartindent
set cursorline cursorcolumn
set laststatus=2
set scrolloff=3
set tabstop=4
set shiftwidth=4
set softtabstop=4
set guioptions=acgmt
set formatoptions=tcqmM
set omnifunc=syntaxcomplete#Complete
set backspace=indent,eol,start
set completeopt=longest,menu,preview
set viewoptions=folds,options,cursor,unix,slash
set nofoldenable foldmethod=indent
set wildmenu wildmode=list:longest,full
set wrap whichwrap=b,s,<,>,[,]
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese


" Interface {{{1
if has("gui_running")
    if strftime("%H") > 6 && strftime("%H") < 18
        set background=light
    else
        set background=dark
    endif
    if has("win16") || has("win32") || has("win64")
        autocmd GUIEnter * call libcallnr("vimtweak.dll", "EnableMaximize", 1)
        autocmd GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 245)
        set guifont=Source_Code_Pro:h12
        colorscheme PaperColor
    elseif has("unix")
        autocmd GUIEnter * call system("wmctrl -ir " . v:windowid . " -b add,maximized_vert,maximized_horz")
        set guifont=SourceCodePro\ 12
        set guifontwide=SourceHanSans\ 12
        colorscheme PaperColor
    elseif has("mac")
        " reserved
    endif
else
    let g:airline_powerline_fonts = 0
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    set nocursorline nocursorcolumn
    if &term =~ "xterm" || &term =~ "screen"
        set t_Co=256
        colorscheme landscape
    elseif &term =~ "linux"
        " fbterm
        colorscheme slate
    elseif &term =~ "win"
        " windows console
        colorscheme desert
    endif
endif


" Autocmds {{{1
if has("autocmd")
    autocmd User Startified setlocal buflisted nocursorline nocursorcolumn
    autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
    autocmd FileType * if &omnifunc != '' | call SuperTabChain(&omnifunc, "<c-p>") | endif
    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | execute "normal g'\"" | endif
    autocmd BufWritePre * call FormatCodeFile()
    autocmd BufNewFile *.sh,*.py,*.rb call SetFileHead()
    autocmd BufWritePost .vimrc source $MYVIMRC
endif


" Keybindings {{{1
nmap <silent> <f2>          :call AutoNERDTreeToggle()<cr>
nmap <silent> <f3>          <Plug>DictWSearch
vmap <silent> <f3>          <Plug>DictWVSearch
nmap <silent> <f4>          :UndotreeToggle<cr>
nmap <silent> <f7>          :CalendarVR<cr>
nmap <silent> <f9>          :SCCompileRun<cr>
nmap <silent> <f10>         :TagbarToggle<cr>
nmap <silent> <f11>         :call FullScreenToggle()<cr>
nmap <silent> <f12>         :marks<cr>
nmap <silent> <c-q>         <Plug>CommentaryLine
vmap <silent> <c-q>         <Plug>Commentary
nmap <silent> <c-s>         :ScreenSaver<cr>
nmap <silent> <c-tab>       :ls<cr>:confirm:b!
nmap <silent> <tab><tab>    :IndentLinesToggle<cr>
nmap <silent> <esc><esc>    :nohlsearch<cr>


" Functions {{{1
" Auto set file head {{{2
function! SetFileHead()
    if &filetype == 'sh'
        call setline(1, ["\#!/usr/bin/env bash", ""])
    endif
    if &filetype == 'python'
        call setline(1, ["\#!/usr/bin/env python", "\# -- coding: utf-8 --", ""])
    endif
    if &filetype == 'ruby'
        call setline(1, ["\#!/usr/bin/env ruby", ""])
    endif
    normal G
    normal o
endfunction

" Toggle fullScreen {{{2
function! FullScreenToggle()
    if has("gui_running")
        if has("win16") || has("win32") || has("win64")
            if &guioptions =~ 'm'
                set guioptions-=gmt
            else
                set guioptions+=gmt
            endif
            call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)
        elseif has("unix")
            if &guioptions =~ 'm'
                set guioptions-=gmt
            else
                set guioptions+=gmt
            endif
            call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
        elseif has("mac")
            " reserved
        endif
    endif
endfunction

" Format Code File {{{2
function! FormatCodeFile()
    silent! %s/\s\+$//e
    let curPos = getpos(".")
    if &filetype == 'c' || &filetype == 'cpp'
        silent! execute "%!astyle -A1fpjk3xdLUNSKY"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    elseif &filetype == 'java'
        silent! execute "%!astyle -A2fpjk3xdLUSKY"
        silent! execute "!ctags -R --fields=+iaS --extra=+q ."
    elseif &filetype == 'python'
        silent! execute "PymodeLintAuto"
        silent! execute "!ctags -R --fields=+iaS --extra=+q ."
    endif
    call setpos('.', curPos)
endfunction

" Toggle NERDTree automatically {{{2
function! AutoNERDTreeToggle()
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        NERDTreeClose
    else
        if (expand("%:t") != '')
            NERDTreeFind
        else
            NERDTreeToggle
        endif
    endif
endfunction


" vim:foldmethod=marker:foldmarker={{{,}}}:
