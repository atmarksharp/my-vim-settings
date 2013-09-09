" starting (neobundle settings)
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle'))
endif

filetype plugin on
filetype indent on

" highlight current-line
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CursorLine gui=underline guifg=NONE guibg=NONE

" bundles
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'rbtnn/vimconsole.vim'
NeoBundle 'hsitz/VimOrganizer'
NeoBundle 'Shougo/vinarise'
NeoBundle 'mattn/emmet-vim'
"NeoBundle 'VimOutliner'
NeoBundle 'VOoM'
"NeoBundle 'javacomplete'
NeoBundle 'neosnippet'
NeoBundle 'scrooloose/snipmate-snippets'
"NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache-rsense'
"NeoBundle 'sakuraiyuta/commentout.vim'
"NeoBundle 'youjumpiwatch/vim-neoeclim'
NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'jdonaldson/vaxe'
"NeoBundle 'MarcWeber/vim-haxe-2'
"NeoBundle 'MarcWeber/vim-haxe'
"NeoBundle 'josephwecker/haxe.vim'
NeoBundle 'errormarker.vim'
"NeoBundle 'hallettj/jslint.vim'
"NeoBundle 'msmorgan/vim-flex'
"NeoBundle 'yuratomo/flex-api-complete'
NeoBundle 'vim-scripts/Flex-Development-Support'
NeoBundle 'itfrombit/nuvim'
"NeoBundle 'slimv.vim'

"-------------------------------------------------------------------------------
"" Mapping <jump-tag>
"-------------------------------------------------------------------------------
" " コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" " map/noremap           @            -              -                  @ 
" " nmap/nnoremap         @            -              -                  -
" " imap/inoremap         -            @              -                  - 
" " cmap/cnoremap         -            -              @                  -  
" " vmap/vnoremap         -            -              -                  @
" " map!/noremap!         -            @              @                  -
" "-------------------------------------------------------------------------------

" add filetype
augroup filetypedetect
	au BufNewFile,BufRead *.hx    setlocal filetype=haxe
	au BufNewFile,BufRead *.hxml  setlocal filetype=hxml
	au BufNewFile,BufRead *.as  setlocal filetype=as3
	au BufNewFile,BufRead *.mxml  setlocal filetype=mxml
	au BufNewFile,BufRead *.nu  setlocal filetype=nu
	"au BufNewFile,BufRead *.as    setl omnifunc=flexapi#complete
	"au BufNewFile,BufRead *.mxml  setf xml
	"au BufNewFile,BufRead *.mxml  setl omnifunc=mxml#complete
augroup END"

command VaxeHxmlDefault :let g:vaxe_hxml="compile.hxml"

" for NERDTree
nnoremap ,n :NERDTreeToggle<Return>

" for ctrlp.vim
nnoremap ,m :CtrlPMRUFiles<Return>
nnoremap ,b :CtrlPBuffer<Return>
nnoremap ,f :CtrlPCurFile<Return>

" syntastic
nnoremap ,sc :<C-u>SyntasticCheck<CR>
nnoremap ,e :<C-u>Errors<CR>
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let s:php_executable="/usr/bin/php"

" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>

" on insert mode, force return
inoremap <silent> <C-Down> <ESC>$a<Return>

" highlight search
set hlsearch
nnoremap ,l :nohl<Return>

" 挿入モードでのカーソル移動
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

" カーソル前の文字削除
inoremap <silent> <C-h> <C-g>u<C-h>
" " カーソル後の文字削除
inoremap <silent> <C-d> <Del>
" " カーソルから行頭まで削除
inoremap <silent> <C-d>e <Esc>lc^
" " カーソルから行末まで削除
inoremap <silent> <C-d>0 <Esc>lc$
" " カーソルから行頭までヤンク
inoremap <silent> <C-y>e <Esc>ly0<Insert>
" " カーソルから行末までヤンク
inoremap <silent> <C-y>0 <Esc>ly$<Insert>

" " 引用符, 括弧の設定
"inoremap { {}<Left>
"inoremap [ []<Left>
"inoremap ( ()<Left>
"inoremap " ""<Left>
"inoremap ' ''<Left>
"inoremap <> <><Left>

set guifont=Ricty:h18

" original commands (thanks to bi_na)
command Setphp set filetype=php
command Setjs set filetype=javascript
command Setjava set filetype=java
command Sethtml set filetype=html
command Sethaxe set filetype=haxe


" setting for neocomplcache and eclim-completion
let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 0
"let g:neocomplcache_force_overwrite_completefunc = 1
let g:EclimCompletionMethod = 'omnifunc'
"inoremap <expr><C-x><C-o> &filetype == 'vim' ? <C-x><C-v><C-p> : neocomplcache#manual_omni_complete()

set completeopt=longest,menuone,preview

imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType lisp setlocal tabstop=2

" settings for status-line
let g:Powerline_symbols = 'compatible'
set t_Co=256
set laststatus=2

" airline font setting
"let g:airline_powerline_fonts=1
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline_linecolumn_prefix = '⭡'
let g:airline_branch_prefix = '⭠'
"let g:airline_paste_symbol = ''
"let g:airline_whitespace_symbol = ''

" C-e to be expand (Emmet)
let g:user_emmet_expandabbr_key = '<c-e>'

" syntax and colors
set number
syntax on
colorscheme asmdev

" change line number color
highlight LineNr ctermfg=darkgray
highlight LineNr guifg=darkgray

if has('gui_macvim')
	set transparency=8
	set fuoptions=maxvert,maxhorz
endif

" tab spaces
set tabstop=4
set shiftwidth=4
" don't expand tabs to spaces
set noexpandtab
set softtabstop=0
" vim-mode (no compatible to vi)
set nocompatible
" make it normal backspace
set backspace=eol,indent,start
" in search, use smartcase
set smartcase
" more usability to ex-mode
noremap : ;
noremap ; :

" ctrlp settings
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " no clear cashe on exit
let g:ctrlp_mruf_max            = 500 " max number of MRU
let g:ctrlp_open_new_file       = 1

let g:org_command_for_emacsclient ='emacsclient'
let g:org_agenda_select_dirs=["~/org"]

" VimOrganizer
augroup MyVimOrganizer
	autocmd!
	autocmd BufNewFile,BufRead *.org setfiletype org
	autocmd FileType org :noremap <silent> <buffer> <localleader>a* :call OrgRunAgenda(strftime("%Y-%m-%d"),'w','')<cr>
	autocmd FileType org :noremap <silent> <buffer> <localleader>aa :call OrgRunAgenda(strftime("%Y-%m-%d"),'w','+ANY_TODO')<cr>
	autocmd FileType org :noremap <silent> <buffer> <localleader>at :call OrgRunAgenda(strftime("%Y-%m-%d"),'w','+UNFINISHED_TODOS')<cr>
	autocmd FileType org :noremap <silent> <buffer> <localleader>ad :call OrgRunAgenda(strftime("%Y-%m-%d"),'w','+FINISHED_TODOS')<cr>
augroup END
