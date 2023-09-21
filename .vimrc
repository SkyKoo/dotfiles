"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> 基本
"    -> 文字, 制表符和缩进
"    -> 用户交互
"    -> 颜色和字体
"    -> 文件, 备份和撤销
"    -> 移动, 标签, 窗口
"    -> 编辑映射
"    -> 状态栏
"    -> ctags
"    -> tagslist
"    -> cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 基本
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭兼容模式, 去掉有关vi一致性模式, 避免以前版本的一些bug和局限
set nocompatible

" 显示行号
set number

" 支持使用鼠标, 设置只有 vim 中无法选中复制, 所以不再启用
" set mouse=a

" 设置 VIM 默认剪贴板设置为系统剪贴板, 暂不启用
" set clipboard=unnamedplus

" 在底部显示，当前处于命令模式还是插入模式
set showmode
" 输入的命令显示出来，看的清楚
set showcmd

" 启用256色
set t_Co=256

" 历史记录数
set history=1000

" 载入文件类型插件
filetype plugin on
" 开启文件类型检查，并且载入与该类型对应的缩进规则
" 比如,如果编辑的是.py文件,Vim 就是会找 Python 的缩进规则
" ~/.vim/indent/python.vim
filetype indent on

" 当文件在外部被修改时，自动更新该文件
set autoread

" vim leader可以看做是vim快捷键的触发, 通过leader+其他按键达到快捷键的作用
" 前缀键默认为“\”, 设置mapleader, 后面键盘映射随时要用
" 基本上所有自定义的快捷键都以这个字符打头, 比如映射`,w`为`:w`
let mapleader = ","
let g:mapleader = ","

" 快速保存文件
" <leader>就是上面定义的逗号“,” <cr>则是回车
" nmap 中的 n 表示在普通模式下生效, 相应的 v 表示在可视模式下生效
" i 表示在插入模式下生效, c 表示在命令行模式下生效
nmap <leader>w :w!<cr>

" 用于移除 Windows 文件结尾的 `^M`
" nore 表示非递归, 递归的意思就是 a 被映射成 b, b 又被映射成 c
" 如果是递归的, a 就被映射成 c 了, 非递归则不会, 默认的 map 就是递归的
noremap <leader>m :%s/<C-V><C-M>//ge<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文字, 制表符和缩进
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 用空格键代替Tab键
set expandtab

" Be smart when using tabs ;)
" 在行和段开始处使用制表符
set smarttab
" 设置所有的Tab和缩进为2个空格
set tabstop=2
" 在文本上按下>>(增加一级缩进)、<<(取消一级缩进)
" 或者==(取消全部缩进)时, 每一级的字符数
set shiftwidth=2
" 使得按退格键时可以一次删除2个空格
set softtabstop=2

" 折行时，以单词为界，以免切断单词
" 设置了这个选项后, 如果一行文字非常长, 无法在一行内显示完的话
" 它会在单词与单词间的空白处断开, 尽量不会把一个单词分成两截放在两个不同的行里
set linebreak
" 折行后的后续行，使用与第一行相同的缩进
set breakindent
" 设置光标超过500个字符的时候折行
set textwidth=500

" 缩进, 自动缩进(继承前一行的缩进)
" set autoindent 命令打开自动缩进, 是下面配置的缩写
" 可使用autoindent命令的简写, 即“:set ai”和“:set noai”
" 还可以使用“:set ai sw=4”在一个命令中打开缩进并设置缩进级别
set autoindent
" 会导致 smartindent 失效
" set cindent
" 智能缩进
set smartindent

" 80列限制
" 这里不强制设置不能超过80个字符
" au FileType c,cpp,python,vim set textwidth=80
" 80个字符的地方画个提示线
"" set colorcolumn=80

" 细节调整，主要为了适应 Google C++ Style
" t0: 函数返回类型声明不缩进
" g0: C++ "public:" 等声明缩进一个字符
" h1: C++ "public:" 等声明后面的语句缩进一个字符
" N-s: C++ namespace 里不缩进
" j1: 合理的缩进 Java 或 C++ 的匿名函数，应该也适用于 JS
set cinoptions=t0,g1,h1,N-s,j1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 用户交互
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号([{和}])
set showmatch

" 即时显示匹配结果
set incsearch
" 并高亮显示搜索结果
set hlsearch

" 光标所在的当前行高亮
set cursorline

" 搜索时忽略大小写
set ignorecase
" 如果搜索模式里有大写字母, 就不再忽略大小写
set smartcase

" 垂直滚动时, 光标距离顶部/底部的位置(单位:行)
set scrolloff=5

" 水平滚动时, 光标距离行首或行尾的位置(单位:字符)
" 该配置在不折行时比较有用
set sidescrolloff=15

" 命令模式下, 底部操作指令按下 Tab 键自动补全
" 第一次按下 Tab, 会显示所有匹配的操作指令的清单
" 第二次按下 Tab, 会依次选择各个指令
set wildmenu
set wildmode=longest:list,full

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 颜色和字体
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开关键字上色
syntax enable

