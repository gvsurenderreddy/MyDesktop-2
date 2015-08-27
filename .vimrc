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
Plug 'arecarn/crunch'
        " g={motion}                            Evaluate the text that {motion} moves over
        " g==                                   Evalue the current line appending the result
        " :[range]Crunch[!]                     Evaluates the current visual selection
        " :Crunch [expr]                        Where [expr] is some mathematical expression
Plug 'bling/vim-airline'
    let g:airline_crypt_symbol = ''
    let g:airline_powerline_fonts = 1
    " let g:airline#extensions#tabline#enabled = 1
Plug 'chrisbra/Colorizer'
    let g:colorizer_auto_color = 1
    let g:colorizer_skip_comments = 1
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
Plug 'ciaranm/detectindent'
Plug 'dimasg/vim-mark'
        " <Leader>m                             Mark the word under the cursor, or clear the mark
        " <Leader>n                             Clear the mark, or clear all marks if not on a mark
        " :Marks                                List all mark highlight groups and the search patterns
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabLongestEnhanced = 1
Plug 'eshock/vim-matchit'
" Plug 'godlygeek/csapprox'
" Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'gregsexton/gitv', {'on': 'Gitv'}
Plug 'hsitz/VimOrganizer'
    autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org
    autocmd BufEnter *.org call org#SetOrgFileType()
Plug 'honza/vim-snippets'
Plug 'idanarye/vim-merginal'
" Plug 'itchyny/vim-cursorword'
Plug 'itchyny/landscape.vim'
" Plug 'itchyny/lightline.vim'
Plug 'itchyny/screensaver.vim'
Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
        " :EasyAlign[!] [OPTIONS]               Interactive mode
        " :LiveEasyAlign[!] [...]               Live interactive mode
        " :EasyAlign[!] [N] DELIMITER [OPTIONS] Non-interactive mode
        " :EasyAlign[!] [N] /REGEXP/ [OPTIONS]  Non-interactive mode
" Plug 'justinmk/vim-sneak'
    " let g:sneak#streak = 1
    " let g:sneak#s_next = 1
Plug 'KabbAmine/vCoolor.vim'
        " :VCoolor                              Insert an HEX color
        " :VCoolIns r                           Insert an rgb color
        " :VCoolIns h                           Insert an hsl color
        " :VCoolIns ra                          Insert an rgba color
Plug 'kien/ctrlp.vim'
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPMixed'
    let g:ctrlp_reuse_window  = 'startify'
    let g:ctrlp_custom_ignore = {
                              \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                              \ 'file': '\v\.(exe|so|dll)$',
                              \ }
Plug 'kshenoy/vim-signature'
        " mx                                    Toggle mark 'x' where x is a-zA-Z
        " dmx                                   Remove mark 'x' where x is a-zA-Z
        " m,                                    Place the next available mark
        " m-                                    Delete all marks from the current line
        " m<Space>                              Delete all marks from the current buffer
        " ]` / [`                               Jump to next / prev mark
        " ]' / ['                               Jump to start of next / prev line containing a mark
        " m/                                    Open location list and display marks from current buffer
        " m[0-9]                                Toggle the corresponding marker
        " m<S-[0-9]>                            Remove all markers of the same type
        " ]- / ]-                               Jump to next / prev line having a marker of the same type
        " ]= / ]=                               Jump to next / prevline having a marker of any type
        " m?                                    Open location list and display markers from current buffer
        " m<BS>                                 Remove all markers
Plug 'Lokaltog/vim-easymotion'
    let g:EasyMotion_smartcase = 1
    nmap f <Plug>(easymotion-s)
    nmap s <Plug>(easymotion-s2)
Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1
Plug 'majutsushi/tagbar'
    let g:tagbar_autofocus = 1
Plug 'mattn/calendar-vim'
        " :Calendar [YYYY MM]                   Bring up a calendar
        " :CalendarH [YYYY MM]                  Bring up a calendar in a horizontally split window
        " :CalendarVR [YYYY MM]                 Bring up a calendar in a right vertically split window
        " :CalendarT [YYYY MM]                  Bring up a calendar a full-screen
Plug 'mattn/gist-vim'
    let g:gist_post_private = 1
Plug 'mattn/webapi-vim'
Plug 'mbbill/echofunc'
Plug 'mbbill/fencview'
    let g:fencview_autodetect = 1
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
    let g:undotree_SetFocusWhenToggle = 1
