onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_tb/alu_op
add wave -noupdate /alu_tb/ain
add wave -noupdate /alu_tb/bin
add wave -noupdate /alu_tb/out
add wave -noupdate /alu_tb/status
add wave -noupdate -divider DUT
add wave -noupdate /alu_tb/DUT/status
add wave -noupdate /alu_tb/DUT/ovf
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {30 ps} {54 ps}
