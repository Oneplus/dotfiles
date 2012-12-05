" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" {{{
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
" Last Change: 2011-01-23 03:00:23 Asins - asinsimple AT gmail DOT com
" Author:      Assins - asinsimple AT gmail DOT com
"              Get latest vimrc from http://nootn.com/blog/Tool/22/
" Version:     2.0
"}}}

" 设置leader为,
let mapleader=","
let g:mapleader=","

set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
filetype plugin indent on   " 开启插件
set number                  " 显示行号
set nocursorline            " 不突出显示当前行
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
" set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2             " 短暂跳转到匹配括号的时间
"set nowrap                  " 不自动换行
set magic                  " 显示括号配对情况
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
" set foldclose=all           " 设置为自动关闭折叠
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)\ 
                            " 设置在状态行显示的信息
" 显示Tab符
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set list

set expandtab

"设置代码折叠方式为 手工  indent
set foldmethod=indent
"设置代码块折叠后显示的行数
set foldexpr=1

if has("gui_running")
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
endif

"编辑vim配置文件
if has('unix')
    set fileformats=unix,dos,mac
    nmap <Leader>e :tabnew $HOME/.vimrc<CR>
    let $VIMFILES = $HOME.'/.vim'
else
    set fileformats=dos,unix,mac
    nmap <Leader>e :tabnew $VIM/_vimrc<CR>
    let $VIMFILES = $VIM.'/vimfiles'
endif

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'
set helplang=cn
"set nobomb

" {{{ 编码字体设置
set termencoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,chinese,utf-8
set ambiwidth=double
" }}}

" {{{全文搜索选中的文字
:vmap <silent> <leader>f y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vmap <silent> <leader>F y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
" }}}

" 删除所有行未尾空格
nmap <F12> :%s/[ \t\r]\+$//g<CR>

" Buffers操作快捷方式!
nmap <S-L> :bnext<CR>
nmap <S-H> :bprevious<CR>

" Tab操作快捷方式!
nmap <S-J> :tabnext<CR>
nmap <S-K> :tabprev<CR>

" 插入模式下左右移动光标
imap <c-l> <esc>la
imap <c-h> <esc>ha

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" win下的全屏组件，需gvimfullscreen.dll的支持
if !has('unix')
    function! ToggleFullScreen()
        let s:IsFullScreen=libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 27 + 29*256 + 30*256*256)
    endfunction
    map <F11> <Esc>:call ToggleFullScreen()<CR>
endif

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nmap <leader>1 :set filetype=xhtml<CR>
nmap <leader>2 :set filetype=css<CR>
nmap <leader>3 :set filetype=javascript<CR>
nmap <leader>4 :set filetype=php<CR>

" Python 文件的一般设置，比如不要 tab 等
"autocmd FileType python set tabstop=4 shiftwidth=4 expandtab

" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict


" {{{ plugin - vimExplorer.vim 文件管理器
" :VE 打开文件管理器       tab: 在树、列表窗口切换  
" Enter: 树窗口开关目录    u: 列表中在预览窗口打开文件
" ;r 打开Renamer插件
let g:VEConf_systemEncoding='cp936'
"}}}


" {{{ plugin - renamer.vim 文件重命名
" :Renamer 将当前文件所在文件夹下的内容显示在一个新窗口
" :Ren 开始重命名
"}}}


" {{{ plugin - bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"}}}


" {{{ plugin - bookmarking.vim 设置标记（标签）
" <F9> 设置标记    <F4> 向下跳转标记   <S-F4> 向上跳转标记
"map <F3>   :ToggleBookmark<CR>
"map <F4>   :NextBookmark<CR>
"map <S-F4> :PreviousBookmark<CR>
"}}}


" {{{ plugin - matchit.vim 对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"}}}


" {{{ plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" 这样，当我输入“,hl”时，就会把光标下的单词高亮，在此单词上按“,hh”会清除该单词的高亮。如果在高亮单词外输入“,hh”，会清除所有的高亮。
" 你也可以使用virsual模式选中一段文本，然后按“,hl”，会高亮你所选中的文本；或者你可以用“,hr”来输入一个正则表达式，这会高亮所有符合这个正则表达式的文本。
nmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hr <Plug>MarkRegex
" 你可以在高亮文本上使用“,#”或“,*”来上下搜索高亮文本。在使用了“,#”或“,*”后，就可以直接输入“#”或“*”来继续查找该高亮文本，直到你又用“#”或“*”查找了其它文本。
" <silent>* 当前MarkWord的下一个     <silent># 当前MarkWord的上一个
" <silent>/ 所有MarkWords的下一个    <silent>? 所有MarkWords的上一个
"}}}


" {{{ plugin – winmove.vim 窗口移动
let g:wm_move_left  = "<A-h>"
let g:wm_move_right = "<A-l>"
let g:wm_move_up    = "<A-k>"
let g:wm_move_down  = "<A-j>"
"}}}


" {{{ plugin – ZenCoding.vim 很酷的插件，HTML代码生成
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
" }}}


" {{{ plugin - auto_mkdir.vim 自动创建目录
" }}}


" {{{ plugin - mru.vim 记录最近打开的文件
let MRU_File = $VIMFILES.'/_vim_mru_files'
let MRU_Max_Entries = 1000
let MRU_Add_Menu = 0
nmap <leader>f :MRU<CR>
" }}}


" {{{ plugin - surround.vim 快速替换、清除包围符号、标签
"  Old text                  Command     New text ~
"  "Hello *world!"           ds"         Hello world!
"  [123+4*56]/2              cs])        (123+456)/2
"  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
"  if *x>3 {                 ysW(        if ( x>3 ) {
"  my $str = *whee!;         vlllls'     my $str = 'whee!';
"  "Hello *world!"           ds"         Hello world!
"  (123+4*56)/2              ds)         123+456/2
"  <div>Yo!*</div>           dst         Yo!
"  Hello w*orld!             ysiw)       Hello (world)!
" }}}


" {{{ plugin - NERD_commenter.vim 注释代码用的，
" <leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" <leader>cc 注释当前行
" <leader>cs 以”性感”的方式注释
" <leader>cA 在当前行尾添加注释符，并进入Insert模式
" <leader>cu 取消注释
" <leader>cm 添加块注释
" }}}


" {{{ plugin - jsbeautify.vim 优化js代码，并不是简单的缩进，而是整个优化
" 开始优化整个文件
nmap <silent> <leader>js :call g:Jsbeautify()<cr>
" }}}


" {{{ plugin -yankring.vim 寄存器可视操作
map <leader>y :YRShow<CR>
"map <leader>yc :YRClear<CR>
" }}}


set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set t_Co=256
colorscheme wombat256mod

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0

" WinManager fast link
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

nmap wm :WMToggle<CR>
