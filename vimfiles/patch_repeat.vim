" 
function! RmDiffPat( from, pattern )
    " echo "from: " a:from
    let prevws = getbufvar( 0, "&ws" )
    cal setbufvar( 0, "&ws", 0 )
    call setpos( '.', [0, a:from, 1] )
    let escaped = escape( a:pattern, './ ' )
    " искать сохранённую строку предварительно экранировав спецсимволы
    " пока не будет достигнут конец файла
    let fnd = search( escaped, 'W' )
    " echo "g fnd: " fnd
    " если нашли ещё одну такую
    while fnd != 0
        " call setpos( '.', [0, fnd, 1] ) because of that search moves cursor!
        let index = search( "Index\:", 'nW' )
        " удалить содержимое файла до следующей директивы Index
        " to avoid error message due to reach end of file
        if index
            .,/Index\:/-1 d _ 
        else
            .;$ d _ 
        endif
        " accept situations where several 
        " duplicated patches comes consecutively
        let fnd = search( escaped, 'cW' )
        " echo "fnd: " fnd
    endwhile
    " return cursor to its last known position
    call setpos( '.', [0, a:from, 1] ) 
    " return wrapscan option for its previous value
    call setbufvar( 0, "&ws", prevws )
endfunction

function! RmRepDiffs( ) 
    " переместить курсор в начало файла
    let pos = getpos( '.' )
    call setpos('.', [0, 1, 1] )
    " пока поиск Index: успешен
    let found = search( "Index\:", 'cW' )

    while found != 0
        " echo "found: " found
        " echo "pos: " getpos( '.' )[1]
        " сохраним строку с именем файла
        let line = getline( found )

        call RmDiffPat( found, line )

        " найти Index:
        let found = search( "Index\:", 'W' )

    endwhile
    call setpos( '.', pos )
endfunction

