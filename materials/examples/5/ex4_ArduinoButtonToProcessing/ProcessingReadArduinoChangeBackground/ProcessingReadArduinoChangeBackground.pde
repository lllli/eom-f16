/* ProcessingReadArduinoChangeBackground
 *
 *  changes the background color in response to a button press
 *  on the Arduino
 * 
 * 1) Setup your circuit and Arduino
 * see documentation in the Arduino Sketch
 *
 * 2) Run this sketch
 *
 */
import processing.serial.*; 

Serial arduino;       // The serial port Arduino is connected to (over USB)
int buttonValue = 0;  // set initial value
color backgroundFill = #C121AF;

void setup() {
  size(600, 600);
  
  // List all the available serial ports
  printArray(Serial.list());

  // Open the port you are using at the rate you want:
  // change [0] if your Arduino is not on the first port listed above
  arduino = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  while (arduino.available() > 0) {
    buttonValue = arduino.read();
  }
  
  if(buttonValue == 0){
    backgroundFill = #C121AF;
  }
  if(buttonValue == 1){
    backgroundFill = #49E354;
  }
  
  background(backgroundFill);
}