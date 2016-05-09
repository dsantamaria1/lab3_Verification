module module4SVA ( input logic i_clk, 
                    input logic [2:0] wishbone_st, 
                    input logic i_wb_ack, 
                    input logic quick_n_reset, 
                    input logic extra_write_r  
                  );
  
  import FSMProperties::*;
  const int timeOut = 1000; 
  // states recreated
  localparam [3:0] WB_IDLE            = 3'd0,
                   WB_BURST1          = 3'd1,
                   WB_BURST2          = 3'd2,
                   WB_BURST3          = 3'd3,
                   WB_WAIT_ACK        = 3'd4;
  
  
  /*place your properties here*/
  WB_IDLE_ValidTransition: assert property( FSMValidTransition(i_clk, (wishbone_st == WB_IDLE), 
                                                               1'b1,  (wishbone_st == WB_IDLE || 
        						       wishbone_st == WB_BURST1 || wishbone_st == WB_WAIT_ACK),
							       quick_n_reset) 
                                          );
  WB_BURST1_ValidTransition: assert property( FSMValidTransition(i_clk, (wishbone_st == WB_BURST1), 
                                                                 i_wb_ack, (wishbone_st == WB_BURST2),
								 quick_n_reset) 
                                            );
  WB_BURST2_ValidTransition: assert property( FSMValidTransition(i_clk, (wishbone_st == WB_BURST2), 
                                                                 i_wb_ack, (wishbone_st == WB_BURST3), 
								 quick_n_reset) 
                                            );
  WB_BURST3_ValidTransition: assert property( FSMValidTransition(i_clk, (wishbone_st == WB_BURST3), 
                                                                 i_wb_ack, (wishbone_st == WB_WAIT_ACK), 
								 quick_n_reset) 
                                            );
  WB_WAIT_ACK_ValidTransition1: assert property( FSMValidTransition(i_clk, (wishbone_st ==  WB_WAIT_ACK), 
                                                                    (extra_write_r || ~i_wb_ack), (wishbone_st == WB_WAIT_ACK), 
								    quick_n_reset) 
                                               );
  WB_WAIT_ACK_ValidTransition2: assert property( FSMValidTransition(i_clk, (wishbone_st ==  WB_WAIT_ACK), 
                                                                    (~extra_write_r && i_wb_ack), (wishbone_st == WB_IDLE), 
								    quick_n_reset) 
                                               );
  
  //FSMOutputValid:
  
  WB_IDLE_TimeOut: assert property(FSMTimeOut(i_clk, wishbone_st, 1000));
  //WB_IDLE_TimeOut: assert property(FSMTimeOut(i_clk, wishbone_st, 13));

endmodule



module Wrapper ;

bind a25_wishbone module4SVA wrp (
     .i_clk(i_clk), .wishbone_st(wishbone_st), .i_wb_ack(i_wb_ack), .extra_write_r(extra_write_r), .quick_n_reset(quick_n_reset)
);

endmodule
