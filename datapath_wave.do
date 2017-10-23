onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datapath_tb/shift
add wave -noupdate /datapath_tb/ALUop
add wave -noupdate /datapath_tb/vsel
add wave -noupdate /datapath_tb/writenum
add wave -noupdate /datapath_tb/readnum
add wave -noupdate /datapath_tb/datapath_in
add wave -noupdate /datapath_tb/sximm8
add wave -noupdate /datapath_tb/sximm5
add wave -noupdate /datapath_tb/PC
add wave -noupdate /datapath_tb/status
add wave -noupdate /datapath_tb/datapath_out
add wave -noupdate -divider ALU
add wave -noupdate /datapath_tb/dut/ALU/status_in
add wave -noupdate /datapath_tb/dut/ALU/ovf
add wave -noupdate /datapath_tb/dut/ALU/sout
add wave -noupdate /datapath_tb/dut/ALU/out
add wave -noupdate -expand -group more /datapath_tb/dut/vsel
add wave -noupdate -expand -group more /datapath_tb/dut/status
add wave -noupdate -expand -group more /datapath_tb/dut/ALUout
add wave -noupdate -expand -group more /datapath_tb/dut/status_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {62 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 170
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
WaveRestoreZoom {12 ps} {41 ps}
