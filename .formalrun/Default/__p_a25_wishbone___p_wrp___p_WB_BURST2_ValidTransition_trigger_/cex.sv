window close Console
if { [window find -type waveform] == "" } {
    exit
}
preferences set waveform-double-click-command {@goto-cause}
preferences set use-signal-type-colors {1}
preferences set signal-type-colors {unknown #FFFFFF assertion #FF0000 errorsignal #FF0000 fiber #FF99FF input #FFFF00 internal #00FF00 output #FFA500 group #ffffff overlay #0099FF inout #00FFFF}
waveform using {Waveform 1}
waveform set -using {Waveform 1} -name {Waveform 1 - Witness for : ...wrp.WB_BURST2_ValidTransition}
waveform set -units ms

proc window_notify_callbacks {args} {
    array set info $args
    if {$info(type) == "source"} {
    srcbrowser set -using $info(window) -displayvalues 1
        }
    }
window extensions notify add !create window_notify_callback
group new -name "a25_wishbone.wrp.WB_BURST2_ValidTransition"
group set -contents { \
    "a25_wishbone.wrp.i_clk" \
    "a25_wishbone.wrp.i_wb_ack" \
    "a25_wishbone.wrp.quick_n_reset" \
    "a25_wishbone.wrp.wishbone_st" \
}

group new -name "Constraints"
group set -contents { \
    "a25_wishbone.i_clk" \
}

group new -name "Inputs"
group set -contents { \
    "a25_wishbone.i_clk" \
    "a25_wishbone.i_dcache_cached_req" \
    "a25_wishbone.i_dcache_qword" \
    "a25_wishbone.i_dcache_uncached_req" \
    "a25_wishbone.i_dcache_write" \
    "a25_wishbone.i_icache_qword" \
    "a25_wishbone.i_icache_req" \
    "a25_wishbone.i_wb_ack" \
    "a25_wishbone.quick_n_reset" \
}

group new -name "Related Signals"
group set -contents { \
    "a25_wishbone.dcache_cached_rready" \
    "a25_wishbone.dcache_cached_rreq_c" \
    "a25_wishbone.dcache_cached_rreq_in" \
    "a25_wishbone.dcache_cached_rreq_r" \
    "a25_wishbone.dcache_cached_wready" \
    "a25_wishbone.dcache_cached_wreq_c" \
    "a25_wishbone.dcache_cached_wreq_in" \
    "a25_wishbone.dcache_cached_wreq_r" \
    "a25_wishbone.dcache_read_qword_c" \
    "a25_wishbone.dcache_read_qword_r" \
    "a25_wishbone.dcache_req_c" \
    "a25_wishbone.dcache_uncached_rready" \
    "a25_wishbone.dcache_uncached_rreq_c" \
    "a25_wishbone.dcache_uncached_rreq_in" \
    "a25_wishbone.dcache_uncached_rreq_r" \
    "a25_wishbone.dcache_uncached_wready" \
    "a25_wishbone.dcache_uncached_wreq_c" \
    "a25_wishbone.dcache_uncached_wreq_in" \
    "a25_wishbone.dcache_uncached_wreq_r" \
    "a25_wishbone.extra_write" \
}

waveform add -signals {"a25_wishbone.wrp.f_WB_BURST2_ValidTransition_trigger"}

waveform add -groups [list \
    "a25_wishbone.wrp.WB_BURST2_ValidTransition" \
]

set groupId [waveform add -groups [list \
    "Constraints" \
    "Inputs" \
    "Related Signals" \
]]

waveform hierarchy collapse $groupId

waveform xview zoom -using {Waveform 1 - Witness for : ...wrp.WB_BURST2_ValidTransition} -outfull
cursor set -using "TimeA" -time 1900us
