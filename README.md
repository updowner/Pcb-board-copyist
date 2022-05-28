# Pcb-board-copyist
Laser-based CNC Machine for Designing Printed Circuit Boards with Image Processing Technology
![photo1653743967 (2)](https://user-images.githubusercontent.com/29107541/170829104-3e9cedb5-dcca-4401-851d-5c5430cda685.jpeg)
![photo1653743967 (1)](https://user-images.githubusercontent.com/29107541/170829105-d53eea54-9a68-4874-bca4-7d62452d6e26.jpeg)
![photo1653743967](https://user-images.githubusercontent.com/29107541/170829107-c803655e-9e4b-4c54-83c1-643e7c44d3cc.jpeg)



 -Project Idea
It is a camera that takes a picture of the printed circuit that we want to replace, processes it through an image processing algorithm and converts it to G CODE (the language of working with CNC machines).
 -Items used:
 Arduino uno
 2 Stepper motor
 Camera
 IRFZ44N N-CHANNEL MOSFET
 L239 Driver
 Laser 1W

How it works?
 1 The camera installed on the chassis takes a picture of the circuit to be redesigned.
 2 The captured image is passed to an image processing algorithm, which filters the components from the circuit and shows the copper paths clearly.
 3 The resulting image is passed to the Inkscape program, which in turn converts it into G-Code instructions, which is the language used to work with the CNC machine.
 4 The resulting code is passed to the G-Code Sender program, which in turn sends these instructions in the form of PWM pulses to the Arduino microcontroller.
 5 The Arduino microcontroller translates these pulses and controls the laser beam to draw the desired circuitز
With these steps we can get a printed circuit identical to the original circuit.

Image processing algorithm code:
I used Matlab for this step.
In the first stage, this algorithm detects the edges in the given circuit image, thus isolating and showing the circuit's copper paths,Then we apply a filter that removes the noise of salt and pepper, if any, thus showing the circuit and copper tracks in the best possible way.

CNC code:
This code is responsible for translating the incoming pulses to the Arduino microcontroller and controlling the intensity and position of the laser beam based on the instructions sent.
