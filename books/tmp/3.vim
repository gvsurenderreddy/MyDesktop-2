scriptencoding utf-8
" ========================================================================
" ����(lilydjwg) �� vimrc
" �ҵĲ��ͣ� http://lilydjwg.is-programmer.com/
"
" ���������ڱ��� *Only*
" ���������еĲ������úܿ��ܷǳ��ʺ���Ŷ����
" ��Ҫ�������հᣬֻ����Ϯ�������Լ����õĲ��֣�
"
" ���κ�����ͽ��飬����������˵�ģ����Ե��ҵĲ������ԡ�
"
" ��ɣ�GPLv3
" ========================================================================
" �����ļ�[[[1
runtime vimrc_example.vim
"]]]
" �ҵ�����
" ����[[[1
"   ת�� HTML��ֻҪ pre ��ǩ����[[[2
"   http://bootleq.blogspot.com/2012/12/tohtml-html-document-function-tohtmldoc.html
function Lilydjwg_to_html(line1, line2)
	let save_number = get(g:, 'html_number_lines', -1)
	let g:html_number_lines = 0
	call tohtml#Convert2HTML(a:line1, a:line2)
	setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted
	call search("<pre[^<]*>")
	normal! dit
	%delete _
	let @" = '<pre>' . substitute(@", '\v^\n\s*', '', '') . '</pre>'
	call setline(1, split(@", '\n'))
	if save_number > -1
		let g:html_number_lines = save_number
	else
		unlet g:html_number_lines
	endif
endfunction
"   ��ȡ�ɶ����ļ���С[[[2
function Lilydjwg_getfsize(file)
	let size = getfsize(a:file)
	if has('python3')
		try
			py3 from myutils import filesize
			return py3eval('filesize('.size.')')
		catch /.*/
		endtry
	endif
	return size . 'B'
endfunction
"   �� NERDTree��ʹ�õ�ǰ�ļ�Ŀ¼���ߵ�ǰĿ¼[[[2
function Lilydjwg_NERDTreeOpen()
	if exists("t:NERDTreeBufName")
		NERDTreeToggle
	else
		try
			NERDTree `=expand('%:h')`
		catch /E121/
			NERDTree `=getcwd()`
		endtry
	endif
endfunction
"   Perl-style quoted lists[[[2
function Lilydjwg_qw()
	let in = input('', 'qw(')
	return system('qw', in)
endfunction
"   ʹ�÷ָ������Ӷ��� [[[2
function Lilydjwg_join(sep, bang) range
	if a:sep[0] == '\'
		let sep = strpart(a:sep, 1)
	else
		let sep = a:sep
	endif
	let lines = getline(a:firstline, a:lastline)
	if a:firstline == 1 && a:lastline == line('$')
		let dellast = 1
	else
		let dellast = 0
	endif
	exe a:firstline . ',' . a:lastline . 'd_'
	if a:bang != '!'
		call map(lines, "substitute(v:val, '^\\s\\+\\|\\s\\+$', '', 'g')")
	endif
	call append(a:firstline-1, join(lines, sep))
	if dellast
		$d_
	endif
endfunction
"   �л���ʾ�к�/����к�/����ʾ [[[2
function Lilydjwg_toggle_number()
	if &nu && &rnu
		set nonu nornu
	elseif &nu && !&rnu
		set rnu
	else
		set nu
	endif
endfunction
"   ��������[[[2
function Lilydjwg_reindent(...)
	if a:0 != 2
		echoerr "��Ҫ��������"
	endif
	let save_et = &et
	let save_ts = &ts
	try
		let &ts = a:1
		set noet
		retab!
		let &ts = a:2
		set et
		retab!
	finally
		let &et = save_et
		let &ts = save_ts
	endtry
endfunction
"   ����ǰ����������Ļ�м䣨ȫ��ʱ�ã�[[[2
function CenterFull()
	on
	vs
	ene
	setl nocul
	setl nonu
	40winc |
	winc l
	vs
	winc l
	ene
	setl nocul
	setl nonu
	40winc |
	winc h
	redr!
endfunction
" ʹ�� colorpicker �����ȡ��ɫֵ(hex/rgba)[[[2
function Lilydjwg_colorpicker()
	if exists("g:last_color")
		let color = substitute(system("colorpicker ".shellescape(g:last_color)), '\n', '', '')
	else
		let color = substitute(system("colorpicker"), '\n', '', '')
	endif
	if v:shell_error == 1
		return ''
	elseif v:shell_error == 2
		" g:last_color ֵ����
		unlet g:last_color
		return Lilydjwg_colorpicker()
	else
		let g:last_color = color
		return color
	endif
endfunction
" ���Ĺ���µ���ɫֵ(hex/rgba/rgb)[[[2
function Lilydjwg_changeColor()
	let color = Lilydjwg_get_pattern_at_cursor('\v\#[[:xdigit:]]{6}(\D|$)@=|<rgba\((\d{1,3},\s*){3}[.0-9]+\)|<rgb\((\d{1,3},\s*){2}\d{1,3}\)')
	if color == ""
		echohl WarningMsg
		echo "No color string found."
		echohl NONE
		return
	endif
	let g:last_color = color
	call Lilydjwg_colorpicker()
	exe 'normal! eF'.color[0]
	call setline('.', substitute(getline('.'), '\%'.col('.').'c\V'.color, g:last_color, ''))
endfunction
" Locate and return character "above" current cursor position[[[2
function LookFurther(down)
	"��Դ http://www.ibm.com/developerworks/cn/linux/l-vim-script-1/�����޸�
	"Locate current column and preceding line from which to copy
	let column_num      = virtcol('.')
	let target_pattern  = '\%' . column_num . 'v.'
	let target_pattern_1  = '\%' . (column_num+1) . 'v.'

	" FIXed �����λ������ | ��ʾλ��ʱ����ȡ�ô���������к�
	"          /����
	"          |����
	" ����µ��ַ��Ƕ��ֽڵģ�
	" echo '['.matchstr(getline('.'), target_pattern).']'
	if matchstr(getline('.'), target_pattern) == '' &&
				\ matchstr(getline('.'), target_pattern_1) != ''
		let column_num -= 1
		" ������ַ�������Ӣ�ģ�ǰ�ߣ��������ģ����ߣ���
		let target_pattern  = '\%' . column_num . 'v.\|' . target_pattern
	endif
	if a:down
		let target_line_num = search(target_pattern, 'nW')
	else
		let target_line_num = search(target_pattern, 'bnW')
	endif

	"If target line found, return vertically copied character
	if !target_line_num
		return ""
	else
		return matchstr(getline(target_line_num), target_pattern)
	endif
endfunction
inoremap <silent> <C-Y> <C-R><C-R>=LookFurther(0)<CR>
inoremap <silent> <M-y> <C-R><C-R>=LookFurther(1)<CR>
" ��������[[[2
function Lilydjwg_Align(type) range
	try
		let pat = g:Myalign_def[a:type]
	catch /^Vim\%((\a\+)\)\=:E716/
		echohl ErrorMsg
		echo "���뷽ʽ" . a:type . "û�ж���"
		echohl None
		return
	endtry
	call Align#AlignPush()
	call Align#AlignCtrl(pat[0])
	if len(pat) == 3
		call Align#AlignCtrl(pat[2])
	endif
	exe a:firstline.','.a:lastline."call Align#Align(0, '". pat[1] ."')"
	call Align#AlignPop()
endfunction
function Lilydjwg_Align_complete(ArgLead, CmdLine, CursorPos)
	return filter(keys(g:Myalign_def), 'stridx(v:val, a:ArgLead) == 0')
endfunction
"  �˸�ɾ���Զ����� [[[2
function! Lilydjwg_checklist_bs(pat)
	" �˸������Զ��������б����
	if getline('.') =~ a:pat
		let ind = indent(line('.')-1)
		if !ind
			let ind = indent(line('.')+1)
		endif
		call setline(line('.'), repeat(' ', ind))
		return ""
	else
		return "\<BS>"
	endif
endfunction
"   �ֵ䲹ȫ <C-X><C-K> �� <C-K>[[[2
function Lilydjwg_dictcomplete()
	if pumvisible()
		return "\<C-K>"
	else
		return "\<C-X>\<C-K>"
	endif
endfunction
"   �Զ���ִ��Ȩ��[[[2
function Lilydjwg_chmodx()
	if strpart(getline(1), 0, 2) == '#!'
		let f = expand("%:p")
		if stridx(getfperm(f), 'x') != 2
			call system("chmod +x ".shellescape(f))
			e!
			filetype detect
			nmap <buffer> <S-F5> :!%:p<CR>
		endif
	endif
endfunction
"   ���ص�ǰ���ڵ����ı�ʾ[[[2
function Lilydjwg_zh_date()
	let d = strftime("%Y��%m��%d��")
	let d = substitute(d, '[����]\@<=0', '', 'g')
	return d
endfunction
"   �ر�ĳ������[[[2
function Lilydjwg_close(winnr)
	let winnum = bufwinnr(a:winnr)
	if winnum == -1
		return 0
	endif
	" Goto the workspace window, close it and then come back to the
	" original window
	let curbufnr = bufnr('%')
	exe winnum . 'wincmd w'
	close
	" Need to jump back to the original window only if we are not
	" already in that window
	let winnum = bufwinnr(curbufnr)
	if winnr() != winnum
		exe winnum . 'wincmd w'
	endif
	return 1
endfunction
"  ��ȫ So ����[[[2
function Lilydjwg_complete_So(ArgLead, CmdLine, CursorPos)
	let path = 'so/' . a:ArgLead . '*'
	let ret = split(globpath(&rtp, path), '\n')
	call filter(ret, 'v:val =~ "\.vim$"')
	" XXX ����ļ�����������ܲ���
	call map(ret, 'fnamemodify(v:val, '':t:r'')')
	return ret
endfunction
"  ȡ�ù�괦��ƥ��[[[2
function Lilydjwg_get_pattern_at_cursor(pat)
	let col = col('.') - 1
	let line = getline('.')
	let ebeg = -1
	let cont = match(line, a:pat, 0)
	while (ebeg >= 0 || (0 <= cont) && (cont <= col))
		let contn = matchend(line, a:pat, cont)
		if (cont <= col) && (col < contn)
			let ebeg = match(line, a:pat, cont)
			let elen = contn - ebeg
			break
		else
			let cont = match(line, a:pat, contn)
		endif
	endwhile
	if ebeg >= 0
		return strpart(line, ebeg, elen)
	else
		return ""
	endif
endfunction
"   �л���ɫ����[[[2
function Lilydjwg_toggle_color()
	let colors = ['pink_lily', 'lilypink', 'darkBlue', 'spring2']
	" spring2 �������˲�ɫ�ն�֧�ֵ� spring
	if !exists("g:colors_name")
		let g:colors_name = 'pink_lily'
	endif
	let i = index(colors, g:colors_name)
	let i = (i+1) % len(colors)
	exe 'colorscheme ' . get(colors, i)
endfunction
" �� snippets �ļ�[[[2
function Lilydjwg_snippets(ft)
	let d = g:neosnippet#snippets_directory
	if a:ft == ''
		exe 'tabe '.d.'/'.&ft.'.snip'
	else
		exe 'tabe '.d.'/'.a:ft.'.snip'
	endif
endfunction
"   %xx -> ��Ӧ���ַ�(����Ϣ)[[[2
function Lilydjwg_hexchar()
	let chars = Lilydjwg_get_pattern_at_cursor('\(%[[:xdigit:]]\{2}\)\+')
	if chars == ''
		echohl WarningMsg
		echo '�ڹ�괦δ����%��ʾ��ʮ�������ַ�����'
		echohl None
		return
	endif
	let str = substitute(chars, '%', '\\x', 'g')
	exe 'echo "'. str . '"'
endfunction
"  �û��������[[[2
function Lilydjwg_open_url()
	let s:url = Lilydjwg_get_pattern_at_cursor('\v%(https?://|ftp://|file:/{3}|www\.)%(\w|[.-])+%(:\d+)?%(/%(\w|[~@#$%^&+=/.?:-])*[^,.?:''"-])?')
	if s:url == ""
		echohl WarningMsg
		echomsg '�ڹ�괦δ����URL��'
		echohl None
	else
		echo '��URL��' . s:url
		if has("win32") || has("win64")
			" start ���ǳ���������Ч�����ң�cmd ֻ��ʹ��˫����
			" call system("start '" . s:url . "'")
			call system("cmd /q /c start \"" . s:url . "\"")
		elseif has("mac")
			call system("open '" . s:url . "'")
		else
			" call system("gnome-open " . s:url)
			call system("setsid firefox '" . s:url . "' &")
		endif
	endif
	unlet s:url
endfunction
"  Title Save [[[2
function Lilydjwg_TSave()
	let line = getline(1)
	if line =~ '^\s*$'
		let line = getline(2)
	endif
	let line = substitute(line, '[:/\\]', '-', 'g')
	let line = substitute(line, '^\s\+', '', 'g')
	let line = substitute(line, '\s\+$', '', 'g')
	let line = substitute(line, ' ', '\\ ', 'g')
	let line = substitute(line, '\r', '', 'g')
	exe 'sav ' . line . '.txt'
endfunction
"  �л� ve [[[2
function Lilydjwg_toggle_ve()
	if &ve == 'all'
		let &ve = ''
	else
		let &ve = 'all'
	endif
endfunction
"  �л� ambiwidth [[[2
function Lilydjwg_toggle_ambiwidth()
	if &ambiwidth == 'double'
		let &ambiwidth = 'single'
	else
		let &ambiwidth = 'double'
	endif
endfunction
"  ���ռ��ļ� [[[2
function Lilydjwg_edit_diary()
	if exists("g:my_diary_file") && filewritable(expand(g:my_diary_file))
		exe 'e '.g:my_diary_file
		normal gg
	else
		echoerr "Diary not set or not exists!"
	endif
endfunction
"  �Ƿ�õ��� cycle��[[[2
function Lilydjwg_trycycle(dir)
	let pat = Lilydjwg_get_pattern_at_cursor('[+-]\?\d\+')
	if pat
		if a:dir ==? 'x'
			return "\<C-X>"
		else
			return "\<C-A>"
		end
	else
		let mode = mode() =~ 'n' ? 'w' : 'v'
		let dir = a:dir ==? 'x' ? -1 : 1
		return ":\<C-U>call Cycle('" . mode . "', " . dir . ", v:count1)\<CR>"
	end
endfunction
" set ���[[[1
"   һ������[[[2
" maybe necessary when root
syntax on
" set guifont=��Ȫ��ȿ�����\ Medium\ 10
set number
set smarttab
set expandtab
" ��Ҫ���壬����Ҫ����
set visualbell t_vb=
" when will this cause problems?
set ttyfast
" ��Ҫ������׼����
set shellredir=>
autocmd GUIEnter * set t_vb=
" ! is for histwin to save tags
set viminfo='100,:10000,<50,s10,h,!
set history=10000
set wildmenu
set delcombine " ����ַ�һ������ɾ��
set laststatus=2 " ������ʾ״̬��
" ���ȳ�����ģ������ֻ���ȫ��
set wildmode=longest:full,full
set ambiwidth=double
set shiftround
set diffopt+=vertical,context:3,foldcolumn:0
set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1
set fileformats=unix,dos,mac
set formatoptions=croqn2mB1
try
	" Vim 7.4
	set formatoptions+=j
catch /.*/
endtry
set nojoinspaces
set virtualedit=block
set nostartofline
" set guioptions=egmrLtai
set guioptions=acit
" û��Ҫ�����Һܶ�ʱ�� = ��ʾ��ֵ
set isfname-==
set nolinebreak
set nowrapscan
set scrolloff=5
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize
set shiftwidth=2
set winaltkeys=no
set noequalalways
set listchars=eol:$,tab:>-,nbsp:~
set display=lastline
set completeopt+=longest
set maxcombine=4
set cedit=<C-Y>
set whichwrap=b,s,[,]
set tags+=./../tags,./../../tags,./../../../tags
try
	set matchpairs=(:),{:},[:],��:��,��:��,��:��,��:��,��:��,��:��,��:��,��:��
catch /^Vim\%((\a\+)\)\=:E474/
endtry
" Avoid command-line redraw on every entered character by turning off Arabic
" shaping (which is implemented poorly).
if has('arabic')
	set noarabicshape
endif
set wildignore+=*~,*.py[co],__pycache__,.*.swp
" Linux �� Windows �� [[[2
if has("gui_macvim")
	set macmeta
end
if has("win32") || has("win64")
	" Win ���� [[[3
	" �н��򲹶�Ҫ�� encoding Ϊ 'utf-8'
	" �������� encoding=utf-8 �ᵼ��״̬���ͱ�������Ϣ����
	" set encoding=utf-8
	" set fileencoding=cp936
	" language messages zh_CN.UTF-8
	" set termencoding=cp936
	" set langmenu=chinese_gb.936
	" source $VIMRUNTIME/delmenu.vim
	" source $VIMRUNTIME/menu.vim
	" Win ·�� [[[3
	let g:vimfiles = split(&runtimepath, ',')[1]
	let g:mytmpdir = $TMP
	" Win ���� [[[3
	"   ��Ĭ�ϵĳ�����ļ�
	nmap <C-S-F5> :!"%"<CR>
	command Hex silent !winhex '%'
	command SHELL silent cd %:p:h|silent exe "!start cmd"|silent cd -
	command Nautilus silent !explorer %:p:h
	" Win ���� [[[3
	command FScreen simalt ~x
	command Fscreen simalt ~r
else
	" Linux ·�� [[[3
	let g:vimfiles = split(&runtimepath, ',')[0]
	if exists('$VIMTMP')
		let g:mytmpdir = $VIMTMP
	else
		let g:mytmpdir = expand("~/tmpfs")
	endif
	let my_diary_file = expand('~/secret/diary/2013.rj')
	let g:MuttVim_configfile = expand('~/scripts/python/pydata/muttvim.json')
	cmap <C-T> ~/tmpfs/
	" cron ��Ŀ¼��Ҫ����
	set backupskip+=/etc/cron.*/*
	set backupdir=.,~/temp,/tmp
	" Linux ���� [[[3
	"   ��Ĭ�ϵĳ�����ļ�
	nmap <C-S-F5> :!gnome-open "%"<CR>
	set grepprg=grep\ -nH\ $*
	command Hex silent !setsid ghex2 '%'
	command SHELL silent cd %:p:h|silent exe '!setsid xfce4-terminal'|silent cd -
	command Nautilus silent !nautilus %:p:h
	autocmd BufWritePost    * call Lilydjwg_chmodx()
	" Linux ���� [[[3
	command FScreen winpos 0 0|set lines=40|set columns=172
	command Fscreen set lines=40|set columns=88
endif
" ������� [[[3
if $LANGUAGE =~ '^zh' || ($LANGUAGE == '' && v:lang =~ '^zh')
	" �������� �ļ��� ���� �޸� ���� ֻ�� ���� ���з� BOM ======== �ַ����� λ�� �ٷֱ�λ��
	set statusline=%n\ %<%f\ %L��\ %{&modified?'[+]':&modifiable\|\|&ft=~'^\\vhelp\|qf$'?'':'[-]'}%h%r%{&fenc=='utf-8'\|\|&fenc==''?'':'['.&fenc.']'}%{&ff=='unix'?'':'['.&ff.']'}%{&bomb?'[BOM]':''}%{&eol?'':'[noeol]'}%=\ 0x%-4.8B\ \ \ \ %-14.(%l,%c%V%)\ %P
else
	set statusline=%n\ %<%f\ %LL\ %{&modified?'[+]':&modifiable\|\|&ft=~'^\\vhelp\|qf$'?'':'[-]'}%h%r%{&fenc=='utf-8'\|\|&fenc==''?'':'['.&fenc.']'}%{&ff=='unix'?'':'['.&ff.']'}%{&bomb?'[BOM]':''}%{&eol?'':'[noeol]'}%=\ 0x%-4.8B\ \ \ \ %-14.(%l,%c%V%)\ %P
endif
" ·����� [[[3
let g:VEConf_favorite = g:vimfiles . "/ve_favorite"
let g:NERDTreeBookmarksFile = g:vimfiles . "/NERDTreeBookmarks"
let g:dictfilePrefix = g:vimfiles . "/dict/"
if has("python3")
	exe "py3file" g:vimfiles . "/vimrc.py"
endif
let g:undodir = g:mytmpdir . "/.vimundo"
let &errorfile= g:mytmpdir . "/.error"
" ͼ�����ն� [[[2
let colorscheme = 'lilypink'
if has("gui_running")
	set mousemodel=popup
	" ��Щ�ն˲��ܸı��С
	set columns=88
	set lines=38
	set cursorline
	exe 'colorscheme' colorscheme
elseif has("unix")
	set ambiwidth=single
	" ��ֹ�˳�ʱ�ն�����
	" �������߶���Ҫ��ֻǰ�߱�����ظ���ֻ���߻�����
	set t_fs=(B
	set t_IE=(B
	if &term =~ "256color"
		set cursorline
		exe 'colorscheme' colorscheme
	else
		" ��Linux�ı��ն��·ǲ���ģʽ��ʾ��״���
		if &term == "linux" || &term == "fbterm"
			set t_ve+=[?6c
			autocmd InsertEnter * set t_ve-=[?6c
			autocmd InsertLeave * set t_ve+=[?6c
			" autocmd VimLeave * set t_ve-=[?6c
		endif
		if &term == "fbterm"
			set cursorline
			exe 'colorscheme' colorscheme
		elseif $TERMCAP =~ 'Co#256'
			set t_Co=256
			set cursorline
			exe 'colorscheme' colorscheme
		else
			" ��ʱֻ�������ɫ�Ƚ��ʺ���
			colorscheme default
			" ���ն��£���������ڣ����Զ�����vimim���뷨
			if len(split(globpath(&rtp, 'so/vimim.wubi.txt'), '\n')) > 0
				runtime so/vimim.vim
			endif
		endif
	endif
	" �ڲ�ͬģʽ��ʹ�ò�ͬ��ɫ�Ĺ��
	" ��Ҫ�� ssh ��ʹ��
	if &term =~ "256color" && !exists('$SSH_TTY')
		let color_normal = 'HotPink'
		let color_insert = 'RoyalBlue1'
		let color_exit = 'green'
		if &term =~ 'xterm\|rxvt'
			call writefile(["\e]12;" . color_normal . "\7"], "/dev/tty", "b")
			let &t_SI="\e]12;" . color_insert . "\7"
			let &t_EI="\e]12;" . color_normal . "\7"
			exe 'autocmd VimLeave * :call writefile(["\e]12;' . color_exit . '\7"], "/dev/tty", "b")'
		elseif &term =~ "screen"
			if exists('$TMUX')
				if &ttymouse == 'xterm'
					set ttymouse=xterm2
				endif
				call writefile(["\33Ptmux;\33\e]12;" . color_normal . "\7\33\\"], "/dev/tty", "b")
				let &t_SI="\33Ptmux;\33\e]12;" . color_insert . "\7\33\\"
				let &t_EI="\33Ptmux;\33\e]12;" . color_normal . "\7\33\\"
				exe 'autocmd VimLeave * :call writefile(["\33Ptmux;\33\e]12;' .
							\ color_exit . '\7\33\\"], "/dev/tty", "b")'
			elseif !exists('$SUDO_UID') " or it may still be in tmux
				call writefile(["\33P\e]12;" . color_normal . "\7\33\\"], "/dev/tty", "b")
				let &t_SI="\33P\e]12;" . color_insert . "\7\33\\"
				let &t_EI="\33P\e]12;" . color_normal . "\7\33\\"
				exe 'autocmd VimLeave * :call writefile(["\33P\e]12;' .
							\ color_exit . '\7\33\\"], "/dev/tty", "b")'
			endif
		endif
		unlet color_normal
		unlet color_insert
		unlet color_exit
	endif
endif
unlet colorscheme
" ��ͬ�� Vim �汾 [[[2
if has("conceal")
	" 'i' is for neosnippet
	set concealcursor=nci
	set conceallevel=2
endif
if has("persistent_undo")
	let &undodir=g:undodir
	if !isdirectory(&undodir)
		call mkdir(&undodir, 'p', 0700)
	endif
	set undofile
endif
if v:version > 702
	set cryptmethod=blowfish
endif
unlet g:undodir
let g:silent_unsupported = 1
" map ���[[[1
"   nmap [[[2
"     Fx ��� [[[3
nmap <F2> <Leader>be
nmap <F4> :ls<CR>:buffer
nmap <F6> :cnext<CR>
nmap <S-F6> :cprevious<CR>
nmap <silent> <F9> :enew<CR>
nmap <silent> <F8> :GundoToggle<CR>
nmap <F11> :next<CR>
nmap <S-F11> :previous<CR>
nmap <S-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"     �������뵱ǰ�ļ�
nmap <F5> :e!<CR>
"     t ��ͷ [[[3
nmap <silent> tt :tabnew<CR>
nmap t= mxHmygg=G`yzt`x
nmap ta ggVG
nmap <silent> tf :call Lilydjwg_open_url()<CR>
"     less style �������
nmap <silent> <M-u> :nohls<CR>
nmap tj Jx
nnoremap tl ^vg_
nmap <silent> to :call append('.', '')<CR>j
nmap <silent> tO :call append(line('.')-1, '')<CR>k
nmap tp "+P
nmap <silent> tv :call Lilydjwg_toggle_ve()<CR>
nmap tw :call Lilydjwg_toggle_ambiwidth()<CR>
"     w ��ͷ [[[3
nmap wc :set cursorline!<CR>
nmap wd :diffsplit
nnoremap <silent> wf :call Lilydjwg_NERDTreeOpen()<CR>
nnoremap <silent> wn :call Lilydjwg_toggle_number()<CR>
nnoremap <silent> wt :TlistToggle<CR>
nnoremap <silent> wb :TagbarToggle<CR>
"     - ��ͷ [[[3
nmap -+ :set nomodified<CR>
nmap -c :call Lilydjwg_toggle_color()<CR>
nmap -ft :exe 'tabe '.g:vimfiles.'/ftplugin/'.&ft.'.vim'<CR>
nmap -syn :exe 'tabe '.g:vimfiles.'/syntax/'.&ft.'.vim'<CR>
nmap -int :exe 'tabe '.g:vimfiles.'/indent/'.&ft.'.vim'<CR>
"     ��ʾ������ [[[4
nnoremap wh :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"     Alt ��ϼ� [[[3
nmap <M-m> :MRU
" �򿪲ݸ�
nmap <unique> <silent> <M-s> <Plug>ShowScratchBuffer
for i in range(1, 9)
	exec 'nnoremap <silent> <M-' . i . '> '. i .'gt'
endfor
"     lusty-explorer [[[4
nmap <M-b> :LustyBufferExplorer<CR>
nmap <M-g> :LustyBufferGrep<CR>
nmap <M-l> :LustyFilesystemExplorerFromHere<CR>
let g:LustyExplorerSuppressRubyWarning = 1
"     FuzzyFinder [[[4
nmap <M-L> :FufFile<CR>
"     ������ͷ�� [[[3
nmap <silent> <C-Tab> :tabnew<CR>
nmap <BS> <C-O>
nmap <C-D> <C-W>q
nnoremap <Space> za
nmap ' <C-W>
nmap Y y$
nmap 'm :MarksBrowser<CR>
nmap :: :!
nmap cd :lcd %:p:h<CR>:echo expand('%:p:h')<CR>
nmap gb :setl fenc=gb18030<CR>
nmap d<CR> :%s/\r//eg<CR>``
nmap cac :call Lilydjwg_changeColor()<CR>
nmap gl :IndentGuidesToggle<CR>
nnoremap <silent> gs :echo Lilydjwg_getfsize(expand('%'))<CR>
"   imap [[[2
inoremap <S-CR> <CR>
inoremap <M-c> <C-R>=Lilydjwg_colorpicker()<CR>
inoremap <C-J> <C-P>
inoremap <M-j> <C-N>
inoremap <M-q> <C-R>=Lilydjwg_qw()<CR>
imap <S-BS> <C-W>
cmap <S-BS> <C-W>
"     ���ں�ʱ�� [[[3
imap <silent> <F5> <C-R>=Lilydjwg_zh_date()<CR>
imap <silent> <S-F5> <C-R>=strftime("%Y-%m-%d")<CR>
imap <silent> <C-F5> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
"     ��ȫ [[[3
imap <F2> <C-X><C-O>
imap <F3> <C-X><C-F>
imap <S-F3> <C-X><C-L>
imap <F7> <C-R>=Lilydjwg_dictcomplete()<CR>
"     ��ȫ���
inoremap <expr> <C-L> pumvisible()?"\<C-E>\<C-N>":"\<C-N>"
"   vmap [[[2
vnoremap <Leader># "9y?<C-R>='\V'.substitute(escape(@9,'\?'),'\n','\\n','g')<CR><CR>
vnoremap <Leader>* "9y/<C-R>='\V'.substitute(escape(@9,'\/'),'\n','\\n','g')<CR><CR>
vnoremap <C-C> "+y
"     �������� [[[3
vmap �� <ESC>`<i��<ESC>`>a��<ESC>
vmap �� <ESC>`>a��<ESC>`<i��<ESC>
"   cmap [[[2
"     ����������
"     FIXME �������� wildmenu ��ȫʱ���е����
cmap <C-P> <Up>
cmap <C-N> <Down>
cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>
"   g[jk] [[[2
nmap <M-j> gj
nmap <M-k> gk
vmap <M-j> gj
vmap <M-k> gk
"     �� % ��ʾ���ַ� [[[2
map <silent> t% :w !ascii2uni -a J -q<CR>
nmap <silent> t% :call Lilydjwg_hexchar()<CR>
"     HTML ת�� [[[2
"     I got the idea from unimpaired.vim
noremap <silent> [x :HTMLEscape<CR>
noremap <silent> ]x :HTMLUnescape<CR>
nnoremap <silent> [x :.HTMLEscape<CR>
nnoremap <silent> ]x :.HTMLUnescape<CR>
"     Ctrl-S �����ļ� [[[2
nmap <silent> <C-S> :update<CR>
imap <silent> <C-S> <ESC>:update<CR>
vmap <silent> <C-S> <ESC>:update<CR>
"     �������ص�ǰ��������[[[2
nmap <F12> :tabnew<CR>
imap <F12> <ESC>:tabnew<CR>
vmap <F12> <ESC>:tabnew<CR>
"     Shift+������[[[2
if v:version < 703
	nmap <silent> <S-MouseDown> zhzhzh
	nmap <silent> <S-MouseUp> zlzlzl
	vmap <silent> <S-MouseDown> zhzhzh
	vmap <silent> <S-MouseUp> zlzlzl
else
	map <S-ScrollWheelDown> <ScrollWheelRight>
	map <S-ScrollWheelUp> <ScrollWheelLeft>
	imap <S-ScrollWheelDown> <ScrollWheelRight>
	imap <S-ScrollWheelUp> <ScrollWheelLeft>
endif
"     Shift+����м�[[[2
nnoremap <silent> <S-MiddleMouse> "+P
inoremap <silent> <S-MiddleMouse> <C-R>+
"     �����ƶ�һ������[[[2
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z
" �Զ�����[[[1
"   �Զ��ر�Ԥ�����ڣ�������������ڣ�����������һ��������
let s:cmdwin = 0
autocmd CmdwinEnter        * let s:cmdwin = 1
autocmd CmdwinLeave        * let s:cmdwin = 0
autocmd InsertLeave        * if s:cmdwin == 0 && pumvisible() == 0|pclose|endif
autocmd BufReadCmd *.maff,*.xmind,*.crx,*.apk  call zip#Browse(expand("<amatch>"))
autocmd BufRead */WualaDrive/* setl noswapfile
"   �� ft-syntax-omni
if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
				\ if &omnifunc == "" |
				\   setlocal omnifunc=syntaxcomplete#Complete |
				\ endif
endif
" �Զ�������[[[1
" ���� xxx: xxx ��������
" .vimrc �п�����������
exe 'command Set tabe ' . escape(resolve($MYVIMRC), ' ')
" ɾ����ǰ�ļ�
command Delete if delete(expand('%')) | echohl WarningMsg | echo "ɾ����ǰ�ļ�ʧ��" | echohl None | endif
command -nargs=1 -range=% -bang Join <line1>,<line2>call Lilydjwg_join(<q-args>, "<bang>")
command -nargs=+ Reindent call Lilydjwg_reindent(<f-args>)
" TODO better implement
command -range=% ClsXML <line1>,<line2>!tidy -utf8 -iq -xml
command -range=% ClsHTML <line1>,<line2>!tidy -utf8 -iq -omit -w 0
command MB tabe ~/temp/mb
command -nargs=1 -complete=customlist,Lilydjwg_complete_So So runtime so/<args>.vim
"   ��ȡ�������ݲ�������뵽��ǰ�����
command -nargs=1 -complete=command ReadCommand redir @">|exe "<args>"|normal $p:redir END<CR>
command -nargs=1 Delmark delm <args>|wviminfo!
"   ɾ������
command -range=% -bar DBlank <line1>,<line2>g/^\s*$/d_|nohls
"   ĳ�� pattern ���ֵĴ���
command -range=% -nargs=1 Count <line1>,<line2>s/<args>//gn|nohls
command -range=% -bar SBlank <line1>,<line2>s/\v(^\s*$\n){2,}/\r/g
"   ɾ����β�Ŀհ�
command -range=% -bar TWS <line1>,<line2>s/\s\+$//|nohls|normal ``
"   ���ó� Linux �����õĸ�ʽ
command Lin setl ff=unix fenc=utf8 nobomb eol
"   ���ó� Windows �����õĸ�ʽ
command Win setl ff=dos fenc=gb18030
"   �Ե�һ�е�����Ϊ�����浱ǰ�ļ�
command TSave call Lilydjwg_TSave()
command -nargs=? -complete=file RSplit vs <args>|normal <C-W>L<C-W>w
command -range=% -bar SQuote <line1>,<line2>s/��\|��\|��/"/ge|<line1>,<line2>s/��\|��\|��/'/ge
command -range -bar HTMLEscape <line1>,<line2>s/&/\&amp;/ge|<line1>,<line2>s/</\&lt;/ge|<line1>,<line2>s/>/\&gt;/ge
command -range -bar HTMLUnescape <line1>,<line2>s/&amp;/\&/ge|<line1>,<line2>s/&lt;/</ge|<line1>,<line2>s/&gt;/>/ge
command RJ silent call Lilydjwg_edit_diary()
"   ���� snippets
command -nargs=? Snippets silent call Lilydjwg_snippets("<args>")
"   �� VimExplorer ����򿪵�ǰ�ļ����ڵ�Ŀ¼
command Path VE %:p:h
command -nargs=1 Enc e ++bad=keep ++enc=<args> %
command CenterFull call CenterFull()
command -nargs=1 -range=% -complete=customlist,Lilydjwg_Align_complete LA <line1>,<line2>call Lilydjwg_Align("<args>")
command -nargs=1 -range=% Column <line1>,<line2>Align! w<args>0P1p \S\@<=\s\@=
command -range=% Paste <line1>,<line2>py3 LilyPaste()
command -range=% Tohtml call Lilydjwg_to_html(<line1>, <line2>)
command Agg exe 'Ag -Q ' . expand('<cword>')
" �������[[[1
"   neosnippet[[[2
let g:neosnippet#snippets_directory = g:vimfiles . '/snippets'
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"
"   neocomplete[[[2
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_prefetch = 0
" disable text mode completely
call neocomplete#util#disable_default_dictionary('g:neocomplete#text_mode_filetypes')
let g:neocomplete#same_filetypes = {}
let g:neocomplete#same_filetypes._ = '_'
"   rst_tables[[[2
let g:rst_tables_no_warning = 1
"   signify [[[2
let g:signify_vcs_list = ['git']
let g:signify_sign_overwrite = 0
" signify won't update on FocusGained anymore
let g:signify_disable_by_default = 1
"   ConflictMotions [[[2
" ���� \x ��ͷ��ӳ�䣻������ EnhancedCommentify ��ͻ��
let g:ConflictMotions_TakeMappingPrefix = ''
"   surround [[[2
"      ���� c���Ҹ�ϲ���� s
let g:surround_no_mappings = 1
" original
nmap ds  <Plug>Dsurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround
imap <C-G>s <Plug>Isurround
imap <C-G>S <Plug>ISurround
" mine
xmap c <Plug>VSurround
xmap C <Plug>VSurround
" cs is for cscope
nmap cS <Plug>Csurround
"   NrrRgn[[[2
let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_wdth = 80
let g:nrrw_rgn_hl = 'Folded'
"   easymotion[[[2
let EasyMotion_leader_key = '<M-q>'
let EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
"   cycle[[[2
"   https://github.com/lilydjwg/vim-cycle
nnoremap <expr> <silent> <C-X> Lilydjwg_trycycle('x')
vnoremap <expr> <silent> <C-X> Lilydjwg_trycycle('x')
nnoremap <expr> <silent> <C-A> Lilydjwg_trycycle('p')
vnoremap <expr> <silent> <C-A> Lilydjwg_trycycle('p')
nnoremap <Plug>CycleFallbackNext <C-A>
nnoremap <Plug>CycleFallbackPrev <C-X>
let g:cycle_no_mappings = 1
let g:cycle_default_groups = [
			\ [['true', 'false']],
			\ [['yes', 'no']],
			\ [['and', 'or']],
			\ [['on', 'off']],
			\ [['>', '<']],
			\ [['==', '!=']],
			\ [['��', '��']],
			\ [['��', '��']],
			\ [["in", "out"]],
			\ [["min", "max"]],
			\ [["get", "post"]],
			\ [["to", "from"]],
			\ [["read", "write"]],
			\ [['with', 'without']],
			\ [["exclude", "include"]],
			\ [["asc", "desc"]],
			\ [["next", "prev"]],
			\ [["encode", "decode"]],
			\ [["left", "right"]],
			\ [["hide", "show"]],
			\ [['��:��', '��:��'], 'sub_pairs'],
			\ [['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
			\ 'Friday', 'Saturday'], 'hard_case', {'name': 'Days'}],
			\ [["enable", "disable"]],
			\ [["add", "remove"]],
			\ ]
"   Erlang[[[2
let g:erlangHighlightBif = 1
let g:erlangFold = 1
"   CountJump[[[2
"   Regex in Javascript, etc
call CountJump#TextObject#MakeWithCountSearch('', '/', 'ai', 'v', '\\\@<!/', '\\\@<!/')
call CountJump#TextObject#MakeWithCountSearch('', ':', 'ai', 'v', '\\\@<!:', '\\\@<!:')
call CountJump#TextObject#MakeWithCountSearch('', '_', 'ai', 'v', '_', '_')
call CountJump#TextObject#MakeWithCountSearch('', '<Tab>', 'ai', 'v', '\t', '\t')
"   colorizer.vim[[[2
let g:colorizer_nomap = 1
let g:colorizer_startup = 0
"   grep.vim[[[2
let g:Grep_Default_Options = '--binary-files=without-match'
"   NERDTree[[[2
let g:NERDTreeMapToggleZoom = 'a'
let g:NERDTreeMapToggleHidden = 'h'
"   ���ƽ̨��ز���
"   DirDiff[[[2
let g:DirDiffDynamicDiffText = 1
let g:DirDiffExcludes = "*~,*.swp"
let g:DirDiffWindowSize = 20
"   gundo[[[2
let gundo_preview_bottom = 1
let gundo_prefer_python3 = 1
"   bufexplorer[[[2
let g:bufExplorerFindActive = 0
"   tagbar[[[2
let g:tagbar_type_dosini = {
			\ 'ctagstype': 'ini',
			\ 'kinds': ['s:sections', 'b:blocks'],
			\ }
let g:tagbar_type_pgsql = {
			\ 'ctagstype': 'pgsql',
			\ 'kinds': ['f:functions', 't:tables'],
			\ }
"   taglist[[[2
let Tlist_Show_One_File = 1
let tlist_vimwiki_settings = 'wiki;h:headers'
let tlist_tex_settings = 'latex;h:headers'
let tlist_tracwiki_settings = 'wiki;h:headers'
let tlist_diff_settings = 'diff;f:file'
let tlist_git_settings = 'diff;f:file'
let tlist_gitcommit_settings = 'gitcommit;f:file'
let tlist_privoxy_settings = 'privoxy;s:sections'
"  ��Դ http://gist.github.com/476387
let tlist_html_settings = 'html;h:Headers;o:IDs;c:Classes'
let tlist_dosini_settings = 'ini;s:sections'
let tlist_go_settings = 'go;f:functions;v:variables;d:types'
let tlist_pgsql_settings = 'pgsql;f:functions;t:tables'
let tlist_markdown_settings = 'markdown;h:headers'
hi link MyTagListFileName Type
"   2html.vim, ʹ��XHTML��ʽ[[[2
let use_xhtml = 1
"   shell �ű����۵�
let g:sh_fold_enabled = 3 " �򿪺����� here �ĵ����۵�
"   Align[[[2
let g:Align_xstrlen = 4 " use strdisplaywidth
"   Lilydjwg_Align
"   Meanings:
"     colon:     dict definition like 'key: value,'
"     colonl:    list items like this one
"     comment:   #-style comments
"     jscomment: //-style comments
let g:Myalign_def = {
			\   'colon':     ['WP0p1l:', ':\@<=', 'g ,'],
			\   'colonl':    ['WP0p1l:', ':\@<='],
			\   'comma':     ['WP0p1l:', ',\@<=', 'g ,'],
			\   'commalist': ['WP0p1l', ',\@<=', 'g ,'],
			\   'comment':   ['WP1p1l:', '#'],
			\   'css':       ['WP0p1l:', ':\@<=', 'v \v^\s*/\*|\{|\}'],
			\   'define':    ['WP0p1l:', ' \d\@=', 'g ^#define\s'],
			\   'jscomment': ['WP0p1l:', '//'],
			\ }
"   EnhancedCommentify[[[2
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyUseSyntax = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyBindInInsert = 'No'
let g:EnhCommentifyMultiPartBlocks = 'Yes'
let g:EnhCommentifyCommentsOp = 'Yes'
let g:EnhCommentifyAlignRight = 'Yes'
let g:EnhCommentifyUseBlockIndent = 'Yes'
"   indent/html.vim[[[2
let g:html_indent_inctags = "html,body,head,tbody,p,li,dd,marquee,header,nav,article,section"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"   mru[[[2
let MRU_File = g:vimfiles . '/vim_mru_files'
let MRU_Max_Entries = 2000
let MRU_Exclude_Files = '\v^.*\~$|/COMMIT_EDITMSG$|/itsalltext/|^/tmp/'
"  ���ز˵�̫��ʱ
let MRU_Add_Menu = 0
"   syntax/haskell.vim[[[2
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1
"   syntax/python.vim[[[2
let python_highlight_all = 1
"   syntax/vim.vim Ĭ�ϻ���� s:[a-z] �����ĺ�����Ϊ����[[[2
let g:vimsyn_noerror = 1
let g:netrw_list_hide = '^\.[^.].*'
"   tasklist[[[2
let g:tlTokenList = ["FIXME", "TODO", "XXX", "NotImplemented"]
"   vimExplorer[[[2
let g:VEConf_showHiddenFiles = 0
"   ���ƽ̨��ز���
"   ��Ҫռ�� ' ��ӳ��
let g:VEConf_fileHotkey = {}
let g:VEConf_fileHotkey.gotoPlace = '`'
let g:VEConf_fileHotkey.help = '<F1>'
let g:VEConf_treeHotkey = {}
let g:VEConf_treeHotkey.help = '<F1>'
let g:VEConf_treeHotkey.toggleNode = '<Space>'
"   VimIm����Ҫ���ĵ����˵�����ɫ[[[2
let g:vimim_menu_color = 1
"   vimwiki[[[2
let g:vimwiki_list = [{'path': '~/.vimwiki/'}]
let g:vimwiki_camel_case = 0
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_folding = 0
let g:vimwiki_browsers = ['firefox']
let g:vimwiki_CJK_length = 1
let g:vimwiki_dir_link = 'index'
let g:vimwiki_html_header_numbering = 2
let g:vimwiki_conceallevel = 2
"   xml.vim��ʹ���еı�ǩ���ر�[[[2
let xml_use_xhtml = 1
"   netrw��elinks���У�ʹ��curl��
if executable("curl")
	let g:netrw_http_cmd  = "curl"
	let g:netrw_http_xcmd = "--compressed -o"
endif
" cscope setting [[[1
if has("cscope") && executable("cscope")
	" ���� [[[2
	set csto=1
	set cst
	set cscopequickfix=s-,c-,d-,i-,t-,e-

	" add any database in current directory
	function Lilydjwg_csadd()
		set nocsverb
		if filereadable("cscope.out")
			cs add cscope.out
		endif
		set csverb
	endfunction

	autocmd BufRead *.c,*.cpp,*.h call Lilydjwg_csadd()

	" ӳ�� [[[2
	" ����C���Է��ţ������Һ��������ꡢö��ֵ�ȳ��ֵĵط�
	nmap css :cs find s <C-R>=expand("<cword>")<CR><CR>
	" ���Һ������ꡢö�ٵȶ����λ�ã�����ctags���ṩ�Ĺ���
	nmap csg :cs find g <C-R>=expand("<cword>")<CR><CR>
	" ���ұ��������õĺ���
	nmap csd :cs find d <C-R>=expand("<cword>")<CR><CR>
	" ���ҵ��ñ������ĺ���
	nmap csc :cs find c <C-R>=expand("<cword>")<CR><CR>
	" ����ָ�����ַ���
	nmap cst :cs find t <C-R>=expand("<cword>")<CR><CR>
	" ����egrepģʽ���൱��egrep���ܣ��������ٶȿ����
	nmap cse :cs find e <C-R>=expand("<cword>")<CR><CR>
	" ���Ҳ����ļ�������vim��find����
	nmap csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	" ���Ұ������ļ����ļ�
	nmap csi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	" �����µ����ݿ�
	nmap csn :lcd %:p:h<CR>:!my_cscope<CR>
	" �Լ�����������
	nmap cs<Space> :cs find
endif
" ��� [[[1
runtime local.vim
" vim:fdm=marker:fmr=[[[,]]]
