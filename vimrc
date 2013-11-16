"------------------------------------------------------------------------------
" 配置Vundlue, 管理各种插件
"------------------------------------------------------------------------------
" 不兼容vi
set nocompatible
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" NOTE: comments after Bundle commands are not allowed.
Bundle 'bling/vim-airline'
Bundle 'ervandew/supertab'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'gmarik/vundle'
Bundle 'hallison/vim-markdown'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'junegunn/vim-easy-align'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-shell'
Bundle 'yegappan/mru'

" Color scheme
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/base16-vim'
Bundle 'tomasr/molokai'

" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'git://repo.or.cz/vcscommand'

" vim-scripts.org repos, may be outdated.
Bundle 'FencView.vim'
Bundle 'a.vim'
Bundle 'matchit.zip'
Bundle 'scratch.vim'
Bundle 'taglist.vim'

" 文件类型侦测
filetype plugin indent on " required!

"------------------------------------------------------------------------------
" 环境相关配置
"------------------------------------------------------------------------------

" GUI on Windows
if has('gui_running') && has('gui_win32')

    " 配置文件变量
    let g:my_vimrc = $HOME.'\vimfiles\vimrc'
    let g:vimrc_home = $HOME.'\vimfiles'

    " 设置英文字体
    set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
    " 设置中文字体
    set guifontwide=simhei:h11:cGB2312

    " 高亮光标所在的屏幕行
    set cursorline

    " 设置语言为英语
    lang english

    " 改变当前工作目录为“桌面”
    cd $HOME/Desktop

    " 启动时最大化窗口
    autocmd GUIEnter * simalt ~x

    " 使用CTRL-X，CTRL-C 和 CTRL-V 这些标准的 MS-Windows 操作方式
    "source $VIMRUNTIME/mswin.vim

" GUI on Mac
elseif has('gui_running') && has('macunix')

    " 配置文件变量
    let g:my_vimrc = $HOME.'/.vim/vimrc'
    let g:vimrc_home = $HOME.'/.vim'

    "set guifont=Menlo\ Regular:h14
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
    set guifontwide=Heiti\ SC\ Light:h14

    " 高亮光标所在的屏幕行
    set cursorline

" on Terminal
elseif has('unix')

    " 配置文件变量
    let g:my_vimrc = $HOME.'/.vim/vimrc'
    let g:vimrc_home = $HOME.'/.vim'

    " 不高亮光标所在的屏幕行
    set nocursorline

endif

"------------------------------------------------------------------------------
" 选项设置
"------------------------------------------------------------------------------

" 设置Vim相关字符编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese,ucs-bom
set termencoding=utf-8
set nobomb
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
" 在窗口里开始编辑一个缓冲区时设置 'foldlevel'。用于开始编辑时总是关闭所有的折叠 (值为零)，关闭某些折叠 (1) 或者没有折叠 (99)。
set foldlevelstart=99
" 设置折叠级别: 高于此级别的折叠会被关闭
set foldlevel=99
" 语法高亮项目指定折叠
set foldmethod=syntax
" 文件里的 <tab> 代表的空格数
set tabstop=4
" (自动) 缩进每一步使用的空白数目
set shiftwidth=4
" 执行编辑操作，如插入 <tab> 或者使用 <bs> 时，把 <tab> 算作空格的数目
set softtabstop=4
" 用空格展开<tab>
set expandtab
" 光标上下两侧最少保留的屏幕行数
set scrolloff=5
" 如果设置 'nowrap'，光标左右两侧保留的最少屏幕列数
set sidescrolloff=5
" 水平滚动时滚动的最少列数
set sidescroll=1
" 开启新行时 (插入模式下输入 <cr>，或者使用 "o" 或 "O" 命令)，从当前行复制缩进距离
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
" 影响 <bs>、<del>、CTRL-W 和 CTRL-U 在插入模式下的工作方式
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
" 文件名补全时忽略.git
set wildignore+=*.git
" 窗口的分割会把新窗口放到当前窗口之下
set nosplitbelow
" 窗口的分割会把新窗口放到当前窗口之右
set nosplitright
" 状态栏
"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
" 设为 "dark" 时，Vim 试图使用深色背景上看起来舒服的颜色
set background=dark
" 在可视模式下可以选择一个方块
set virtualedit+=block
" 如果发现文件在 Vim 之外修改过而在 Vim 里面没有的话，自动重新读入。
set autoread
" 命令行使用的屏幕行数
set cmdheight=1
" 设置<eol>格式
set fileformat=unix
" 设置<eol>格式
set fileformats=unix,dos

"------------------------------------------------------------------------------
" 其他设置
"------------------------------------------------------------------------------

" 语法高亮
syntax on

" 使用molokai颜色主题
colorscheme solarized

"打开 ":Man" 命令
runtime ftplugin/man.vim

"------------------------------------------------------------------------------
" 插件设置
"------------------------------------------------------------------------------
"Indent Guides
let g:indent_guides_guide_size=1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1

