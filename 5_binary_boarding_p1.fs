: read_row 0
    key 'B' = if 1 9 lshift or endif
    key 'B' = if 1 8 lshift or endif
    key 'B' = if 1 7 lshift or endif
    key 'B' = if 1 6 lshift or endif
    key 'B' = if 1 5 lshift or endif
    key 'B' = if 1 4 lshift or endif
    key 'B' = if 1 3 lshift or endif
    key 'R' = if 1 2 lshift or endif
    key 'R' = if 1 1 lshift or endif
    key 'R' = if 1 0 lshift or endif
    key drop ( newline ) ;

: solve 0
    begin
        key dup 4 = invert while ( check for eof )
        unkey
        read_row max
    repeat drop ;

solve . CR
bye

