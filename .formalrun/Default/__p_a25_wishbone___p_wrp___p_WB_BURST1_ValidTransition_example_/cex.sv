window close Console
if { [window find -type waveform] == "" } {
    exit
}
preferences set waveform-double-click-command {@goto-cause}
preferences set use-signal-type-colors {1}
preferences set signal-type-colors {unknown #FFFFFF assertion #FF0000 errorsignal #FF0000 fiber #FF99FF input #FFFF00 internal #00FF00 output #FFA500 group #ffffff overlay #0099FF inout #00FFFF}
waveform using {Waveform 1}
waveform set -using {Waveform 1} -name {Waveform 1 - Example for : ...wrp.WB_BURST1_ValidTransition}
waveform set -units ms

proc window_notify_callbacks {args} {
    array set info $args
    if {$info(type) == "source"} {
    srcbrowser set -using $info(window) -displayvalues 1
        }
    }
window extensions notify add !create window_notify_callback
group new -name "a25_wishbone.wrp.WB_BURST1_ValidTransition"
group set -contents { \
    "a25_wishbone.wrp.i_clk" \
    "a25_wishbone.wrp.i_wb_ack" \
    "a25_wishbone.wrp.wishbone_st" \
}

waveform add -signals {"a25_wishbone.wrp.f_WB_BURST1_ValidTransition_example"}

waveform add -groups [list \
    "a25_wishbone.wrp.WB_BURST1_ValidTransition" \
]

waveform xview zoom -using {Waveform 1 - Example for : ...wrp.WB_BURST1_ValidTransition} -outfull
cursor set -using "TimeA" -time 2900us