" 设置配色
colorscheme desert
" 背景使用黑色
set background=dark
" 设置搜索高亮色
" 可以通过 :hi 查看当前支持的所有颜色及其配置命令
hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow

" 设置当前字符编码为 UTF-8
set encoding=utf8

" 使用中文菜单, 并使用 UTF-8 编码
set langmenu=zh_CN.UTF-8 
set helplang=cn
" 使用中文提示信息，并使用 UTF-8 编码
language message zh_CN.UTF-8

" 检测文件编码时，优先考虑 UTF-8
set fileencodings=utf-8,ucs-bom,gbk,gb2312,big5,latin1
" 设置终端编码
set termencoding=utf-8

" 设置使用unix fileformat, 就是处理行结束符的问题
" unix读取dos格式文件, 会出现^M, 它会使某些脚本执行出错
" 在windos系统上使用了notepad++打开修改了可执行文件内容
" 导致在centos下无法正常执行时
" 可以使用:set ff=unix(或者:set fileformat=unix)
set fileformats=unix,dos,mac

" 如果行尾有多余的空格(包括 Tab 键), 该配置将让这些空格显示成可见的小方块
set listchars=tab:»■,trail:■
set list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件, 备份和撤销
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置备份文件、交换文件、操作历史文件的保存位置
" 结尾的//表示生成的文件名带有绝对路径, 路径中用%替换目录分隔符
" 这样可以防止文件重名
" 如果没有对应路径需要手动添加
" set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

" 关闭备份, 不生成swap文件
" 默认情况下, 文件保存时, 会额外创建一个备份文件
" 它的文件名是在原文件名的末尾, 再添加一个波浪号(〜)
" 建议关闭，否则输入 :wq 会报错 Can't make backup file (add ! to override)
" set nobackup
" 不创建交换文件
" 交换文件主要用于系统崩溃时恢复文件, 文件名的开头是. 结尾是.swp
set noswapfile

" 保留撤销历史
" Vim 会在编辑时保存操作历史, 用来供用户撤消更改
" 默认情况下, 操作记录只在本次编辑时有效, 一旦编辑结束
" 文件关闭, 操作历史就消失了
" 打开这个设置, 可以在文件关闭后, 操作记录保留在一个文件里面, 继续存在
" 这意味着, 重新打开一个文件, 可以撤销上一次编辑时的操作
" 撤消文件是跟原文件保存在一起的隐藏文件，文件名以.un~开头
set undofile

" 出错时不要发出响声
set noerrorbells

" 出错时, 发出视觉提示, 通常是屏幕闪烁
" 建议不要开启，闪烁看这不太舒服
" set visualbell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 移动, 标签, 窗口
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 输入模式下, 退格键可以退一切字符
set backspace=eol,start,indent

" 允许空格键和光标键跨越行边界"
set whichwrap+=<,>,h,l

" 标签映射
" <leader> 即之前定义的逗号“,”
" “,”数字 映射 标签选择
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
" “,”n 映射 下一个标签
nnoremap <leader>n gt
" “,”n 映射 上一个标签
nnoremap <leader>p gT
" “,” 映射 :Te回车 打开新标签
nnoremap <leader>t :Te<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 编辑映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 0 映射 ^ 移动到第一个非空字符
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 状态栏
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 是否显示状态栏 0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set laststatus=2
" 状态行显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctags
" -> mac 中可以使用 brew install ctags 安装, 注意区分 mac 自带的 ctags
" -> 官网: http://ctags.sourceforge.net/
"  Usage:
"  1. $ctags –R * ($为Linux系统Shell提示符)
"  2. $ vi –t tag (请把tag替换为您欲查找的变量或函数名)
"  3. :ts(ts助记字：tagslist, ":"开头的命令为VI中命令行模式命令)
"  4. :tp(tp助记字：tagspreview)---此命令不常用，可以不用记
"  5. :tn(tn助记字：tagsnext) ---此命令不常用，可以不用记
"  6. Ctrl+ ] 跳到光标所在函数或者结构体的定义处
"  7. Ctrl+ T 返回查找或跳转
"  8. :tags 会列出查找/跳转过程(经过的标签列表)
"  在运行vim的时候加上"-t"参数
"  例如: $vim -t main这个命令将打开定义"main"(变量或函数或其它)的文件, 并把光标定位到这一行
"  如果这个变量或函数有多处定义, 在VI命令行模式":ts"命令就能列出一个列表供用户选择
"  ":tp"为上一个tag标记文件, ":tn"为下一个tag标记文件
"  当然, 若当前tags文件中用户所查找的变量或函数名只有一个, ":tp,:tn"命令不可用
"  最方便的方法是把光标移到变量名或函数名上, 然后按下"Ctrl+]"
"  这样就能直接跳到这个变量或函数定义的源文件中, 并把光标定位到这一行, 用"Ctrl+T"可以退回原来的地方
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置 F4 键开启ctags
map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

" 第一个命令里的分号是必不可少的
" 这个命令让vim首先在当前目录里寻找tags文件, 如果没有找到tags文件
" 或者没有找到对应的目标, 就到父目录中查找, 一直向上递归
" 因为 tags 文件中记录的路径总是相对于 tags 文件所在的路径
" 所以要使用第二个设置项"set autochdir" 来改变vim的当前目录
set tags=tags;

" 自动切换工作目录
" 这主要用在一个 Vim 会话之中打开多个文件的情况
" 默认的工作目录是打开的第一个文件的目录
" 该配置可以将工作目录自动切换到, 正在编辑的文件的目录
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按下 F3 就可以呼出了
map <F3> :Tlist<CR>

" 在启动 VIM 后, 自动打开 taglist 窗口
" let Tlist_Auto_Open=1

" 设定 ctags 的位置
let Tlist_Ctags_Cmd='/opt/homebrew/bin/ctags'

" 1为让窗口显示在右边, 0为显示在左边
let Tlist_Use_Right_Window=0

" 让 taglist 可以同时展示多个文件的函数列表, 设置为1时不同时显示多个文件的 tag, 只显示当前文件的
let Tlist_Show_One_File=1

" 同时显示多个文件中的 tag 时, taglist 只显示当前文件 tag, 其他文件的函数列表折叠隐藏
let Tlist_File_Fold_Auto_Close=1

" 当 taglist 是最后一个分割窗口时，自动退出vim
let Tlist_Exit_OnlyWindow=1

" 缺省情况下, 在双击一个 tag 时, 才会跳到该 tag 定义的位置
" let Tlist_Use_SingleClick= 1

" 是否一直处理 tags. 1:处理; 0:不处理
" let Tlist_Process_File_Always=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cscope
" :cs 命令会显示一个简短的用法介绍
" add: 增加一个新的cscope数据库/链接库
"    :cs add {file|dir} [pre-path] [flags]
" find: 查询cscope
"    :cs find {querytype} {name}
"      {querytype} 即相对应于实际的cscope行接口数字
"      0或者s   —— 查找这个C符号
"      1或者g   —— 查找这个定义
"      2或者d   —— 查找被这个函数调用的函数（们）
"      3或者c   —— 查找调用这个函数的函数（们）
"      4或者t   —— 查找这个字符串
"      6或者e  —— 查找这个egrep匹配模式
"      7或者f   —— 查找这个文件
"      8或者i   —— 查找#include这个文件的文件（们）
" help: 显示一个简短的摘要
"     :cs help
" kill: 杀掉一个cscope链接
"     :cs kill {num|partial_name}
" reset: 重新初始化所有的cscope链接
"     :cs reset
" show: 显示cscope的链接
"     :cs show
" :cw 打开查找结果框
" :cn 跳到下一个搜索结果
" :cp 跳到上一个搜索结果
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  " cscopeprg 指定了执行cscpoe的命令
  set csprg=/opt/homebrew/bin/cscope
  " 设置 :cstag 执行查找的顺序, 0 表示 cscope 数据将会被优先查找
  " 假如 cscope 没有返回匹配项, 然后才会查找 tag 文件
  " 反之若设置为1, 则查找顺序相反, 默认值是0
  set csto=1
  " 假如 cscopetag 被设置, 则 :tag 和 ctrl+] 和 vim -t 等命令会始终使用 :cstag 而不是默认的 :tag 行为
  " 通过设置"cst", 你将始终同时查找cscope数据库和tags文件, 默认情况是关闭的 set nocst
  set cst
  " cscopepathcomp, 指定在查找结果中显示多少级文件路径
  " 默认值0表示显示全路径, 1表示只显示文件名, 其他值就会显示不同的部分
  " set cspc=3
  " 默认 cscopeverbose 没有被设置, 那么当在增加一个 cscope 数据库时不会显示执行成功或失败的信息
  " 理想情况是, 在增加cscope数据库之前, 你应该在你的 .vimrc 中重置此选项, 在增加完之后, 设置它
  " 此后, 当你在vim中增加更多的数据库时, 你会得到信息展示数据库增加失败
  set nocsverb
  " cscopequickfix 指定了是否使用 quickfix 窗口来显示 cscope 的结果, 这是一组用逗号分隔的值
  " 每项都包含于 csope-find 命令(s, g, d, c, t, e, f, 或者i)和旗标(+, -或者0)
  " '+'预示着显示结果必须追加到quickfix窗口
  " '-'隐含着清空先前的的显示结果
  " '0'或者不设置表示不使用quickfix窗口
  " 查找会从开始直到第一条命令出现, 默认的值是不使用quickfix窗口
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  " 如果当前目录有任何 cscope 数据库文件, 则加载该文件
  if filereadable("cscope.out")
    cs add cscope.out
  " 否则加载环境变量指向的数据库文件
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif

" 纵向打开新窗口快捷键
nmap <leader>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader><leader>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
