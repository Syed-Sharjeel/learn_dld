# 5-Bit ALU Design (Quartus + Questa)

## Overview

This project implements a **5-bit Arithmetic Logic Unit (ALU)** using Verilog HDL. The ALU performs basic arithmetic operations including **addition, subtraction, and multiplication** based on a 2-bit control signal.

The design is developed and synthesized using **Intel Quartus**, and verified through simulation using **Questa/ModelSim**.

---

## Objectives

* Design a functional **5-bit ALU** using Verilog
* Implement arithmetic operations at RTL level
* Simulate and verify correctness using a testbench

---

## ALU Functionality

### Inputs

* `A1` → 5-bit operand
* `A2` → 5-bit operand
* `op` → 2-bit control signal

### Output

* `Y` → 10-bit result

### Operation Table

| op | Operation      | Description |
| -- | -------------- | ----------- |
| 00 | Addition       | Y = A1 + A2 |
| 01 | Subtraction    | Y = A1 - A2 |
| 10 | Multiplication | Y = A1 × A2 |
| 11 | Default        | Y = 0       |

---

## Technical Details

### 1. Arithmetic Logic

* **Addition & Subtraction** are implemented using built-in Verilog operators (`+`, `-`)
* **Multiplication** is implemented using:

  * Either shift-and-add logic (manual approach), or
  * Behavioral `*` operator (depending on version)

### 2. Bit Width Considerations

* Inputs: 5-bit each
* Output: 10-bit (to accommodate multiplication result up to 31×31 = 961)

### 3. Combinational Design

* Entire ALU is **combinational**
* Uses `always @(*)` blocks for dynamic evaluation
* No clock dependency

### 4. Simulation Strategy

* Testbench applies multiple input combinations
* Uses delay-based stimulus (`#time`)
* Output monitored using `$monitor`

---

## Testbench

The testbench (`ALU_5Bit_tb.v`) verifies:

* Normal cases (small values)
* Edge cases (max/min inputs)
* All operation modes

---

## File Descriptions

### 🔹 `ALU_5Bit.v`

* Main design file
* Contains:

  * `ALU_5Bit` module
  * `ALU5Bit` module (duplicate/alternate version)
* Implements all arithmetic operations

### 🔹 `ALU_5Bit_tb.v`
* Testbench file
* Responsible for:

  * Applying inputs to ALU
  * Verifying outputs
  * Simulation logging

### 🔹 `5Bit_ALU_Verilog.qpf`

* Quartus Project File
* Stores project-level configuration
* Used to open project in Quartus

### 🔹 `5Bit_ALU_Verilog.qsf`

* Quartus Settings File
* Contains:

  * Pin assignments
  * Device configuration
  * Compilation settings

### 🔹 `5Bit_ALU_Verilog.sof`

* SRAM Object File
* Generated after compilation
* Used to **program FPGA hardware**

## Tools Used

* **Intel Quartus Prime** → Synthesis & FPGA implementation
* **Questa / ModelSim** → Simulation & verification
* **Verilog HDL** → Hardware description

---

## How to Run

### Simulation (Questa/ModelSim)

1. Compile `ALU_5Bit.v` and `ALU_5Bit_tb.v`
2. Run simulation
3. Observe waveform or console output

### Synthesis (Quartus)

1. Open `.qpf` file in Quartus
2. Compile project
3. Generate `.sof` file
4. Upload to FPGA (optional)

---

## Key Learning Outcomes

* RTL design using Verilog
* Combinational circuit implementation
* ALU architecture basics
* Simulation vs synthesis workflow
* FPGA project structure

---

## Notes

* Ensure correct bit-width handling to avoid overflow issues
* Multiplication logic may vary depending on implementation style
* Testbench must be used for verification before synthesis

---
