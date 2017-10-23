onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_autograder_example_tb/in
add wave -noupdate /cpu_autograder_example_tb/out
add wave -noupdate /cpu_autograder_example_tb/DUT/instruction_out
add wave -noupdate /cpu_autograder_example_tb/DUT/load
add wave -noupdate /cpu_autograder_example_tb/clk
add wave -noupdate /cpu_autograder_example_tb/DUT/loada
add wave -noupdate /cpu_autograder_example_tb/DUT/loadb
add wave -noupdate /cpu_autograder_example_tb/DUT/loads
add wave -noupdate /cpu_autograder_example_tb/DUT/loadc
add wave -noupdate /cpu_autograder_example_tb/DUT/write
add wave -noupdate /cpu_autograder_example_tb/DUT/asel
add wave -noupdate /cpu_autograder_example_tb/DUT/bsel
add wave -noupdate -divider FSM
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/state
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/next_state
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/s
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/reset
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/w
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/load_s
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/vsel
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/nsel
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/opcode
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/op
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/loada
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/loadb
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/loadc
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/loads
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/write
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/asel
add wave -noupdate /cpu_autograder_example_tb/DUT/state_machine/bsel
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /cpu_autograder_example_tb/DUT/decoder/readnum
add wave -noupdate /cpu_autograder_example_tb/DUT/decoder/sximm8
add wave -noupdate /cpu_autograder_example_tb/DUT/decoder/writenum
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 383
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {111 ps} {136 ps}
