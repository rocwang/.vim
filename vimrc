filetype off

" 生成每个插件的帮助标签文件 tags
" 使用pathogen管理插件目录
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" 设置 Vim 内部使用的字符编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese,ucs-bom
set termencoding=utf-8
set nobomb

" 文件类型侦测
filetype plugin indent on

"------------------------------------------------------------------------------
" 环境相关配置
"------------------------------------------------------------------------------

" Windows环境
if has('win32') && has('gui_win32') && has('gui_running')

    " 配置文件变量
    let g:my_vimrc = $HOME.'\vimfiles\vimrc'
    let g:vimrc_home = $HOME.'\vimfiles'

    " 设置语言为英语
    lang english

    " 改变当前工作目录为“桌面”
    cd $HOME/Desktop
    " 设置英文字体
    set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
    " 设置中文字体
    set guifontwide=simhei:h11:cGB2312
    " 启动时最大化窗口
    autocmd GUIEnter * simalt ~x

    " 高亮光标所在的屏幕行
    set cursorline

    " 使用CTRL-X，CTRL-C 和 CTRL-V 这些标准的 MS-Windows 操作方式
    "source $VIMRUNTIME/mswin.vim

    " Mac
elseif has('gui_running') && has('macunix')

    " 配置文件变量
    let g:my_vimrc = $HOME.'/.vim/vimrc'
    let g:vimrc_home = $HOME.'/.vim'

    set guifont=Menlo\ Regular:h14

    " 高亮光标所在的屏幕行
    set cursorline

    " Linux环境
elseif has('unix')

    " 配置文件变量
    let g:my_vimrc = $HOME.'/.vim/vimrc'
    let g:vimrc_home = $HOME.'/.vim'

    " 不高亮光标所在的屏幕行
    set nocursorline

endif

"------------------------------------------------------------------------------
" 自动命令
"------------------------------------------------------------------------------

" 保存配置文件时自动重新载入配置
autocmd! BufWritePost vimrc exec 'source '.g:my_vimrc
autocmd! BufWritePost *.php TlistUpdate

" VIM失去焦点时自动保存所有文件
"autocmd FocusLost * :wa

"------------------------------------------------------------------------------
" 选项设置
"------------------------------------------------------------------------------

" 不兼容vi
set nocompatible
" 备份文件存放目录
exec 'set backupdir='.fnameescape(g:vimrc_home.'/.vim_backup/')
"" swap文件存放目录
exec 'set directory='.fnameescape(g:vimrc_home.'/.vim_swap//')
"" 持久撤销文件存放目录
exec 'set undodir='.fnameescape(g:vimrc_home.'/.vim_undo/')
" 覆盖文件前不创建一个备份
set backup
" 持久撤销功能
set undofile
" 显示折叠列
set foldcolumn=0
" 文件里的 <Tab> 代表的空格数
set tabstop=4
" (自动) 缩进每一步使用的空白数目
set shiftwidth=4
" 执行编辑操作，如插入 <Tab> 或者使用 <BS> 时，把 <Tab> 算作空格的数目
set softtabstop=4
" 用空格展开<Tab>
set expandtab
" 光标上下两侧最少保留的屏幕行数
set scrolloff=5
" 如果设置 'nowrap'，光标左右两侧保留的最少屏幕列数
set sidescrolloff=5
" 水平滚动时滚动的最少列数
set sidescroll=1
" 开启新行时 (插入模式下输入 <CR>，或者使用 "o" 或 "O" 命令)，从当前行复制缩进距离
set autoindent
" 在插入、替换和可视模式里，在最后一行提供消息
set showmode
" 在屏幕最后一行显示 (部分的) 命令
set showcmd
" 放弃时隐藏缓冲区
set hidden
" 'wildmenu' 打开时，命令行补全以增强模式运行
set wildmenu
" 用 'widechar' 指定的字符所用的补全模式
set wildmode=list:longest
" 不使用可视响铃
set novisualbell
" 表明使用的是快速终端连接
set ttyfast
" 显示光标位置的行号和列号，逗号分隔
set ruler
" 影响 <BS>、<Del>、CTRL-W 和 CTRL-U 在插入模式下的工作方式
set backspace=indent,eol,start
" 总是显示状态行
set laststatus=2
" 在每行前面显示行号
set number
" 行号使用的最小列数
set numberwidth=3
" 搜索模式里忽略大小写
set ignorecase
" 如果搜索模式包含大写字符，不使用 'ignorecase' 选项
set smartcase
" 如果打开，":substitute" 的 'g' 标志位缺省打开。这意味着所有的行内匹配都被替换，而不是只有一个。
set gdefault
" 输入搜索命令时，显示目前输入的模式的匹配位置。匹配的字符串被高亮
set incsearch
" 插入括号时，短暂地跳转到匹配的对应括号
set showmatch
" 如果有上一个搜索模式，高亮它的所有匹配
set hlsearch
" 不自动换行
set nowrap
" 插入文本的最大宽度
"set textwidth=80
"set colorcolumn=+1
" 描述自动排版如何进行的字母序列
set formatoptions+=q
set formatoptions+=r
set formatoptions+=n
set formatoptions+=1
set formatoptions+=m
set formatoptions+=w
set formatoptions+=M
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set guioptions-=m "删除菜单栏
set guioptions-=T "删除工具栏
set guioptions-=r "删除右边的滚动条
set guioptions-=R "如有垂直分割的窗口，删除右边的滚动条
set guioptions-=l "删除左边的滚动条
set guioptions-=L "如有垂直分割的窗口，删除左边的滚动条
" 关键字补全，扫描 'dictionary' 选项给出的文件
set complete+=k
" ":" 命令的历史和最近的搜索模式的历史会被记住。本选项决定每个历史分别记住多少项 (见 |cmdline-editing|)。
set history=1000
" 文件名补全时忽略.svn
set wildignore+=*.svn
" 窗口的分割会把新窗口放到当前窗口之下
set nosplitbelow
" 窗口的分割会把新窗口放到当前窗口之右
set nosplitright
" 状态栏
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
" 设为 "dark" 时，Vim 试图使用深色背景上看起来舒服的颜色
set background=dark
" 在可视模式下可以选择一个方块
set virtualedit+=block
" 如果发现文件在 Vim 之外修改过而在 Vim 里面没有的话，自动重新读入。
set autoread
" 命令行使用的屏幕行数
set cmdheight=1
" 设置<EOL>格式
set fileformat=unix
" 设置<EOL>格式
set fileformats=unix,dos

