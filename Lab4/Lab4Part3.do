vlib work
vlog Lab4Part3.v
vsim Lab4Part3

log {/*}
add wave {/*}

#Take in data values
#test case 1
force {SW[9]} 1

force {KEY[1]} 0
force {KEY[2]} 0
force {KEY[3]} 0

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 1
force {SW[7]} 1

force {KEY[0]} 1
run 10 ns

force {SW[9]} 0

force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

#LEFT SHIFT
force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

force {KEY[3]} 1
force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

#RIGHT SHIFT
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 0

force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

#RIGHT SHIFT with 0s
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 1

force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns

#Reset
force {SW[9]} 1

force {KEY[0]} 0
run 10 ns

force {KEY[0]} 1
run 10 ns
