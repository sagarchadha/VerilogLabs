vlib work
vlog Lab4Part2.v
vsim Lab4Part2

log {/*}
add wave {/*}

#FUNCTION 1
#Reset B values to 0
force {SW[9]} 0

#test case 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

force {KEY[1]} 0
force {KEY[2]} 0
force {KEY[3]} 0

force {KEY[0]} 1
run 10 ns

#test case 2
force {SW[9]} 1

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1

force {KEY[1]} 0
force {KEY[2]} 0
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

#test case 3
force {KEY[0]} 1
run 10 ns

#test case 4
force {KEY[0]} 0
run 10 ns

#test case 5
force {KEY[0]} 1
run 10 ns

#Reset B values to 0
force {SW[9]} 0

#test case 6
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

force {KEY[1]} 0
force {KEY[2]} 0
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

#test case 7
force {KEY[0]} 1
run 10 ns

#FUNCTION 2
#Reset B values to 0
force {SW[9]} 0

#test case 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 0

force {KEY[0]} 1
run 10 ns

#test case 2
force {SW[9]} 1

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1

force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

#test case 3
force {KEY[0]} 1
run 10 ns

#test case 4
force {KEY[0]} 0
run 10 ns

#test case 5
force {KEY[0]} 1
run 10 ns

#Reset B values to 0
force {SW[9]} 0

#test case 6
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

#test case 7
force {KEY[0]} 1
run 10 ns

#FUNCTION 3
#Reset B values to 0
force {SW[9]} 0

#test case 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

#test case 2
force {SW[9]} 1
force {KEY[0]} 1
run 10 ns

#test case 3
force {KEY[0]} 0
run 10 ns

#test case 4
force {KEY[0]} 1
run 10 ns

#Reset B values to 0
force {SW[9]} 0

#test case 5
force {KEY[0]} 0
run 10 ns

#test case 6
force {KEY[0]} 1
run 10 ns

#FUNCTION 4
#Reset B values to 0
force {SW[9]} 0

#test case 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0

force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

#test case 2
force {SW[9]} 1
force {KEY[0]} 1
run 10 ns

#test case 3
force {KEY[0]} 0
run 10 ns

#test case 4
force {KEY[0]} 1
run 10 ns

#FUNCTION 5
#Reset B values to 0
force {SW[9]} 0

#test case 1 (use other function to get 1s in B)
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0

force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

#test case 2
force {SW[9]} 1
force {KEY[0]} 1
run 10 ns

#test case 3 (now testing this function)
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0

force {KEY[0]} 0
force {KEY[1]} 0
force {KEY[2]} 0
force {KEY[3]} 1
run 10 ns

#test case 4
force {KEY[0]} 1
run 10 ns

#FUNCTION 6
#Reset B values to 0
force {SW[9]} 0

#test case 1 (use other function to get 1s in B)
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0

force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

#test case 2
force {SW[9]} 1
force {KEY[0]} 1
run 10 ns

#test case 3 (now testing this function)
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0

force {KEY[0]} 0
force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 1
run 10 ns

#test case 4
force {KEY[0]} 1
run 10 ns

#FUNCTION 7
#Reset B values to 0
force {SW[9]} 0

#test case 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

force {KEY[1]} 0
force {KEY[2]} 1
force {KEY[3]} 1

force {KEY[0]} 0
run 10 ns

#test case 2
force {SW[9]} 1
force {KEY[0]} 1
run 10 ns

#test case 3
force {KEY[0]} 0
run 10 ns

#test case 4
force {KEY[0]} 1
run 10 ns

#test case 5
force {KEY[0]} 0
run 10 ns

#test case 6
force {KEY[0]} 1
run 10 ns

#FUNCTION 8
#test case 1
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 1

force {KEY[0]} 0
run 10 ns

#test case 2
force {KEY[0]} 1
run 10 ns

#test case 3
#Reset B values to 0
force {SW[9]} 0

force {KEY[0]} 0
run 10 ns

#test case 4
force {KEY[0]} 1
run 10 ns