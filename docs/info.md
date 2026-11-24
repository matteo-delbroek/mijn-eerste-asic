## How it works

Een 24-bit teller telt de 10 MHz systeemklok tot 5.000.000 en inverteert daarna het signaal op output-pin `uo[0]`. Hierdoor knippert een aangesloten LED met een frequentie van 1 Hz (0,5 seconde aan, 0,5 seconde uit).

## How to test

Sluit een LED met een voorschakelweerstand aan op output-pin `uo[0]` en GND. Zet de klok op 10 MHz en maak `rst_n` hoog (`1`).

## External hardware

Een standaard LED en een weerstand (bijv. 330 ohm) aangesloten op `uo[0]`.