"------------------------------------------------------------------------------
" Learder键映射
"------------------------------------------------------------------------------

" 要定义一个使用 "mapleader" 变量的映射，可以使用特殊字串 "<Leader>"
let mapleader = ","
" <LocalLeader> 和 <Leader> 类似，除了它使用 "maplocalleader" 而非 "mapleader"以外
let maplocalleader = "\\"

" ,e 垂直分割，窗口快速编辑VIM配置文件
nnoremap <leader>e <C-w><C-v><C-l>:exec 'e! '.g:my_vimrc<CR>

" ,<CR> 取消高亮
nnoremap <leader><CR> :nohlsearch<CR>

" ,l 关闭Tab，行尾空格的显示
nnoremap <leader>l :set list!<CR>

" ,w 保存文件
nnoremap <leader>w :w<CR>

" ,q 退出
nnoremap <leader>q :q<CR>

" ,W 删除所有的行尾的空格
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" ,a Ack插件快捷键
nnoremap <leader>a :Ack

" ,v 重选刚粘贴的文本，以便进行其他操作（如缩进）
nnoremap <leader>v gv

" 垂直分割窗口，并切换过去
nnoremap <leader>s <C-w>v<C-w>l

" Grep插件
nnoremap <leader>sp :Grep<CR>

"设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y

"设置快捷键将系统剪贴板内容粘贴至Vim
"nnoremap <Leader>p "+p

nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>

"------------------------------------------------------------------------------
"	 功能键映射
"------------------------------------------------------------------------------

map <F1> :NERDTreeToggle<CR>

" 防止想按Esc时不小心按到了F1
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

" 切换MiniBufExplorer的显示
nnoremap <F2> :TMiniBufExplorer<CR>
inoremap <F2> <C-o>:TMiniBufExplorer<CR>

" 切换到MiniBufExplorer
nnoremap <F3> :MiniBufExplorer<CR>
inoremap <F3> <C-o>:MiniBufExplorer<CR>

" 切换TagList的显示
nnoremap <F4> :TlistToggle<CR>

" <F5> :CheckSyntax

" 打开URL/文件/目录/电子邮件地址
nnoremap <F6> :Open<CR>
inoremap <F6> <C-o>:Open<CR>

" 打开草稿
nnoremap <F7> :Sscratch<CR>
inoremap <F7> <C-o>:Sscratch<CR>

" 切换粘贴模式
nnoremap <F8> :set invpaste paste?<CR>
inoremap <F8> <C-o>:set invpaste paste?<CR>

" 最近打开的文件
nnoremap <F9> :Mru<CR>
inoremap <F9> <C-o>:Mru<CR>

" 切换Yank Ring的显示
nnoremap <F10> :YRShow<CR>
inoremap <F10> <c-o>:YRShow<CR>

" 全屏
nnoremap <F11> :Fullscreen<CR>
inoremap <F11> <C-o>:Fullscreen<CR>

" 在.cpp/.c和.h文件间切换
nnoremap <F12> :A<CR>
inoremap <F12> <C-o>:A<CR>

"------------------------------------------------------------------------------
" 其他键映射
"------------------------------------------------------------------------------

