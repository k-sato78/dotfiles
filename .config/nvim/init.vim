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
map <C-e> :NERDTreeToggle<CR>
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
"その他
"leaderをスペースキーに割り当て
let mapleader = "\<Space>"
"色
"colorscheme iceberg
"syntax on
" 256色¬
set t_Co=256
" truecolor¬
set termguicolors
" 背景色¬
set background=dark
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 行頭以外のTab文字の表示幅（スペースいくつ分）
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
let g:quickrun_config={'*': {'split': ''}}
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
nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
" 自動で折りたたまないようにする
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime = 1
let g:vim_markdown_conceal = 0
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
noremap <Leader>u :Denite -mode=normal buffer file_mru file<CR>
noremap <Leader>f :Denite -mode=normal file<CR>
noremap <Leader>r :Denite -mode=normal file_mru<CR>
noremap <Leader>b :Denite -mode=normal buffer<CR>
"}}}
"{{{ 画面移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
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