Plug 'mbbill/VimExplorer', {'on': 'VE'}
Plug 'mhinz/vim-hugefile'
Plug 'mhinz/vim-signify'
    let g:signify_sign_add = '+'
    let g:signify_sign_change = '~'
    let g:signify_sign_delete = '-'
    let g:signify_sign_delete_first_line = '-'
Plug 'mhinz/vim-startify'
    let g:startify_session_autoload = 1
    let g:startify_session_persistence = 1
    let g:startify_skiplist = [
                            \ 'COMMIT_EDITMSG',
                            \ $VIMRUNTIME.'/doc',
                            \ 'plugged/.*/doc',
                            \ '/\.git/',
                            \ ]
Plug 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_guide_size = 1
Plug 'pelodelfuego/vim-swoop'
    let g:swoopUseDefaultKeyMap = 0
Plug 'Raimondi/delimitMate'
Plug 'reedes/vim-colors-pencil'
    let g:pencil_higher_contrast_ui = 1
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
" Plug 'Shougo/neocomplcache.vim'
    " let g:neocomplcache_enable_at_startup = 1
    " let g:neocomplcache_enable_smart_case = 1
    " let g:neocomplcache_min_syntax_length = 3
Plug 'szw/vim-dict'
    let g:dict_hosts = [["dict.org", ["wn"]]]
Plug 'terryma/vim-expand-region'
    " let g:expand_region_use_select_mode = 1
        " +                                     Expand the visual selection
        " -                                     Shrink the visual selection
Plug 'terryma/vim-multiple-cursors'
        " <c-n>                                 Highlight the current word and find the next
        " <c-p>                                 Go back to the previous virtual cursor
        " <c-x>                                 Remove the current virtual cursor and skip to the next
Plug 'tomasr/molokai'
    let g:molokai_original = 1
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
        " <c-a>/<c-x>                           +/- dates, times, and more
Plug 'tpope/vim-surround'
        " ys                                    Add a surrounding
        " cs                                    Change a surrounding
        " ds                                    Delete a surrounding
" Plug 'vim-scripts/AutoComplPop'
Plug 'vim-scripts/CRefVim'
        " <Leader>cr normal mode:               Get help for word under cursor
        " <Leader>cr visual mode:               Get help for visually selected text
        " <Leader>cw:                           Prompt for word CRefVim should search for
        " <Leader>cc:                           Jump to table of contents of the C-reference manual
Plug 'vim-scripts/directionalWindowResizer'
        " <c-h/j/k/l>                           Resize windows
" Plug 'vim-scripts/DoxygenToolkit.vim'
" Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/luarefvim'
        " <Leader>lr normal mode:               Get help for word under cursor
        " <Leader>lr visual mode:               Get help for visually selected text
Plug 'vim-scripts/OmniCppComplete'
Plug 'vim-scripts/utl.vim'
Plug 'vim-voom/VOoM'
Plug 'vimwiki/vimwiki'
        " <Leader>ww                            Open default wiki index file
        " <Leader>wt                            Open default wiki index file in a new tab
        " <Leader>ws                            Select and open wiki index file
        " <Leader>wd                            Delete wiki file you are in
        " <Leader>wr                            Rename wiki file you are in
        " <Leader>wi                            Open diary index file
        " <Leader>w<Leader>w                    Open diary wiki-file for today
        " <Leader>w<Leader>t                    Open diary wiki-file for today in a new tab
        " <Leader>w<Leader>i                    Update diary section
        " <enter>                               Folow/create wiki link
        " <s-enter>                             Split and folow/create wiki link
        " <c-enter>                             Vertical split and folow/create wiki link
        " <backspace>                           Go back to parent(previous) wiki link
        " <tab> or <s-tab>                      Find next or previous wiki link
        " :VimwikiAll2HTML                      Convert all your wiki links to HTML
        " <Leader>wh  or :Vimwiki2HTML          Convert current wiki link to HTML
        " <Leader>whh or :Vimwiki2HTMLBrowse    Convert current wiki link to HTML and open it in a webbrowser
Plug 'vitalk/vim-simple-todo'
        " <Leader>i	Create a new todo under cursor
        " <Leader>I	Create a new todo for current line
        " <Leader>o	Create a new todo below current line
        " <Leader>O	Create a new todo above current line
        " <Leader>x	Mark todo under cursor as done
        " <Leader>X	Mark todo as undone
