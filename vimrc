" Useful patterns:
" codestyle check:                                          /([[:graph:]]\|[[:graph:]])
" codestyle check:                                          /(\S\|\S)
" codestyle check:                                          /([^)[:space:]]\|[^([:space:]])
" codestyle check:                                          /([^)[:blank:]]\|[^([:blank:]])
" delete .svn .o and .d files in filename list:             :<range>g/\.svn\|\.o$\|\.d$/d
" useful after acquiring file list using this command:      :r!find ./ -name "*<name>*" -type f
"
" IPv6                                            |   ipv4 tail               | |  mask  |
"(::)?([0-9a-fA-F]{1,4}:){,7}:?([0-9a-fA-F]{1,4})?(([0-9]{1,3}\.){3}[0-9]{1,3})?(\/[0-9]+)?
"(::)?([0-9a-fA-F]{1,4}:){,7}:?([0-9a-fA-F]{1,4})?(([0-9]{1,3}\.){3}[0-9]{1,3})?(\/[0-9]{1,3})?
"sed -nre "'s/[^0-9a-fA-F:]((::)?([0-9a-fA-F]{1,4}:){,7}:?([0-9a-fA-F]{1,4})?(([0-9]{1,3}\.){3}[0-9]{1,3})?(\/[0-9]{1,2})?)[^0-9a-fA-F:]/\1/p'
" IPv6                                                            | IPv4                        | mask        |
"((::)|([0-9a-fA-F]{1,4}:))([0-9a-fA-F]:){,6}:?([0-9a-fA-F]{1,4})?(([0-9]{1,3}\.){3}[0-9]{1,3})?(\/[0-9]{1,2})?
"(([0-9a-fA-F]:){1,7}((:((([0-9a-fA-F]:){1,5}[0-9a-fA-F])|(br)))|([0-9a-fA-F])))|(::(([0-9a-fA-F]:){,7}[0-9a-fA-F])|(br))
"+/&/p'
"
" example of using sub-replace-special \= in substitute command
" This changes date wrote in %s format to __%c__ format
" '<,'>s/\(\<[A-Z_]\+_TIME_[A-Z_]\+\>\s*=\s*\)\(\d\+\)/\="".submatch(1)."__".strftime( "%c", submatch(2) ) . "__"/g
"     %s/\(\<COMMAND[A-Z_]\+_TIME[A-Z_]*\>\s*=\s*\)\(\d\+\)/\="".submatch(1)."__".strftime( "%c", submatch(2) ) . "__"/g
"
" Macros to convert from aaa_servers.dat to format, suitable for win_client " AAA servers window insertion
" qaqqa
" 02f;dt;;pj
" 20@a
" G
" qrqqr
" 0f;r:;r/;r\tj
" 20@r

" assoc vim session file type (vis) with vim
" C:\>assoc .vis=vimsession
" C:\>ftype vimsession="C:\Program Files (x86)\vim\vim74\gvim.exe" -S "%1" "%2" "%3" "%4"

"
" ===============================
" Options
" ===============================

" Отключить backup-ы
" set nobackup
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin
" 

set encoding=cp1251

set nocompatible
syntax enable
" set number
"
" из ru.wikibooks.org/wiki/vim#.7E.2F.vimrc
" всегда делать активное окно максимального рзамера 
" Чтобы сплиты не делили размер окна поровну всегда
set noequalalways
"set winheight=9999

" чтобы vim переносил длинные строки
" set textwidth=160

" Отобразить строку состояния
set laststatus=2
" Формат строки состояния
"set statusline=\ %f%m%r%h%w%=\|\ %{&ff}\ \|\ %04l,%04v\ \|\ %L\ \|\ %P\ 
set statusline=\ %y\ %F%m%r%h%w%=\|\ %{&ff}\ \|\ 0x%B\ \|\ %04l/%L,%04v%04V\ 

" из habrahabr.ru/post/65518
" установить размер табуляции в 4 пробела 
set tabstop=4
set shiftwidth=4
"set smarttab
" replace tab with spaces
set expandtab

" Включить автоотступ для новых строк
set autoindent
" Включаем "умные" отступы и отступы в стиле "C" - нафик
"set smartindent
"set cindent
" Показывать положение курсора все время
set ruler
" Поиск при наборе текста
set incsearch
" Подсвечивать найденное
set hlsearch
" allow to use backspace instead of "x"
set backspace=indent,eol,start
" показывать незавершённые комбинации в нижней строке
set showcmd

" Encoding opts
"set encoding=utf-8
"set fileencoding=utf-8
set fencs=utf-8,koi8-r,cp1251

" dunno
set diffopt=filler,vertical

"
" Plugins
"
" ctags --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++
filetype plugin on

" maximize window
if has('gui_running')
    if has('win32')
        " autocmd GUIEnter * simalt ~x
        au GUIEnter * :set lines=50 columns=160
        set guioptions-=T " don't show toolbar
        set guioptions-=m " don't show menu
        colorscheme desert
        " установить шрифт
        " set guifont=anonymous_pro:h12:cRUSSIAN
        set guifont=Courier_New:h12:cRUSSIAN
        " au GUIEnter * call libcallnr('maximize', 'Maximize', 1)
    elseif has('gui_gtk2')
        au GUIEnter * :set lines=9999 columns=9999
    endif 
endif

colorscheme torte

" ===============================
" Commands
" ===============================
command -nargs=0 ShowDiff tabnew | set ft=diff | r!svn diff
command -nargs=1 T tabnext <args>

" function! CurPatchFile()
"     let nr = search( "^Index:\\s\\+\\S", "bncW" )
"     if l:nr != 0 
"         execute l:nr.",".l:nr."p"
"     else
"         echo "not found"
"     endif
" endfunction
" 
" map! [X :call CurPatchFile()<CR>

source <sfile>:h/my_grep.vim
source <sfile>:h/prj_spec.vim

set diffexpr=MyDiff()
function MyDiff()
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

