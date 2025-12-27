# Seven-Segment Calculator Adder (FPGA)

A simple FPGA-based calculator that adds two 4-bit numbers and displays the operands and result on seven-segment displays.  
Designed using **SystemVerilog** and intended for FPGA development boards with switches, buttons, LEDs, and HEX displays (e.g. Intel DE-series boards).

---

## Overview

This project implements:
- A **hexadecimal seven-segment decoder**
- A **register-based input system** for two operands
- A **combinational adder**
- Real-time display of inputs and sum using seven-segment displays

Two 4-bit values (`A` and `B`) are loaded from switches, added together, and the 8-bit sum is shown across two seven-segment displays.

---

## Features

- 4-bit operand input (`A` and `B`)
- 8-bit sum output
- Hexadecimal display (`0–F`)
- Button-controlled register loading
- Active-low seven-segment display support

---

## Hardware Interface

### Inputs
- `SW[3:0]` – Data input for operands  
- `SW[9]` – Load enable for operand **A**  
- `SW[8]` – Load enable for operand **B**  
- `KEY[1]` – Clock (posedge-triggered)  
- `KEY[0]` – Active-low reset  

### Outputs
- `LEDR[9:0]` – Mirrors switch inputs  
- `HEX5` – Displays operand **A**  
- `HEX3` – Displays operand **B**  
- `HEX1` – High nibble of **SUM**  
- `HEX0` – Low nibble of **SUM**  
- `HEX4`, `HEX2` – Disabled  

---

## Module Description

### `sevenseg`
A combinational decoder that maps a 4-bit hexadecimal value (`0x0–0xF`) to a 7-bit active-low seven-segment output.

- Input: `data [3:0]`
- Output: `segments [6:0]`

### `calc_top`
Top-level module that:
- Stores operands `A` and `B` using flip-flops
- Adds the operands
- Drives seven-segment displays for operands and result

---

## Operation

1. Set a 4-bit value on `SW[3:0]`
2. Set `SW[9]` high and press `KEY[1]` to load **A**
3. Set `SW[8]` high and press `KEY[1]` to load **B**
4. The sum is calculated automatically
5. Values appear on the seven-segment displays:
   - `HEX5`: A
   - `HEX3`: B
   - `HEX1:HEX0`: SUM

Reset both operands by pressing `KEY[0]` (active-low).

---

## Technologies Used

- **SystemVerilog**
- FPGA seven-segment display logic
- Register-based input capture
- Combinational arithmetic

---

## Notes

- Seven-segment outputs are **active-low**
- Addition is purely combinational
- Designed for educational and digital design practice

---

## Possible Extensions

- Subtraction or multiplication support
- Signed arithmetic
- Multi-digit decimal mode
- Clock divider for debouncing
- Overflow indicator

---

## Author

Nathan Law  
Electrical Engineering @ UBC
