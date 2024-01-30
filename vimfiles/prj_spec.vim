
let s:dba_logs_pat = "/ARCHIVE/logs/db_agent.log*"
let s:dbasni_logs_pat = "/ARCHIVE/logs/db_agent_sniffer*"
let s:diffs_dir = "$HOME/reqs/diffs"

function UpdDBALogs()
    
    let pos = getpos( '.' )
    if search( '[DBA_LOGS]', 'cwn' )
        silent /\[DBA_LOGS\]/, /\[DBA_LOGS\]/+10 d _ 
    endif
    $put = '[DBA_LOGS]'
    execute "silent $r!ls -t " . s:dba_logs_pat . " | head "
    call setpos( '.', pos )
    unlet pos
endfunction

function UpdDBASniLogs()
    
    let pos = getpos( '.' )
    if search( '[DBASni_LOGS]', 'cwn' )
        silent /\[DBASni_LOGS\]/, /\[DBASni_LOGS\]/+10 d _ 
    endif
    $put = '[DBASni_LOGS]'
    execute "silent $r!ls -t " . s:dbasni_logs_pat . " | head "
    call setpos( '.', pos )
    unlet pos
endfunction

au BufEnter *_search.txt call UpdDBALogs()
