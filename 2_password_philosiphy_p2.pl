my $count = 0;

foreach my $line ( <STDIN> ) {
    $line =~ /([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)/;
    if ((substr($4, $1-1, 1) eq $3) ne (substr($4, $2-1, 1) eq $3)) {
        ++$count;
    }
}

print "$count\n";
