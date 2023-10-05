-- 定义默认的参数 options
local opts = {
  noremap = true, -- non-recursive 非递归
  silent = true,  -- do not show message 不提示
}

-- vim leader可以看做是vim快捷键的触发, 通过leader+其他按键达到快捷键的作用
-- 前缀键默认为“\”, 设置mapleader, 后面键盘映射随时要用
-- 基本上所有自定义的快捷键都以这个字符打头, 比如映射`,w`为`:w`
vim.g.mapleader = ","

-- 0 映射 ^ 移动到第一个非空字符
vim.keymap.set('', '0', '^', opts)

-- 快速保存文件
-- <leader>就是上面定义的逗号“,” <cr>则是回车
-- nmap 中的 n 表示在普通模式下生效, 相应的 v 表示在可视模式下生效
-- i 表示在插入模式下生效, c 表示在命令行模式下生效
-- nmap <leader>w :w!<cr>
-- vim.keymap.set('n', '<leader>w', ':w!<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':w!<cr>', opts)

-- 用于移除 Windows 文件结尾的 `^M`
-- nore 表示非递归, 递归的意思就是 a 被映射成 b, b 又被映射成 c
-- 如果是递归的, a 就被映射成 c 了, 非递归则不会, 默认的 map 就是递归的
-- noremap <leader>m :%s/<C-V><C-M>//ge<CR>
vim.keymap.set('', '<leader>m', ':%s/<C-V><C-M>//ge<CR>', opts)

-- 标签映射
-- <leader> 即之前定义的逗号“,”
-- “,”数字 映射 标签选择
vim.keymap.set('n', '<leader>1', '1gt', opts)
vim.keymap.set('n', '<leader>2', '2gt', opts)
vim.keymap.set('n', '<leader>3', '3gt', opts)
vim.keymap.set('n', '<leader>4', '4gt', opts)
vim.keymap.set('n', '<leader>5', '5gt', opts)
vim.keymap.set('n', '<leader>6', '6gt', opts)
vim.keymap.set('n', '<leader>7', '7gt', opts)
vim.keymap.set('n', '<leader>8', '8gt', opts)
vim.keymap.set('n', '<leader>9', '9gt', opts)
-- “,”n 映射 下一个标签
vim.keymap.set('n', '<leader>n', 'gt', opts)
-- “,”n 映射 上一个标签
vim.keymap.set('n', '<leader>p', 'gT', opts)
-- “,” 映射 :Te回车 打开新标签
vim.keymap.set('n', '<leader>t', ':Te<CR>', opts)