Plug 'xuhdev/SingleCompile'
    let g:SingleCompile_menumode = 0
Plug 'yaroot/wowlua.vim'
" Plug 'Yggdroot/indentLine'
if has("python") || has("python3")
    Plug 'joedicastro/vim-markdown-extra-preview'
            " :Me                               Preview the current buffer
            " :Mer                              Refresh the current buffer
    Plug 'klen/python-mode'
    Plug 'Shougo/vinarise.vim', {'on': 'Vinarise'}
    Plug 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger = '<tab>'
        let g:UltiSnipsListSnippets = '<c-tab>'
        let g:UltiSnipsJumpForwardTrigger = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    " Plug 'Valloric/YouCompleteMe'
else
    Plug 'garbas/vim-snipmate'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
endif
if has("gui_running")
    Plug 'vim-scripts/sunset'
        let g:sunset_latitude = 30
        let g:sunset_longitude = 120
        let g:sunset_utc_offset = 8
    Plug 'yonchu/accelerated-smooth-scroll'
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
set linespace=4
set shiftwidth=4
set softtabstop=4
set guioptions=acgmt
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
set fileencodings=utf-8,ucs-bom,euc-cn,euc-tw,euc-jp,euc-kr,latin-1


" Interface {{{1
if has("gui_running")
    if has("win16") || has("win32") || has("win64")
        autocmd GUIEnter * call libcallnr("vimtweak.dll", "EnableMaximize", 1)
        autocmd GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 245)
        set guifont=Fantasque_Sans_Mono:h13
        set guifontwide=SimHei:h12
        colorscheme solarized
    elseif has("unix")
        autocmd GUIEnter * winpos 0 0
        set lines=999 columns=999
        set guifont=Fantasque\ Sans\ Mono\ 13
        set guifontwide=VeraSansYuanTi\ 12
        colorscheme solarized
    elseif has("mac")
        " reserved
    endif
else
    if &term == "xterm" || &term == "screen"
        set t_Co=256
        colorscheme landscape
    elseif &term == "linux"
        " fbterm
        colorscheme slate
    elseif &term == "win32"
        " DOS console
        set nocursorline nocursorcolumn
    endif
endif


" Autocmds {{{1
if has("autocmd")
    autocmd FileType startify setlocal nocursorline nocursorcolumn
    autocmd FileType * if &omnifunc != '' | call SuperTabChain(&omnifunc, "<c-p>") | endif
    autocmd BufNewFile *.sh,*.py,*.rb call SetFileHead()
    autocmd BufReadPost * DetectIndent
    autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | execute "normal g'\"" | endif
    autocmd BufWritePre * silent! %s/\s\+$//e
    autocmd BufWritePost .vimrc source ~/.vimrc
    autocmd BufWritePost *.h,*.c,*.cpp,*.java,*.js,*.py,*.rb,*.lua silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
endif


" Keybindings {{{1
nnoremap <silent> <f2>          :NERDTreeToggle<cr>
nnoremap <silent> <f3>          :Dict<cr>
nnoremap <silent> <f4>          :UndotreeToggle<cr>
nnoremap <silent> <f7>          :CalendarVR<cr>
nnoremap <silent> <f9>          :SCCompileRun<cr>
nnoremap <silent> <f10>         :TagbarToggle<cr>
nnoremap <silent> <f11>         :call FullScreenToggle()<cr>
nnoremap <silent> <f12>         :marks<cr>
nnoremap <silent> <m-q>         :Commentary<cr>
vnoremap <silent> <m-q>         :Commentary<cr>
nnoremap <silent> <m-l>         :ScreenSaver<cr>
nnoremap <silent> <c-tab>       :ls<cr>:confirm:b!
nnoremap <silent> <tab><tab>    :IndentGuidesToggle<cr>
nnoremap <silent> <esc><esc>    :nohlsearch<cr>


" Functions {{{1
" Auto set file head {{{2
function! SetFileHead()
    if &filetype == 'sh'
        call setline(1, ["\#!/bin/bash", ""])
    endif
    if &filetype == 'python'
        call setline(1, ["\#!/usr/bin/env python", "\#-*- coding:utf-8 -*-", ""])
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
            call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)
        elseif has("unix")
            " reserved
        elseif has("mac")
            " reserved
        endif
    endif
endfunction


" vim:foldmethod=marker:foldmarker={{{,}}}:
