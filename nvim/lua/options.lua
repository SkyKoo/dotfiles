--------------------------------------
-------------- 基本配置 --------------
--------------------------------------
-- 启用鼠标
vim.o.mouse = 'a'

-- 当文件在外部被修改时, 自动更新该文件
vim.opt.autoread = true

-- 历史记录数
vim.opt.history = 1000

-- 显示行号
vim.opt.number = true

-- 在底部显示, 当前处于命令模式还是插入模式
vim.opt.showmode = true
-- 输入的命令显示出来, 看的清楚
vim.opt.showcmd = true

-- 输入模式下, 退格键可以退一切字符
vim.opt.backspace = "eol,start,indent"

-- 允许空格键和光标键跨越行边界, 一直按 l 可以从右边直接跳到下一行
vim.opt.whichwrap = "<,>,h,l"

-- 是否显示状态栏 0 表示不显示，1 表示只在多窗口时显示，2 表示显示
vim.opt.laststatus = 2
-- 状态行显示的内容
-- set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
vim.opt.statusline = "%F%m%r%h%w [FORMAT=%{&ff}] [TYPE=%Y] [POS=%l,%v][%p%%] %{strftime(\"%d/%m/%y - %H:%M\")}"

------------------------------------------------
-------------- 文字, 制表符和缩进 --------------
------------------------------------------------
-- 用空格键代替Tab键
vim.opt.expandtab = true

-- Be smart when using tabs ;)
-- 在行和段开始处使用制表符
vim.opt.smarttab = true
-- 设置所有的Tab和缩进为2个空格
vim.opt.tabstop = 2
-- 在文本上按下>>(增加一级缩进)、<<(取消一级缩进)
-- 或者==(取消全部缩进)时, 每一级的字符数
vim.opt.shiftwidth = 2
-- 使得按退格键时可以一次删除2个空格
vim.opt.softtabstop = 2

-- 缩进, 自动缩进(继承前一行的缩进)
-- :set autoindent 命令打开自动缩进, 是下面配置的缩写
-- 可使用 autoindent 命令的简写, 即“:set ai”和“:set noai”
-- 还可以使用“:set ai sw=4”在一个命令中打开缩进并设置缩进级别
vim.opt.autoindent = true
-- vim.opt.cindent = true -- 会导致 smartindent 实效
-- 智能缩进
vim.opt.smartindent = true

-- 折行时, 以单词为界, 以免切断单词
-- 设置了这个选项后, 如果一行文字非常长, 无法在一行内显示完的话
-- 它会在单词与单词间的空白处断开, 尽量不会把一个单词分成两截放在两个不同的行里
vim.opt.linebreak = true
-- 折行后的后续行, 使用与第一行相同的缩进
vim.opt.breakindent = true
-- 设置光标超过500个字符的时候折行
vim.opt.textwidth = 500

-- 80列限制
-- 这里不强制设置不能超过80个字符
-- au FileType c,cpp,python,vim set textwidth=80
-- 80个字符的地方画个提示线
-- set colorcolumn=80

-- 细节调整, 主要为了适应 Google C++ Style
-- t0: 函数返回类型声明不缩进
-- g0: C++ "public:" 等声明缩进一个字符
-- h1: C++ "public:" 等声明后面的语句缩进一个字符
-- N-s: C++ namespace 里不缩进
-- j1: 合理的缩进 Java 或 C++ 的匿名函数, 应该也适用于 JS
vim.opt.cinoptions = "t0,g1,h1,N-s,j1"

--------------------------------------
-------------- 用户交互 --------------
--------------------------------------
-- 高亮显示匹配的括号([{和}])
vim.opt.showmatch = true

-- 即时显示匹配结果
vim.opt.incsearch = true
-- 并高亮显示搜索结果
vim.opt.hlsearch = true

-- 光标所在的当前行高亮
vim.opt.cursorline = true

-- 搜索时忽略大小写
vim.opt.ignorecase = true
-- 如果搜索模式里有大写字母, 就不再忽略大小写
vim.opt.smartcase = true

-- 垂直滚动时, 光标距离顶部/底部的位置(单位:行)
vim.opt.scrolloff = 5

