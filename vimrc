set nocompatible              " 去除VI一致性,必須
filetype off                  " 必須

" pathogen
execute pathogen#infect()  

helptags ~/script/vim/doc
set helplang=cn 
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

"set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h12

" mac和linux系统将enc设置为utf-8
set enc=utf-8

" 设置外观 -------------------------------------
set number                      "显示行号
set showtabline=0               "隐藏顶部标签栏"
set guioptions-=r               "隐藏右侧滚动条"
set guioptions-=L               "隐藏左侧滚动条"
set guioptions-=b               "隐藏底部滚动条"
set cursorline                  "突出显示当前行"
set cursorcolumn                "突出显示当前列"
set langmenu=zh_CN.UTF-8        "显示中文菜单
" 变成辅助 -------------------------------------
syntax on                       "开启语法高亮
set nowrap                      "设置代码不折行"
set fileformat=unix             "设置以unix的格式保存文件"
set cindent                     "设置C样式的缩进格式"
set tabstop=4                   "一个 tab 显示出来是多少个空格，默认 8
set shiftwidth=4                "每一级缩进是多少个空格
set backspace+=indent,eol,start "set backspace&可以对其重置
set showmatch                   "显示匹配的括号"
set scrolloff=5                 "距离顶部和底部5行"
set laststatus=2                "命令行为两行"
" 其他杂项 -------------------------------------
set mouse=a                     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase                  "忽略大小写"
set incsearch
set hlsearch                    "高亮搜索项"
set noexpandtab                 "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread

" 配置NERDTree
"使用F3键快速调出和隐藏它
map <F3> :NERDTreeToggle<CR>

let NERDTreeChDirMode=1

"显示书签"
let NERDTreeShowBookmarks=1

"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

"窗口大小"
let NERDTreeWinSize=25

" 修改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree           

"How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 开发的过程中，我们希望git信息直接在NERDTree中显示出来， 和Eclipse一样，修改的文件和增加的文件都给出相应的标注， 这时需要安装的插件就是 nerdtree-git-plugin,配置信息如下
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1

" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" 分割布局
" 指定屏幕上可以进行分割布局的区域
set splitbelow               " 允许在下部分割布局
set splitright               " 允许在右侧分隔布局

" 组合快捷键：
nnoremap <C-J> <C-W><C-J>    " 组合快捷键：- Ctrl-j 切换到下方的分割窗口
nnoremap <C-K> <C-W><C-K>    " 组合快捷键：- Ctrl-k 切换到上方的分割窗口
nnoremap <C-L> <C-W><C-L>    " 组合快捷键：- Ctrl-l 切换到右侧的分割窗口
nnoremap <C-H> <C-W><C-H>    " 组合快捷键：- Ctrl-h 切换到左侧的分割窗口

" 配置taglist
let Tlist_Use_Right_Window = 1          "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1      "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_Show_One_File = 1             "只显示一个文件中的tag，默认为显示多个
let Tlist_Sort_Type ='name'             "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1       "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1           "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 32             "设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'  "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个

map t :TlistToggle<CR>              "热键设置，我设置成Leader+t来呼出和关闭Taglist

" 按照PEP8标准来配置vim
au BufNewFile,BufRead *.py set tabstop=4 |set softtabstop=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent|set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2|set softtabstop=2|set shiftwidth=2

" Disable show diff window
let g:autopep8_disable_show_diff=1

" vim-autopep8自1.11版本之后取消了F8快捷键，需要用户自己为:Autopep8设置快捷键：
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" 配置indentline
" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
let g:indentLine_char='¦'   

" 使indentline生效
let g:indentLine_enabled = 1    

" 配置代码折叠 SimpylFold
" 必须手动输入za来折叠（和取消折叠）
set foldmethod=indent                " 根据每行的缩进开启折叠
set foldlevel=99

" 使用空格键会是更好的选择,所以在你的配置文件中加上这一行命令吧：
nnoremap <space> za

" 希望看到折叠代码的文档字符串？
let g:SimpylFold_docstring_preview=1

"YouCompleteMe 插件配置  
let g:ycm_global_ycm_extra_conf='~/.vim/autoload/.ycm_extra_conf.py'  
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>  
"let g:ycm_python_binary_path = '/usr/local/Cellar/python/3.6.5_1/bin'  
let g:ycm_python_binary_path = '/usr/bin/python'  
nmap<C-a> :YcmCompleter FixIt<CR>  

" 配置多行注释
" nerdcommenter默认热键<leader>为'\'，这里将热键设置为','
let mapleader=','

" 设置注释快捷键
map <F4> <leader>ci<CR>


" 执行python
map <F6> <ESC>:Autopep8<CR>:w<CR>:call RunPython()<CR>

function! RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction


" 配色方案
syntax enable
set background=dark
colorscheme solarized

" 配置插件powerline
" 将字体设置为Meslo LG S DZ Regular for Powerline 13号大小
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h12

"let g:Powerline_symbols = 'fancy'       " Powerline_symbols为状态栏中的箭头，unicode没有箭头
let g:Powerline_symbols='unicode'

set laststatus=2                " 必须设置为2,否则状态栏不显示
set t_Co=256                    " 开启256颜色之后，colorschema在vim里好看了许多
let g:Powerline_colorscheme='solarized256'  " 状态栏使用了solarized256配色方案

"set fillchars+=stl:\ ,stlnc:\          " 状态栏如果有\\\\\或^^^^^等符号出现，添加此句再删掉此句就好了

" TagBar 自动生成参数和方法
" Then the F8 key will toggle the Tagbar window.
map <F8> :TagbarToggle<CR>

"syntastic 保存检查代码时候传入参数
let g:syntastic_java_javac_args="-cp ../../lib:../../bin -sourcepath ../../bin -Djava.ext.dirs=../../lib -d ../../bin"

" 关于Java自动文件补全插件
setlocal omnifunc=javacomplete#Complete
autocmd Filetype java set omnifunc=javacomplete#Complete               " 这一句是自动补全（好像是）
autocmd Filetype java set completefunc=javacomplete#CompleteParamsInf  " 这一句是参数提示，好像不太好用，
"autocmd Filetype java set omnifunc=javacomplete#Complete
"autocmd Filetype java set completefunc=javacomplete#CompleteParamsInf
"inoremap
"inoremap
" 在VIM编辑java文件时当敲入 . 时会出发
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
autocmd Filetype java,javascript,jsp inoremap <buffer>  .  .<C-X><C-O><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  A  A<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  B  B<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  C  C<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  D  D<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  E  E<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  F  F<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  G  G<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  H  H<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  I  I<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  J  J<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  K  K<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  L  L<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  M  M<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  N  N<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  O  O<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  P  P<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  Q  Q<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  R  R<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  S  S<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  T  T<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  U  U<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  V  V<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  W  W<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  X  X<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  Y  Y<C-N><C-P>
autocmd Filetype java,javascript,css,html,xml inoremap <buffer>  Z  Z<C-N><C-P>
"autocmd Filetype java,javascript,jsp inoremap   .  .
"autocmd Filetype java,javascript,jsp inoremap   .  .

