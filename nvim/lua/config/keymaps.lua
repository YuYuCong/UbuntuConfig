-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- <leader>sk 查看keymaps
-- <leader>? 查看buffer keymaps

local map = vim.keymap.set
local unmap = vim.keymap.del

-- 禁用LazyVim Changelog
unmap("n", "<leader>L", { desc = "LazyVim Changelog" })

-------------------------------------------界面切换-------------------------------------------

-- 窗口切换
map("n", "<leader>j", "<C-w>j", { desc = "(Window) Go to Lower Window", remap = true })
map("n", "<leader>k", "<C-w>k", { desc = "(Window) Go to Upper Window", remap = true })
map("n", "<leader>h", "<C-w>h", { desc = "(Window) Go to Left Window", remap = true })
map("n", "<leader>l", "<C-w>l", { desc = "(Window) Go to Right Window", remap = true })
-- 或者 C-hjkl

-- 窗口大小调整
-- "n", <C-方向键>
-- todo(congyu) vscode

-- 文件切换
-- "n" "H" 切换到左边文件
-- "n" "L" 切换到右边文件
if vim.g.vscode then
  -- 切换到前一个文件
  map("n", "H", "<cmd>lua require('vscode').action('workbench.action.previousEditorInGroup')<CR>", { desc = "Switch to Previous File in Group" })
  -- 切换到后一个文件
  map("n", "L", "<cmd>lua require('vscode').action('workbench.action.nextEditorInGroup')<CR>", { desc = "Switch to Next File in Group" })
end

-- pin文件
-- "n" "<leader>bp" 固定当前文件
-- "n" "<leader>bp" 取消固定当前文件
-- "n" "<leader>bu" 关闭unpinned文件
map("n", "<leader>bu", "<leader>bP", { desc = "Close Unpinned Editors", remap = true })
-- "n" "<leader>bo" 关闭除当前文件外的其他文件
if vim.g.vscode then
  map("n", "<leader>bp", "<cmd>lua require('vscode').action('workbench.action.pinEditor')<CR>", { desc = "Pin Current File" })
  map("n", "<leader>bP", "<cmd>lua require('vscode').action('workbench.action.unpinEditor')<CR>", { desc = "Unpin Current File" })
  map("n", "<leader>bu", "<cmd>lua require('vscode').action('workbench.action.closeOtherEditors')<CR>", { desc = "Close Unpinned Editors" })
end

-- "n" "<leader>`" 切换到上一个光标所在的文件
-- "n" "``" Back to line in current buffer where jumped from
-- "n" "<leader>," 在当前打开的文件中切换
-- todo(congyu) vscode

-- 窗口关闭
-- <leader>wq
if vim.g.vscode then
  map("n", "<leader>wq", "<cmd>lua require('vscode').action('workbench.action.closeEditorsInGroup')<CR>")
end

