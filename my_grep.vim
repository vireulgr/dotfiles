let source_path=getcwd()
let logs_path="/ARCHIVE/logs"
let dl80_path="D:/VCS/DL80"
let vi_path="D:/VCS/VI"


if has( "win32" ) 
    function MyGrep( pattern, path, case, whole )
        execute "normal! GoSearch text " . a:pattern . " in " . a:path . " and subdirs, case: " . a:case . " whole words: " . a:whole
        "E - extended regexp, l - display filenames only, r - search recursively
        let l:keys = "Elr"
        if a:case == 1
            "case-sensitive
            let l:keys = l:keys . " -CaseSensitive "
        endif
        " whole is always false because PowerShell searches in reg ex and user must explicitly point to that in his reg ex
        "if a:whole != 0
            "whole words only
        "    let l:keys = l:keys . "w"
        "endif
        " let l:cmd = "r!grep -" . l:keys . " -e \"" . a:pattern ."\" "
        " let l:cmd2 = a:path . " --exclude=*.o --exclude=*.d --exclude-dir=.svn --exclude-dir=.d --exclude-dir=rc.d --binary-files=without-match"
        " echo l:cmd . l:cmd2
        let l:cmd = "r!powershell -NoLogo -NonInteractive -Command \"gci " 
        l:cmd = l:cmd . a:path . " -recurse -include \"*.h\",\"*.cpp\",\"*.hpp\",\"*.rc\",\"*.vcxproj\",\"*.sln\",\"*.c\" "
        l:cmd = l:cmd . " | "
        l:cmd = l:cmd . " select-string " . l:keys . " " . a:pattern
        echo l:cmd
        execute l:cmd 
    endfunction

elseif has( "unix" )

    function MyGrep( pattern, path, case, whole )
        execute "normal! GoSearch text " . a:pattern . " in " . a:path . " and subdirs, case: " . a:case . " whole words: " . a:whole
        "E - extended regexp, l - display filenames only, r - search recursively
        let l:keys = "Elr"
        if a:case == 0
            "case-sensitive
            let l:keys = l:keys . "i" 
        endif
        if a:whole != 0
            "whole words only
            let l:keys = l:keys . "w"
        endif
        let l:cmd = "r!grep -" . keys . " -e \"" . a:pattern ."\" "
        let l:cmd2 = a:path . " --exclude=*.o --exclude=*.d --exclude-dir=.svn --exclude-dir=.d --exclude-dir=rc.d --binary-files=without-match"
        echo l:cmd . l:cmd2
        execute l:cmd . l:cmd2
    endfunction
else
    function MyGrep( pattern, path, case, whole )
        echo "MyGrep is not supported!"
    endfunction
endif

"shortcuts with path
function GrepInPath( path, pattern )
    call MyGrep( a:pattern, a:path, 0, 0)
endfunction

function GrepInPathWhole( path, pattern )
    call MyGrep( a:pattern, a:path, 0, 1)
endfunction

function GrepInPathCase( path, pattern )
    call MyGrep( a:pattern, a:path, 1, 0 )
endfunction

function GrepInPathCaseWhole( path, pattern )
    call MyGrep( a:pattern, a:path, 1, 1 )
endfunction

" shortcuts without path
function GrepInSrc( pattern )
    call MyGrep( a:pattern, g:source_path, 0, 0)
endfunction

function GrepInSrcWhole( pattern )
    call MyGrep( a:pattern, g:source_path, 0, 1)
endfunction

function GrepInSrcCase( pattern )
    call MyGrep( a:pattern, g:source_path, 1, 0 )
endfunction

function GrepInSrcCaseWhole( pattern )
    call MyGrep( a:pattern, g:source_path, 1, 1 )
endfunction

function GrepInLogs( pattern ) 
    call MyGrep( a:pattern, g:logs_path, 0, 0)
endfunction

function GrepInLogsWhole( pattern )
    call MyGrep( a:pattern, g:logs_path, 0, 1)
endfunction

function GrepInLogsCase( pattern )
    call MyGrep( a:pattern, g:logs_path, 1, 0 )
endfunction

function GrepInLogsCaseWhole( pattern )
    call MyGrep( a:pattern, g:logs_path, 1, 1 )
endfunction

" command -nargs=+ -complete=file GrepInSrc call MyGrep( <f-args> ) 

com -nargs=1 GrepInLogs          call GrepInLogs(           <q-args> )
com -nargs=1 GrepInLogsCaseWhole call GrepInLogsCaseWhole(  <q-args> )
com -nargs=1 GrepInLogsCase      call GrepInLogsCase(       <q-args> )
com -nargs=1 GrepInLogsWhole     call GrepInLogsWhole(      <q-args> )

com -nargs=1 GrepHere          call MyGrep( <q-args>, "./", 0, 0)
com -nargs=1 GrepHereCaseWhole call MyGrep( <q-args>, "./", 1, 1)
com -nargs=1 GrepHereCase      call MyGrep( <q-args>, "./", 1, 0)
com -nargs=1 GrepHereWhole     call MyGrep( <q-args>, "./", 0, 1)

com -nargs=+ GrepInPath          call GrepInPath(           <f-args> )
com -nargs=+ GrepInPathCaseWhole call GrepInPathCaseWhole(  <f-args> )
com -nargs=+ GrepInPathCase      call GrepInPathCase(       <f-args> )
com -nargs=+ GrepInPathWhole     call GrepInPathWhole(      <f-args> )

com -nargs=1 GrepInDL           call MyGrep( <q-args>, g:dl80_path, 0, 0 )
com -nargs=1 GrepInVI           call MyGrep( <q-args>, g:vi_path, 0, 0 )
