vlib work
vlog Lab5Part3.v
vsim Lab5Part3

log {/*}
add wave {/*}

#test case 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {KEY[0]} 0
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 5ns -r 10ns

run 10 ns

force {KEY[0]} 1
run 10 ns
 
force {KEY[1]} 0
run 80 ns 

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {KEY[1]} 1
run 10 ns

force {KEY[1]} 0
run 80 ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {KEY[1]} 1
run 10 ns

force {KEY[1]} 0
run 80 ns

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {KEY[1]} 1
run 10 ns

force {KEY[1]} 0
run 80 ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {KEY[1]} 1
run 10 ns

force {KEY[1]} 0
run 80 ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 1
force {KEY[1]} 1
run 10 ns

force {KEY[1]} 0
run 80 ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {KEY[1]} 1
run 10 ns

force {KEY[1]} 0
run 80 ns