" src:https://github.com/yangyangwithgnu/use_vim_as_ide/blob/master/.vimrc

" >>>>>>>
" vim自身（非插件）快捷键
" 定义快捷键的前缀，即 <Leader>
let mapleader=";"
" 跳转行首尾
nmap LB 0
nmap LE $
" 将选中内容复制进系统剪贴板
vnoremap <Leader>y "+y
" 将系统剪贴板内容复制进vim
nmap <Leader>p "+p
" 分割当前窗口
nmap <Leader>q :q<CR>
" 保存当前窗口内容
nmap <Leader>w :w<CR>
" <<<<<<<


" >>>>>>>
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" <<<<<<<

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" >>>>>>>
" 其他

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" <<<<<<<

" >>>>>>>
" 配色方案需要安装
set background=dark
"colorscheme default
"colorscheme solarized
"colorscheme molokai
"colorscheme phd
" <<<<<<<


" >>>>>>>
" 营造专注气氛

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" <<<<<<<

" >>>>>>>
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
"" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()
" <<<<<<<

" >>>>>>>
" 辅助信息

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline 
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=red ctermfg=white   
hi CursorColumn cterm=NONE ctermbg=red ctermfg=white  
"可选颜色 red（红），white（白），black（黑），green（绿），yellow（黄），blue（蓝），purple（紫），gray（灰），brown（棕），tan(褐色)，syan(青色)
" 高亮显示搜索结果
set hlsearch

" <<<<<<<

" >>>>>>>
" 其他美化

" 设置 gvim 显示字体    需要安装字体 yahei consolas hybrid 字体
" 其中，由于字体名存在空格，需要用转义符“\”进行转义；最后的数字用于指定字体大小
set guifont=YaHei\ Consolas\ Hybrid\ 10.5
" 禁止折行
set nowrap
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
" <<<<<<<

" >>>>>>>
" 语法分析
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" <<<<<<<

" >>>>>>>
" 缩进

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 需要安装缩进可视化插件 Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" <<<<<<<

" >>>>>>>
" 代码折叠
" za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠 
" 基于缩进或语法进行代码折叠
"set foldmethod=indent  "基于缩进
set foldmethod=syntax   "基于语法
" 启动 vim 时关闭折叠代码
set nofoldenable
" <<<<<<<



" >>>>>>>以下为插件加载>>>>>>>
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
"插件管理Vun
Plugin 'VundleVim/Vundle.vim'
"powerline插件【注意】似乎和tmux冲突，不能显示
Plugin 'Lokaltog/vim-powerline'
"cpp代码高亮
Plugin 'octol/vim-cpp-enhanced-highlight'
"cpp代码缩进显示【注意】这个插件可以用，但是进入vim时会报错，尚未解决！！！
"Plugin 'nathanaelkane/vim-indent-guides'
"代码自动补全
Plugin 'Valloric/YouCompleteMe'

" 插件列表结束
call vundle#end()
filetype plugin indent on
