onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_counters_controller/clock
add wave -noupdate /tb_counters_controller/reset
add wave -noupdate /tb_counters_controller/enable
add wave -noupdate -radix hexadecimal /tb_counters_controller/Output
add wave -noupdate -radix hexadecimal -childformat {{{/tb_counters_controller/blinks[3]} -radix hexadecimal} {{/tb_counters_controller/blinks[2]} -radix hexadecimal} {{/tb_counters_controller/blinks[1]} -radix hexadecimal} {{/tb_counters_controller/blinks[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_counters_controller/blinks[3]} {-radix hexadecimal} {/tb_counters_controller/blinks[2]} {-radix hexadecimal} {/tb_counters_controller/blinks[1]} {-radix hexadecimal} {/tb_counters_controller/blinks[0]} {-radix hexadecimal}} /tb_counters_controller/blinks
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26945 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {52500 ps}
bookmark add wave bookmark0 {{5039496 ps} {7439978 ps}} 0
