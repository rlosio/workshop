#!/bin/bash

draw_block() {

    s=$(date "+%s")

    run=$(($s+$1))
    idle=$((60-$1))

    echo "Posting to Dynamo for $1 seconds - idle for $idle seconds"

    while [ $s -lt $run ]; do
        s=$(date "+%s")
        aws lambda invoke --function-name putItemDynamoDB /tmp/response.json 2>/dev/null 1>&2
    done

    sleep $idle

}

fair_start() {

    S=$(date "+%S")
    W=$((60-$S))
    echo "Waiting $W seconds before starting..."
    sleep $W
}

# sleep 900
fair_start

# New York City
# Skyline


draw_block 22
draw_block 22
draw_block 22
draw_block 20
draw_block 18
draw_block 10
draw_block 7
draw_block 5
draw_block 38
draw_block 40
draw_block 42
draw_block 50
draw_block 42
draw_block 40
draw_block 38
draw_block 15
draw_block 15
draw_block 15
draw_block 5
draw_block 5
draw_block 5
draw_block 34
draw_block 36
draw_block 38
draw_block 40
draw_block 20
draw_block 20
draw_block 20
draw_block 36
draw_block 46
draw_block 50
draw_block 46
draw_block 36
draw_block 6
draw_block 6
draw_block 6
draw_block 4
draw_block 2
draw_block 0