-- 水平滚动时, 光标距离行首或行尾的位置(单位:字符)
-- 该配置在不折行时比较有用
vim.opt.sidescrolloff = 15

-- 命令模式下, 底部操作指令按下 Tab 键自动补全
-- 第一次按下 Tab, 会显示所有匹配的操作指令的清单
-- 第二次按下 Tab, 会依次选择各个指令
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:list,full"

----------------------------------------
-------------- 颜色和字体 --------------
----------------------------------------
-- 打开关键字上色
vim.opt.syntax = "on"

-- 设置配色, nvim 是另一种配置方式
-- vim.opt.colorscheme = "desert"
-- 背景使用黑色
vim.opt.background = "dark"
-- vim.opt.background = "light"
-- 设置搜索高亮色
-- 可以通过 :hi 查看当前支持的所有颜色及其配置命令
-- hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow

-- 设置当前字符编码为 UTF-8
vim.opt.encoding = "utf8"

-- 使用中文菜单, 并使用 UTF-8 编码, 没有效果。。。
-- vim.opt.langmenu = "zh_CN.UTF-8"
-- vim.opt.helplang = "cn"
-- 使用中文提示信息, 并使用 UTF-8 编码
-- language message zh_CN.UTF-8

-- 检测文件编码时, 优先考虑 UTF-8
vim.opt.fileencodings = "utf-8,ucs-bom,gbk,gb2312,big5,latin1"
-- 设置终端编码, 似乎每什么用
-- vim.opt.termencoding = "utf-8"

-- 设置使用unix fileformat, 就是处理行结束符的问题
-- unix读取dos格式文件, 会出现^M, 它会使某些脚本执行出错
-- 在windos系统上使用了notepad++打开修改了可执行文件内容
-- 导致在centos下无法正常执行时
-- 可以使用:set ff=unix(或者:set fileformat=unix)
vim.opt.fileformats = "unix,dos,mac"

-- 如果行尾有多余的空格(包括 Tab 键), 该配置将让这些空格显示成可见的小方块
vim.opt.listchars = "tab:»■,trail:■"
vim.opt.list = true

----------------------------------------------
-------------- 文件, 备份和撤销 --------------
----------------------------------------------
-- 设置备份文件、交换文件、操作历史文件的保存位置
-- 结尾的//表示生成的文件名带有绝对路径, 路径中用%替换目录分隔符
-- 这样可以防止文件重名
-- 如果没有对应路径需要手动添加
-- nvim 默认路径 $XDG_STATE_HOME/nvim/backup// 所以不需要设置
-- vim.opt.backupdir = "~/.vim/.backup//"
-- nvim 默认路径 ~/.local/state/nvim/swap// 所以不需要设置
-- vim.opt.directory = "~/.vim/.swp//"
-- nvim 默认路径 ~/.local/state/nvim/undo// 所以不需要设置
-- vim.opt.undodir = "~/.vim/.undo//"

-- 关闭备份, 不生成swap文件
-- 默认情况下, 文件保存时, 会额外创建一个备份文件
-- 它的文件名是在原文件名的末尾, 再添加一个波浪号(〜)
-- 建议关闭, 否则输入 :wq 会报错 Can't make backup file (add ! to override)
-- vim.opt.nobackup = true
-- 不创建交换文件
-- 交换文件主要用于系统崩溃时恢复文件, 文件名的开头是. 结尾是.swp
vim.opt.swapfile = true

-- 保留撤销历史
-- Vim 会在编辑时保存操作历史, 用来供用户撤消更改
-- 默认情况下, 操作记录只在本次编辑时有效, 一旦编辑结束
-- 文件关闭, 操作历史就消失了
-- 打开这个设置, 可以在文件关闭后, 操作记录保留在一个文件里面, 继续存在
-- 这意味着, 重新打开一个文件, 可以撤销上一次编辑时的操作
-- 撤消文件是跟原文件保存在一起的隐藏文件, 文件名以.un~开头
vim.opt.undofile = true

-- 出错时不要发出响声
vim.opt.errorbells = false

-- 出错时, 发出视觉提示, 通常是屏幕闪烁
-- 建议不要开启, 闪烁看这不太舒服
vim.opt.visualbell = false
