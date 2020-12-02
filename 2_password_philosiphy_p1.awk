match($0, /([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)/, array) {
    lb = array[1]
    ub = array[2]
    ch = array[3]
    passwd = array[4]

    ch_count = 0
    for (i = 1; i <= length(passwd); ++i) {
        if (substr(passwd, i, 1) == ch)
            ch_count++
    }

    if (ch_count >= lb && ch_count <= ub)
        total++

}

END {
    print total
}
