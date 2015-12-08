set nocompatible " 关闭vi兼容
set enc=utf-8
filetype plugin on " 文件类型

set history=500 " 历史命令

syntax on
set nu " set number
set ts=4 " set tabstop=4
set sts=4 " set softtabstop=4
set sw=4 " set shiftwidth=4
set et " set expandtab
set ai " set autoindent
" set smartindent " 智能缩进

" set ruler " 右下角显示光标状态行，默认
" set showmatch " 括号匹配
" set nohls " 关闭匹配的高亮显示
" set incsearch " 设置快速搜索
set foldenable " 开启代码折叠
" set fdm=manual " 手动折叠
set foldmethod=syntax " 自动语法折叠


if has("autocmd")
    filetype plugin indent on
endif
autocmd filetype python setlocal et sta sw=4 sts=4

" 根据文件类型自动插入文件头
autocmd BufNewFile *.py,*.sh, exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1, "\#!bin/bash")
        call append(line("."), "\# Author: guang.liang@xinmei365.com")
        call append(line(".")+1, "")
        call append(line(".")+2, "")
    else
        call setline(1, "\#!/usr/bin/env python")
        call append(line("."), "\# -*- encoding:UTF-8 -*-")
        call append(line(".")+1, "\# Author: guang.liang@xinmei365.com")
        call append(line(".")+2, "")
        call append(line(".")+3, "")
    endif
endfunc

" 新建文件后自动定位至文件末尾
autocmd BufNewFile * normal G
" F2 去空行
nnoremap <F2> :g/^\s*$/d<CR>
" map 设置 vim
" 的按键映射,参考：http://haoxiang.org/2011/09/vim-modes-and-mappin/

set modeline " 自动载入模式行
" vim:et:ts=4:sw=4: 
" 上面是 vim 的 modeline 模式，当其他人的 vimrc 打开了 set modeline
" 模式的时候，会自动读入这个配置。更多参考 :help auto-setting 和 :help
" modeline

" 自动载入 modeline
" 参考：http://blog.csdn.net/heli007/article/details/8285092