-- 文件关闭
-- <leader> bd 关闭当前文件
if vim.g.vscode then
  map("n", "<leader>bd", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
end

-- 进入某子文件夹
-- 文件tree界面，光标选择在某文件夹上
-- .

-- 打开目录树
-- "n", "<leader>e" 打开或关闭目录树
if vim.g.vscode then
  -- 打开或关闭目录树
  -- 同vscode ctrl+shift+e, vscode中再次按可以切换回编辑器中
  map("n", "<leader>e", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>", { desc = "Toggle Explorer" })
end


-- terminal
map("n", "<leader>tt", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
if vim.g.vscode then
  -- 打开终端
  -- 同vscode ctrl+shift+t, vscode中再次按可以切换回编辑器中
  map("n", "<leader>tt", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>", { desc = "Toggle Terminal" })
end

-------------------------------------------编辑-------------------------------------------
-- 移动光标
-- {"n", "v"}, "b", { desc = "(Move) back one word" }
-- {"n", "v"}, "w", { desc = "(Move) one word" }
-- {"n", "v"}, "gg" 首行
-- {"n", "v"}, "G" 末行
map({ "n", "v" }, "gh", "0", { desc = "(Move) to line start" }) -- 行首
map({ "n", "v" }, "gl", "$", { desc = "(Move) to line end" }) -- 行尾

-- 编辑
-- "n", "u" 撤销编辑
-- "n", "<C-r>" 撤销撤销的编辑
map("n", "U", "<C-r>", { desc = "Reredo" })
if vim.g.vscode then
  map("n", "U", "<cmd>lua require('vscode').action('redo')<CR>", { desc = "Reredo" })
end

-- 删除与改写第一个键有差别，第二个键意义一致
-- 删除与改写的差别在于：删除后保持在n模式，改写后进入i模式
-- "n", "d+某个键" 删除
-- "n", "c+某个键" 改写

-- 复制粘贴
-- yaw 复制单词与周围的空格
-- yiw 复制单词
-- yy 复制整行
-- p 粘贴

-- 移动整行
-- "n", "<A-j>" move current line down
-- "n", "<A-k>" move current line up
-- 禁用J
map("n", "<S-j>", "", { desc = "Unused" })

-- 注释
-- "n", "gcc" 注释当前行
-- "v", "gc" 注释所选代码块

-- 折叠
-- "n", "zc" 折叠当前代码块
-- "n", "zo" 打开折叠的代码快
if vim.g.vscode then
  map("n", "zc", "<cmd>lua require('vscode').action('editor.fold')<CR>", { desc = "Fold Code Block" })
  map("n", "zo", "<cmd>lua require('vscode').action('editor.unfold')<CR>", { desc = "Unfold Code Block" })
end

-- 错别字检查
-- "n", "<leader>us" 切换检查开关
-- "n", "Zl" 从列表中选择单词修正

-------------------------------------------搜索-------------------------------------------
-- 搜索
-- "n", "/" 在当前文件搜索字符串
-- "n", "<leader>/" 全局搜索
-- "n", "n" 下一个搜索结果
-- "n", "N" 上一个搜索结果
--
-- "n", "*" 向前搜索光标下的单词
-- "n", "#" 向后搜索光标下的单词
--
-- double space (telescope)filename search
-- Ctrl n 搜索列表的下一条
-- Ctrl p 搜索列表的上一条
--
-- 搜索替换
-- cmdline:%s/old/new/gc 当前文件内搜索替换old到new，且在替换前确认每个动作
-- cmdline:%s/old/new/g 当前文件内搜索替换old到new，直接替换

-- 标记书签
-- "n", "ma" 本地标记书签当前行'a'
-- "n", "mA" 全局标记书签当前行'A'
-- "n", "<leader>sm" 列出所有书签
-- "n", "<leader>sma" 前往书签a
-- "n", "`" 列出所有书签
-- "n", "`a" 前往书签a
-- 删除书签
-- cmdline:delmarks a 删除书签a
-- cmdline:delmarks!  删除所有书签
if vim.g.vscode then
  map("n", "<leader>m",  "<cmd>lua require('vscode').action('bookmarks.toggle')<CR>", { desc = "Toggle bookmark"})
  map("n", "<leader>sm",  "<cmd>lua require('vscode').action('bookmarks.listFromAllFiles')<CR>", { desc = "List all bookmarks"})
end

-------------------------------------------lsp-------------------------------------------
-- gd 切换定义
-- gr 前往引用
-- <leader>xx 打开静态代码问题分析列表
-- <leader>xX 打开静态代码问题分析列表-当前文件
-- <leader>cs 打开symbols列表
-- <leader>ch 切换头文件与cpp文件
if vim.g.vscode then
  -- 转到引用
  map("n", "gr", "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>", { desc = "Go to References" })
  -- 切换头文件与cpp文件
  map("n", "<leader>ch", "<cmd>lua require('vscode').action('clangd.switchheadersource')<CR>", { desc = "Switch Between Header and Source File" })
  -- 打开问题列表
  -- 同vscode ctrl+shift+x，vscode中再次按可以切换回编辑器中
  map("n", "<leadeGetRegionCandidateGridsr>xx", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>", { desc = "Open Problems List" })
  -- 打开当前文件的问题列表
  map("n", "<leader>xX", "<cmd>lua require('vscode').action('workbench.actions.view.problems.focus')<CR>", { desc = "Focus Problems for Current File" })
  -- 快速前往symbols
  -- ctrl+shift+o
end

-- lsp.lua中自定义的快捷键
-- "n", "cf" 代码改动部分格式化
-- "n", "<leader>cf" 代码全文格式化
-- todo(congyu) vscode
-- "n", "<leader>uf" 临时切换代码自动格式化

-- 代码补全
-- "i", "<C-n>", Next code suggestion，也可以直接使用下键
-- "i", "<C-p>", Prev code suggestion，也可以直接使用上键
-- "i", "<C-n>", 打开补全弹窗
-- "i", "<C-e>", 退出补全弹窗

-- hover
-- "n", "<S-k>", 打开hover信息

-------------------------------------------git-------------------------------------------
-- <leader>gb Blame当前行
-- <leader>gB Blame当前文件
-- <leader>ghd 查看当前文件的编辑diff
-- <leader>ghr 回退当前代码块
-- <leader>ghs 暂存当前代码块
if vim.g.vscode then
  -- 回退当前代码块
  map("n", "<leader>ghr", "<cmd>lua require('vscode').action('git.revertSelectedRanges')<CR>", { desc = "Revert Selected Block" })
  -- 暂存当前代码块
  map("n", "<leader>ghs", "<cmd>lua require('vscode').action('git.diff.stageHunk')<CR>", { desc = "Git stage cur block" })
 
  -- <Alt-n> 下一个代码更改块
  -- <Alt-p> 上一个代码更改块
end

-- 打开git变更目录
-- "n", "<leader>gs" 打开git status
-- "n", "<C-n>" 选择git变更列表的下一个文件
-- "n", "<C-p>" 选择git变更列表的上一个文件
if vim.g.vscode then
  -- 打开git变更目录
  -- 同vscode ctrl+shift+g，vscode中再次按可以切换回编辑器中
  map("n", "<leader>gs", "<cmd>lua require('vscode').action('workbench.scm.focus')<CR>", { desc = "Switch to Git Changes" })
end

---------------------------------------format-------------------------------------------
-- todo(congyu) 需要验证这个功能
-- <leader>cf 格式化代码
if vim.g.vscode then
  -- 在VSCode中调用VSCode的格式化命令
  map({ "n", "v" }, "<leader>cf", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>", { desc = "Format Document" })
else
  -- 在普通Neovim中使用LazyVim的格式化功能
  map({ "n", "v" }, "<leader>cf", function()
    LazyVim.format({ force = true })
  end, { desc = "Format" })
end

















--------------------------------------------------------------------
if true then
  return
end

-- 下面的语句是lazyvim默认键位，放在这里方便查阅，不要在下面编辑更改。

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
map({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
LazyVim.toggle.map("<leader>uf", LazyVim.toggle.format())
LazyVim.toggle.map("<leader>uF", LazyVim.toggle.format(true))
LazyVim.toggle.map("<leader>us", LazyVim.toggle("spell", { name = "Spelling" }))
LazyVim.toggle.map("<leader>uw", LazyVim.toggle("wrap", { name = "Wrap" }))
LazyVim.toggle.map("<leader>uL", LazyVim.toggle("relativenumber", { name = "Relative Number" }))
LazyVim.toggle.map("<leader>ud", LazyVim.toggle.diagnostics)
LazyVim.toggle.map("<leader>ul", LazyVim.toggle.number)
LazyVim.toggle.map( "<leader>uc", LazyVim.toggle("conceallevel", { values = { 0, vim.o.conceallevel > 0 and vim.o.conceallevel or 2 } }))
LazyVim.toggle.map("<leader>uT", LazyVim.toggle.treesitter)
LazyVim.toggle.map("<leader>ub", LazyVim.toggle("background", { values = { "light", "dark" }, name = "Background" }))
if vim.lsp.inlay_hint then
  LazyVim.toggle.map("<leader>uh", LazyVim.toggle.inlay_hints)
end

-- lazygit
map("n", "<leader>gg", function() LazyVim.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>gG", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
map("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
map("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })

map("n", "<leader>gf", function()
  local git_path = vim.api.nvim_buf_get_name(0)
  LazyVim.lazygit({args = { "-f", vim.trim(git_path) }})
end, { desc = "Lazygit Current File History" })

map("n", "<leader>gl", function()
  LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
end, { desc = "Lazygit Log" })
map("n", "<leader>gL", function()
  LazyVim.lazygit({ args = { "log" } })
end, { desc = "Lazygit Log (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- LazyVim Changelog
map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<leader>fT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
LazyVim.toggle.map("<leader>wm", LazyVim.toggle.maximize)

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
