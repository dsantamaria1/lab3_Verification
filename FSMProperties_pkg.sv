package FSMProperties;

`define WB_IDLE            = 3'd0
`define WB_BURST1          = 3'd1
`define WB_BURST2          = 3'd2
`define WB_BURST3          = 3'd3
`define WB_WAIT_ACK        = 3'd4

// FSMValidTransition
// Function: Checks that a FSM changes from a state to a nextState if
//           the condition is true
//
// Inputs: 
// clk - Sample clock signal
// currentState - Boolean (State == currentState)
// condition - Boolean (Transition condition)
// nextState - Boolean (State == nextState)
// reset - signal

/*place your property here*/
property FSMValidTransition(clk, currentState, condition, nextState, reset);
  @(posedge clk) disable iff (~reset) 
                 currentState & condition |=> nextState;
endproperty: FSMValidTransition


// FSMOutputValid
// Function: Checks that FSM outputs have the right value for a given state
//
// Inputs:
// clk - Sample clock signal
// currentState - Boolean (State == currentState)
// outputCondition - Boolean (Outcome of boolean formula to describe output behavior

/*place your property here*/
property FSMOutputValid(clk, currentState, condition, nextState, reset);
  @(posedge clk) disable iff (~reset) 
                 currentState & condition |=> nextState;
endproperty: FSMOutputValid 


// FSMTimeOut
// Function: Checks that a FSM changes state within a timeout window
//
// Inputs:
// clk - Sample clock signal
// currentState - signal - current state of the FSM
// timeOutVal - integer - Number of clocks before the FSM is deemed to have locked up

/*place your property here*/
property FSMTimeOut(clk, currentState, timeOutVal);
  //1 |=> @(clk) ##[1:timeOutVal] ~$stable(currentState); 
  @(posedge clk) 1 |=> @(posedge clk) ##[1:timeOutVal] ~$stable(currentState); 
endproperty: FSMTimeOut

endpackage: FSMProperties