" 使用 "\v" 会使得其后的模式中所有 '0'-'9'，'a'-'z'，'A'-'Z' 和 '_' 之外的字符都当作特殊字符解释
nnoremap / /\v
vnoremap / /\v
" 用Tab跳转到匹配的括号
nmap <tab> %

" 自动换行时可在行中移动
nnoremap j gj
nnoremap k gk

" ;号等同于:号
nnoremap ; :

" 用jj代替ESC
inoremap jj <ESC>

" 在分割的窗口间移动
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" phpDocumentor for Vim
inoremap <C-c> <C-o>:call PhpDocSingle()<CR>
nnoremap <C-c> :call PhpDocSingle()<CR>
vnoremap <C-c> :call PhpDocRange()<CR>

" 在buffer间移动
noremap <S-h> :bp<CR>
noremap <S-l> :bn<CR>

" 增减窗口尺寸
map + <C-w>+
map _ <C-w>-

" 用<tab>缩进
"nmap <tab>   >>
"nmap <s-tab> <<
"vmap <tab>   >
"vmap <s-tab> <

" Align
vnoremap <Leader>a=> :Align =><CR>

"------------------------------------------------------------------------------
" 插件设置
"------------------------------------------------------------------------------
"Vim Browser Reload for Mac
let g:returnAppFlag = 1
let g:returnApp = "MacVim"

"Indent Guides
let g:indent_guides_guide_size=1

" Align
let g:Align_xstrlen= 3

" taglist
let Tlist_Process_File_Always = 0
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Show_One_File = 1    " 只显示当前文件
let Tlist_Enable_Fold_Column = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 0
let Tlist_Exit_OnlyWindow = 1      "如果taglist窗口是最后一个窗口，则退出vim
let tlist_php_settings = 'php;c:class;d:constant;f:function'
let Tlist_WinWidth = 30
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" yankring
" 配置yankring历史文件名前缀
let g:yankring_history_file = '.yankring_history'

" FencView
let g:fencview_autodetect = 0
let g:fencview_checklines = 30
let g:fencview_auto_patterns = '*'

" Mini Buffer Explorer
let g:miniBufExplSplitBelow = 0
let g:miniBufExplModSelTarget = 1

" shell.vim
let g:shell_mappings_enabled = 0

" php-doc.vim
let g:pdv_cfg_Author = "rocwang <rocwang@tencent.com> (http://rocwang.me)"
let g:pdv_cfg_Copyright = "Copyright (c) 2012 Tencent Technology (Shenzhen) Co Ltd."
let g:pdv_cfg_License = ""
let g:pdv_cfg_Package = 'qqvip'
let g:pdv_cfg_Version = '$Id$'

"------------------------------------------------------------------------------
" 文件类型设置
"------------------------------------------------------------------------------

" 二进制文件
" vim -b : 用xxd格式编辑二进制文件
augroup Binary
    autocmd!
    autocmd BufReadPre  *.bin,*.o let &bin=1
    autocmd BufReadPost *.bin,*.o if &bin | %!xxd
    autocmd BufReadPost *.bin,*.o set ft=xxd | endif
    autocmd BufWritePre *.bin,*.o if &bin | %!xxd -r
    autocmd BufWritePre *.bin,*.o endif
    autocmd BufWritePost *.bin,*.o if &bin | %!xxd
    autocmd BufWritePost *.bin,*.o set nomod | endif
augroup END

" Javascript
" 折叠
function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
autocmd FileType javascript setl fen
"autocmd FileType javascript set textwidth=80
autocmd FileType javascript set colorcolumn=+1

" PHP
" 折叠
"autocmd FileType php EnablePHPFolds
"autocmd FileType php set textwidth=80
autocmd FileType php set colorcolumn=+1

" Super Tab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'
let g:SuperTabLongestHighlight = 1

" Rainbow Parentheses
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"------------------------------------------------------------------------------
" 其他设置
"------------------------------------------------------------------------------

" 打开文件时，自动跳转到光标最后所在的位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

" 切换QuickFix窗口
com! -bang -nargs=? QFix cal QFixToggle(<bang>0)
fu! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0 
        cclose
        unlet g:qfix_win
    else 
        copen 10
        let g:qfix_win = bufnr("$")
    en
endf
nnoremap <leader>f :QFix<CR>

" 使用molokai颜色主题
colorscheme solarized

"打开 ":Man" 命令
runtime ftplugin/man.vim

autocmd FileType javascript call JavaScriptFold()

" 语法高亮
syntax on
" 在窗口里开始编辑一个缓冲区时设置 'foldlevel'。用于开始编辑时总是关闭所有的折叠 (值为零)，关闭某些折叠 (1) 或者没有折叠 (99)。
set foldlevelstart=99
" 设置折叠级别: 高于此级别的折叠会被关闭
set foldlevel=99
" 语法高亮项目指定折叠
set foldmethod=syntax
let php_folding=2
let php_sql_query = 1
let php_htmlInStrings = 1
let php_html_in_strings = 1
