vlib work
vlog Lab6Part2.v
vsim Lab6Part2

log {/*}
add wave {/*}

force {CLOCK_50} 0 0ns, 1 5ns -r 10ns
force {KEY[0]} 0

# A = 5, B = 3, C = 1, x = 2
force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1
force {KEY[0]} 0
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 1
force {KEY[0]} 1
force {KEY[1]} 0
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns


force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 1
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 1
force {KEY[0]} 1
force {KEY[1]} 0
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 1
force {KEY[0]} 1
force {KEY[1]} 0
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns


force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 0
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

# A = 4, B = 0, C = 2, x = 4

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 0
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns


force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 0
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 0
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 0
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns


force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 1
force {SW[1]} 0
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 0
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 10ns

force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[4]} 0
force {SW[3]} 0
force {SW[2]} 0
force {SW[1]} 1
force {SW[0]} 0
force {KEY[0]} 1
force {KEY[1]} 1
force {CLOCK_50} 0 0ns, 1 {1ns} -r 2ns
run 20ns