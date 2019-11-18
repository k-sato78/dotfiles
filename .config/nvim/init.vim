"
" エスケープで英数字の入力にする
if has('mac')
  set ttimeoutlen=1
  let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
  augroup MyIMEGroup
    autocmd!
    autocmd InsertLeave * :call system(g:imeoff)
  augroup END
  noremap <silent> <ESC> <ESC>:call system(g:imeoff)<CR>
endif

"LeaderLeader init.vim
if !&compatible
	set nocompatible
endif

" reset augroup
augroup MyAutoCmd
	autocmd!
augroup END
" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let g:outher_package_path = expand('~/.config/nvim/other_pacage')
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
	call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
"""{{{ NERDTree
map <Leader>e NERDTreeToggle<CR>
let NERDTreeShowHidden=1
"}}}
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#load_toml(s:toml_file)
	call dein#end()
	call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
	call dein#install()
endif
" }}}
"連続vepで同じものを貼り付けられるようにする
nnoremap cp ve"8d"0p
"jjでinsertからぬける
inoremap <silent> jj <ESC>
"バッファ移動
" nnoremap <silent> <C-j> :bprev<CR>
" nnoremap <silent> <C-k> :bnext<CR>


"その他
"leaderをスペースキーに割り当て
let mapleader = "\<Space>"
"色
autocmd ColorScheme * highlight Visual   gui=bold  guifg=#bce2e8 guibg=#00a1e9
"syntax on
" 256色¬
set t_Co=256
" truecolor¬
set termguicolors
" 背景色¬
set background=dark
colorscheme iceberg
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set expandtab
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
"連続した空白に対するカーソルの動く幅
set softtabstop=2
"自動インデント
set smartindent
set autoindent
"行番号の表示
set number
set relativenumber
"カーソルの左右移動で行末から行頭への移動
set whichwrap=b,s,h,l,<,>,[,],~
"行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" 行の最初の文字の前にコメント文字をトグル
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
" 行頭にコメントをトグル
nmap <Leader>, <Plug>(caw:zeropos:toggle)
vmap <Leader>, <Plug>(caw:zeropos:toggle)
"Yで行末までヤンク
nnoremap Y y$
"クリップボード共有
set clipboard+=unnamed

"Quick run 下画面で起動
" let g:quickrun_config={'*': {'split': ''}}
" vimprocで非同期実行
" 成功時にバッファ、失敗時にQuickFixで表示
" 結果表示のサイズ調整など
let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 40,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : ':botright 8sp',
    \ }
\}

" 実行時に前回の表示内容をクローズ&保存してから実行
let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>

"文末の空白消す
autocmd BufWritePre * :%s/\s\+$//ge

" Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'papercolor'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:tmuxline_preset = {
			\'a'    : '#S',
			\'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
			\'win'  : ['#I', '#W'],
			\'cwin' : ['#I', '#W', '#F'],
			\'x'    : '#(date)',
			\'y'    : ['%R', '%a', '%Y'],
			\'z'    : '#H'}
let g:tmuxline_theme = 'papercolor'
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme * call ZenkakuSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()
endif
""" {{{ md
au BufRead,BufNewFile *.md set filetype=markdown
" nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー 
" プレビューと同時にフォーカスをiTerm2に戻したければ､以下を参考にします """{{{
" ただし、注意として､「command -bar PrevimOpen...」のように「-bar」オプションを付ける必要があります。
" http://mba-hack.blogspot.jp/2013/09/mac.html

"""}}}
" 自動で折りたたまないようにする
let g:instant_markdown_autostart = 0
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime = 0
let g:vim_markdown_conceal = 0
let g:previm_disable_default_css = 1
let g:previm_custom_css_path = '~/dotfiles/templates/previm/markdown.css'
" Markdown プレビュー {{{
" nnoremap <silent> <C-p> :InstantMarkdownPreview<CR> |:silent !open -a it2_f &<CR>
nnoremap <silent> <C-p> :MarkdownPreview<CR> <bar> :sleep 1 <bar> :silent !open -a it2_f <CR>

" nnoremap <silent> <C-p> <Plug>MarkdownPreviewToggle<CR> |:silent !open -a it2_f &<CR>
" nnoremap <silent> <F7> :PrevimOpen \|:Silent open -a it2_f &<CR>
"nmap <silent> <Leader>j <Plug>(ChromeScrollDown)
"nmap <silent> <Leader>k <Plug>(ChromeScrollUp)
" nmap <silent> <Leader>q <Plug>(ChromeTabClose)
" nmap <buffer> <Leader>f <Plug>(ChromeKey)

"call submode#enter_with('cscroll', 'n', '', '<Leader>j', ':ChromeScrollDown<CR>')
"call submode#enter_with('cscroll', 'n', '', '<Leader>k', ':ChromeScrollUp<CR>')
"call submode#leave_with('cscroll', 'n', '', 'n')
"call submode#map('cscroll', 'n', '', 'j', ':ChromeScrollDown<CR>')
"call submode#map('cscroll', 'n', '', 'k', ':ChromeScrollUp<CR>')

"" Auto Scroll
" nmap <silent> <Leader>j <Plug>(ChromeAutoScrollDown)
" nmap <Leader>js <Plug>(ChromeAutoScrollDownStop)
" nmap <silent> <Leader>k <Plug>(ChromeAutoScrollUp)
" nmap <Leader>ks <Plug>(ChromeAutoScrollUpStop)
"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'


" }}


"}}}
"
"{{{
" 入力キーの辞書
let s:compl_key_dict = {
      \ char2nr("\<C-l>"): "\<C-x>\<C-l>",
      \ char2nr("\<C-n>"): "\<C-x>\<C-n>",
      \ char2nr("\<C-p>"): "\<C-x>\<C-p>",
      \ char2nr("\<C-k>"): "\<C-x>\<C-k>",
      \ char2nr("\<C-t>"): "\<C-x>\<C-t>",
      \ char2nr("\<C-i>"): "\<C-x>\<C-i>",
      \ char2nr("\<C-]>"): "\<C-x>\<C-]>",
      \ char2nr("\<C-f>"): "\<C-x>\<C-f>",
      \ char2nr("\<C-d>"): "\<C-x>\<C-d>",
      \ char2nr("\<C-v>"): "\<C-x>\<C-v>",
      \ char2nr("\<C-u>"): "\<C-x>\<C-u>",
      \ char2nr("\<C-o>"): "\<C-x>\<C-o>",
      \ char2nr('s'): "\<C-x>s",
      \ char2nr("\<C-s>"): "\<C-x>s"
      \}
" 表示メッセージ
let s:hint_i_ctrl_x_msg = join([
      \ '<C-l>: While lines',
      \ '<C-n>: keywords in the current file',
      \ "<C-k>: keywords in 'dictionary'",
      \ "<C-t>: keywords in 'thesaurus'",
      \ '<C-i>: keywords in the current and included files',
      \ '<C-]>: tags',
      \ '<C-f>: file names',
      \ '<C-d>: definitions or macros',
      \ '<C-v>: Vim command-line',
      \ "<C-u>: User defined completion ('completefunc')",
      \ "<C-o>: omni completion ('omnifunc')",
      \ "s: Spelling suggestions ('spell')"
      \], "\n")
function! s:hint_i_ctrl_x() abort
  echo s:hint_i_ctrl_x_msg
  let c = getchar()
  return get(s:compl_key_dict, c, nr2char(c))
endfunction

inoremap <expr> <C-x>  <SID>hint_i_ctrl_x()
"}}}
"{{{ denite
" noremap <Leader>u :Denite -mode=normal buffer file_mru file<CR>
" noremap <Leader>f :Denite -mode=normal file<CR>
" noremap <Leader>r :Denite -mode=normal file_mru<CR>
" noremap <Leader>b :Denite -mode=normal buffer<CR>
"}}}
"{{{ 画面移動
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
"}}}
"ヤンクを消さないように
noremap PP "0p
noremap x "_x
"{{{md table
let g:table_mode_corner = '|'
"}}}
"{{{
nmap <F6> <ESC>i<C-R>=strftime("%y/%m/%d %H:%M")<CR>
"}}}
" Vim終了時に現在のセッションを保存する
au VimLeave * mks!  ~/vimsession

"引数なし起動の時、前回のsessionを復元
autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | source ~/vimsession | endif
function! s:GetBufByte()
    let byte = line2byte(line('$') + 1)
    if byte == -1
        return 0
    else
        return byte - 1
    endif
endfunction


nnoremap <CR> G
nnoremap <BS> gg

" FZF
" fun! FzfOmniFiles()
"   let is_git = system('git status')
"   if v:shell_error
"     :Files
"   else
"     :GitFiles
"   endif
" endfun
" nnoremap <C-g> :Rg<Space>
" nnoremap <leader><leader> :Commands<CR>
" "nnoremap <C-p> :call FzfOmniFiles()<CR>
" vmap v <Plug>(expand_region_expand)
" vmap <C-v> <Plug>(expand_region_shrink)
" " vp doesn't replace paste buffer
"  function! RestoreRegister()
"    let @" = s:restore_reg
"      return ''
"      endfunction
"      function! s:Repl()
"        let s:restore_reg = @"
"          return "p@=RestoreRegister()\<cr>"
"          endfunction
"          vmap <silent> <expr> p <sid>Repl()
" CheatSheet
let g:cheatsheet#cheat_file = '~/dotfiles/vimCheatSheet.md'
" vim-operator-replace
map R <Plug>(operator-replace)
set hidden
" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nmap <Leader>; :Buffers<CR>
" nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Rg!<CR>
" nmap <Leader>s :Colors<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --follow -g "!{.git,node_modules}/*" 2>/dev/null'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!{*.lock,*-lock.json}" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:40%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" FZF color scheme updater from https://github.com/junegunn/fzf.vim/issues/59
function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['String',       'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['String',       'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code != ''
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ (empty(cols) ? '' : (' --color='.join(cols, ',')))
endfunction

augroup _fzf
  autocmd!
  autocmd VimEnter,ColorScheme * call <sid>update_fzf_colors()
augroup END
" Alt-W to delete a buffer and remove it from the list but keep the window via bufkill.vim
nmap <M-w>  :BD<CR>
" =======================================
" Boost your productivity with EasyMotion
" =======================================
" Disable default mappings
" If you are true vimmer, you should explicitly map keys by yourself.
" Do not rely on default bidings.
let g:EasyMotion_do_mapping = 0

" Or map prefix key at least(Default: <Leader><Leader>)
" map <Leader> <Plug>(easymotion-prefix)

" =======================================
" Find Motions
" =======================================
" Jump to anywhere you want by just `4` or `3` key strokes without thinking!
" `s{char}{char}{target}`
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
" Of course, you can map to any key you want such as `<Space>`
" map <Space>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" =======================================
" Line Motions
" =======================================
" `JK` Motions: Extend line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" keep cursor column with `JK` motions
let g:EasyMotion_startofline = 0

" =======================================
" General Configuration
" =======================================
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
" Show target key with upper case to improve readability
let g:EasyMotion_use_upper = 1
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1


" =======================================
" Search Motions
" =======================================
" Extend search motions with vital-over command line interface
" Incremental highlight of all the matches
" Now, you don't need to repetitively press `n` or `N` with EasyMotion
"feature
" `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
" :h easymotion-command-line
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
" ALE
" エラー行に表示するマーク
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" エラー表示の列を常時表示
let g:ale_sign_column_always = 1

" ファイルを開いたときにlint実行
let g:ale_lint_on_enter = 1
" ファイルを保存したときにlint実行
let g:ale_lint_on_save = 1
" 編集中のlintはしない
let g:ale_lint_on_text_changed = 'never'

" lint結果をロケーションリストとQuickFixには表示しない
" 出てると結構うざいしQuickFixを書き換えられるのは困る
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" 有効にするlinter
let g:ale_linters = {
\   'python': ['flake8'],
\   'markdown': [
\   {buffer, lines -> {'command': 'markdownlint -c ~/.config/markdownlint/markdownlint.json -o /dev/null %t', 'read_temporary_file': 1}}
\   ],
\}

" ALE用プレフィックス
nmap [ale] <Nop>
map <Leader>a [ale]
" エラー行にジャンプ
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)<Paste>
nnoremap Q <Nop>
noremap <Space>h  ^
noremap <Space>l  $
map <Leader>s <Plug>(operator-surround-append)
nnoremap /  /\v
" python syntax
let g:syntastic_python_checkers = ['pydocstyle', 'pycodestyle', 'pyflakes']
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let $BASH_ENV = "~/dotfiles/31_aliases_for_vim.zsh"
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
" 下に空行の挿入
noremap <Space><CR> o<ESC>

