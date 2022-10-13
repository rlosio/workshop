#!/bin/bash

put_item() {
    aws dynamodb put-item --table-name renato-workshop --item "{\"userid\": {\"S\": \"workshop-$1\"}, \"date\": {\"N\": \"$RANDOM\"}}" 
}


draw_block() {

    echo "Putting for $1 seconds"
    
    s=$(date "+%s")

    run=$(($s+$1))
    idle=$((60-$1))

    # echo $run $idle

    while [ $s -lt $run ]; do
	s=$(date "+%s")
	put_item $RANDOM
    done

    sleep $idle

}

fair_start() {

    S=$(date "+%S")
    W=$((60-$S))
    echo "Waiting $W seconds before starting..."
    sleep $W
}

fair_start

draw_block 22;
draw_block 22;
draw_block 22;
draw_block 20;
draw_block 18;
draw_block 10;
draw_block 7;
draw_block 5;
draw_block 38;
draw_block 40;
draw_block 42;
draw_block 50;
draw_block 42;
draw_block 40;
draw_block 38;
draw_block 15;
draw_block 15;
draw_block 15;
draw_block 5;
draw_block 5;
draw_block 5;
draw_block 34;
draw_block 36;
draw_block 38;
draw_block 40;
draw_block 20;
draw_block 20;
draw_block 20;
draw_block 36;
draw_block 46;
draw_block 50;
draw_block 46;
draw_block 36;
draw_block 6;
draw_block 6;
draw_block 6;
draw_block 4;
draw_block 2;
draw_block 0;