" taglist
let g:Tlist_Process_File_Always = 0
let g:Tlist_Auto_Open = 0
let g:Tlist_Auto_Update = 1
let g:Tlist_Hightlight_Tag_On_BufEnter = 1
let g:Tlist_Show_One_File = 1    " 只显示当前文件
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_File_Fold_Auto_Close = 0
let g:Tlist_Process_File_Always = 1
let g:Tlist_Display_Prototype = 0
let g:Tlist_Compact_Format = 1
let g:Tlist_Use_Right_Window = 0
let g:Tlist_Exit_OnlyWindow = 1      "如果taglist窗口是最后一个窗口，则退出vim
let g:Tlist_WinWidth = 30
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" FencView
let g:fencview_autodetect = 0
let g:fencview_checklines = 30
let g:fencview_auto_patterns = '*'

" shell.vim
let g:shell_mappings_enabled = 0

" Super Tab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'
let g:SuperTabLongestHighlight = 1

" Air Line
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Mini Buffer Explorer
let g:miniBufExplorerAutoStart = 0

"------------------------------------------------------------------------------
" 自动命令
"------------------------------------------------------------------------------

" 保存配置文件时自动重新载入配置
autocmd! BufWritePost vimrc exec 'source '.g:my_vimrc
autocmd! BufWritePost *.php TlistUpdate

" 打开文件时，自动跳转到光标最后所在的位置
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g'\"" | endif

"------------------------------------------------------------------------------
" 功能键映射
"------------------------------------------------------------------------------

" F1 Toggle NERDTree display
noremap <f1> :NERDTreeToggle<cr>
imap <f1> <c-o><f1>

" F2 切换MiniBufExplorer的显示
noremap <f2> :MBEToggle<cr>
imap <f2> <c-o><f2>

" F3 切换到MiniBufExplorer
noremap <f3> :MBEFocus<cr>
imap <f3> <c-o><f3>

" F4 切换TagList的显示
noremap <f4> :TlistToggle<cr>
imap <f4> <c-o><f4>

" F5 检查语法
noremap <f5> :SyntasticCheck<cr>
imap <f5> <c-o><f5>

" F6 打开URL/文件/目录/电子邮件地址
noremap <f6> :Open<cr>
imap <f6> <c-o><f6>

" F7 打开草稿
noremap <f7> :Scratch<cr>
imap <f7> <c-o><f7>

" F8 切换粘贴模式
noremap <f8> :set invpaste paste?<cr>
imap <f8> <c-o><f8>

" 最近打开的文件
noremap <f9> :Mru<cr>
imap <f9> <c-o><f9>

" 切换Yank Stack的显示
noremap <f10> :Yanks<cr>
imap <f10> <c-o><f10>

" 全屏
noremap <f11> :Fullscreen<cr>
imap <f11> <c-o><f11>

" 在.cpp/.c和.h文件间切换
noremap <f12> :A<cr>
imap <f12> <c-o><f12>

"------------------------------------------------------------------------------
" Learder键映射
"------------------------------------------------------------------------------

" 要定义一个使用 "mapleader" 变量的映射，可以使用特殊字串 "<leader>"
let mapleader = ","
" <localleader> 和 <leader> 类似，除了它使用 "maplocalleader" 而非 "mapleader"以外
let maplocalleader = "\\"

" ,e 垂直分割，窗口快速编辑VIM配置文件
noremap <leader>e <c-w><c-v><c-l>:exec 'e! '.g:my_vimrc<cr>

" ,<cr> 取消高亮
noremap <leader><enter> :nohlsearch<cr>

" ,l 关闭Tab，行尾空格的显示
noremap <leader>l :set list!<cr>

" ,w 保存文件
noremap <leader>w :w<cr>

" ,q 退出
noremap <leader>q :q<cr>

" ,W 删除所有的行尾的空格
noremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" ,a Ack插件快捷键
noremap <leader>a :Ack

" ,v 重选刚粘贴的文本，以便进行其他操作（如缩进）
noremap <leader>v gv

" ,s 垂直分割窗口，并切换过去
noremap <leader>s <c-w>v<c-w>l

" ,y 设置快捷键将选中文本块复制至系统剪贴板
noremap <leader>y "+y

" ,p 设置快捷键将系统剪贴板内容粘贴至Vim
noremap <leader>p "+p

" ,n 跳转到下一个错误
noremap <leader>n :cn<cr>

" ,p 跳转到上一个错误
noremap <leader>p :cp<cr>

"------------------------------------------------------------------------------
" 其他键映射
"------------------------------------------------------------------------------

" 查找时默认使用 "\v" 会使得其后的模式中所有 '0'-'9'，'a'-'z'，'A'-'Z' 和 '_' 之外的字符都当作特殊字符解释
noremap / /\v

" 用Tab跳转到匹配的括号
noremap <tab> %

" 自动换行时可在行中移动
noremap j gj
noremap k gk

" ;号等同于:号
noremap ; :

" 在插入和命令模式下用jj代替ESC
noremap! jj <esc>

" 在分割的窗口间移动
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" 在buffer间切换
noremap <s-h> :bp<cr>
noremap <s-l> :bn<cr>

" 增减buffer高度
noremap + <c-w>+
noremap - <c-w>-
