# Simple Timer Module

This project contains a basic timer module implemented in VHDL. It can count seconds, minutes, and hours.

## Architecture

The project includes two different architectures for the timer:

### `rtl` Architecture (First Version - `timer.vhd`)

This architecture implements the timer logic directly within a single process. It increments counters for ticks, seconds, minutes, and hours based on the input clock (`Clk`) and reset (`nRst`).

### `rtl` Architecture (Second Version - `timer2.vhd`)

This architecture utilizes a procedure `IncrementWrap` to handle the incrementing and wrapping of the counters. This version aims for a more modular approach.

## Functionality

Both architectures provide the following functionality:

- **Clock Input (`Clk`):** The main clock signal for the timer.
- **Negative Reset (`nRst`):** When `'0'`, this signal resets the timer to zero.
- **Counting:** The timer increments the `Seconds`, `Minutes`, and `Hours` signals based on the `clockFrequency` (in the first version) or `ClockFrequencyHz` (in the second version).

## Usage

To use this timer module, you will need to instantiate it in your top-level VHDL design and provide the necessary clock and reset signals. The output signals (`Seconds`, `Minutes`, `Hours`) can then be used by other parts of your design.

**Note:** You will need to define the `clockFrequency` or `ClockFrequencyHz` constant in your VHDL code to match your system's clock frequency.