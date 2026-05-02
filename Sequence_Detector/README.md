# Sequence Detector

## Overview

The Sequence Detector is a digital design implemented in Verilog HDL that identifies a specific binary input pattern in a serial data stream. It is built using a Finite State Machine (FSM) and outputs a signal when the desired sequence is detected.

This project is useful for understanding:
- FSM design (Moore/Mealy concepts)
- Sequential logic circuits
- Pattern recognition in hardware systems

---

## Basic Concept

The design is based on a state machine that transitions between multiple states depending on the input `w`.

### Inputs
- `clk` → Clock signal  
- `reset` → Asynchronous reset  
- `w` → Serial binary input  

### Output
- `z` → High (`1`) when the sequence is detected  

### Sequence Behavior

From the state transitions, the detector recognizes the following pattern:

```

0 → 1 → 1 → 1 → 1 → 1 → 1 → 0

````

When this sequence is received, the output `z` becomes `1` for one clock cycle.

---

## Technical Details

### Module Description

```verilog
module SequenceDetector (
    input clk,
    input reset,
    input w,
    output reg z
);
````

### Internal Components

#### State Registers

```verilog
reg [2:0] curr_st, nxt_st;
```

#### State Definitions

```verilog
localparam IDLE = 3'd0,
           A = 3'd1,
           B = 3'd2,
           C = 3'd3,
           D = 3'd4,
           E = 3'd5,
           F = 3'd6,
           G = 3'd7;
```

### State Transition Logic

The FSM transitions between states based on input `w`. Reset forces the system into the `IDLE` state.

Example transitions:

```verilog
IDLE: nxt_st = (w == 1'b0) ? A : IDLE;
A:    nxt_st = (w == 1'b1) ? B : A;
B:    nxt_st = (w) ? C : A;
C:    nxt_st = (w) ? D : A;
D:    nxt_st = (w) ? E : A;
E:    nxt_st = (w) ? F : A;
F:    nxt_st = (w) ? G : A;
G:    nxt_st = (w == 1'b0) ? A : IDLE;
```

### Sequential Logic

```verilog
always @(posedge clk or posedge reset)
```

* Updates the current state on the rising clock edge
* Handles asynchronous reset

### Output Logic

```verilog
if (curr_st == G && w == 1'b0)
    z = 1'b1;
else
    z = 1'b0;
```

* Output depends on both current state and input
* This classifies the design as a Mealy FSM

---

## Testbench

The testbench (`SequenceDetector_tb.v`) is used to:

* Generate clock signal
* Apply input sequences
* Verify correct detection of the target pattern

### Simulation Steps

1. Apply reset
2. Feed binary input stream
3. Observe output `z`

---

## Folder Structure

```
Sequence Detector Project
│
├── SequenceDetector.v        # Main FSM design module
├── SequenceDetector_tb.v     # Testbench for simulation
├── Sequence_Detector.qpf     # Quartus Project File
├── Sequence_Detector.qsf     # Quartus Settings File
```

### File Descriptions

* **SequenceDetector.v**
  Contains the FSM implementation for sequence detection.

* **SequenceDetector_tb.v**
  Testbench to simulate and validate the design.

* **Sequence_Detector.qpf**
  Project file used by Intel Quartus.

* **Sequence_Detector.qsf**
  Stores synthesis, pin assignments, and configuration settings.

---

## How to Run

1. Open the project in Intel Quartus
2. Compile the design
3. Run simulation using ModelSim or Quartus simulator
4. Observe waveform output for `z`
