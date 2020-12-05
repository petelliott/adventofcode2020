#!/bin/bash

COUNT=0

while true
do
    PASSPORT=""
    read LINE
    until [[ "$LINE" = "" ]]
    do
        PASSPORT="$PASSPORT $LINE"
        read LINE
    done

    if [[ "$PASSPORT" = "" ]]
    then
        break
    fi

    (echo "$PASSPORT" | grep "byr" -q) && \
        (echo "$PASSPORT" | grep "iyr" -q) && \
        (echo "$PASSPORT" | grep "eyr" -q) && \
        (echo "$PASSPORT" | grep "hgt" -q) && \
        (echo "$PASSPORT" | grep "hcl" -q) && \
        (echo "$PASSPORT" | grep "ecl" -q) && \
        (echo "$PASSPORT" | grep "pid" -q)

    if [[ $? -eq 0 ]]
    then
        COUNT=$(($COUNT + 1))
    fi

done

echo $COUNT
