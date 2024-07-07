## How it works

This project is composed of four modules:

* A BCD to seven segment decoder with a wide variety of options
  for customizing the appearance of digits

* An ASCII to seven segment decoder with two different “fonts”

* A dual BCD to [Cistercian numeral](https://en.wikipedia.org/wiki/Cistercian_numerals)
  decoder

* A BCV (binary-coded *vigesimal*) to [Kaktovik numeral](https://en.wikipedia.org/wiki/Kaktovik_numerals)
  decoder

## How to test

Explain how to use your project

## External hardware

For the BCD and ASCII modes, a standard seven-segment display is used.

For the Cistercian mode, a segmented display like the one below is used.
There are design files for such a display in this directory:
https://github.com/RebeccaRGB/buck/tree/main/cistercian-display

![](cistercian-display.svg)

For the Kaktovik mode, a segmented display like the one below is used.
There are design files for such a display in this directory:
https://github.com/RebeccaRGB/buck/tree/main/kaktovik-display

![](kaktovik-display.svg)
