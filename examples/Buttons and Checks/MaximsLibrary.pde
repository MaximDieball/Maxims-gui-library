
// MAXIMS LIBRARY

final int PEN = 69;  // cursor int
PImage pen;  // pen cursor image

boolean mouseWasPressed = false;

// must be called in setup method
void MaximsLibrary_SETUP() {
  pen = loadImage("images/pen.png");  // pen curosr image
  simpleButtons = new HashMap<String, SimpleButton>();  // hashmap storing all buttons
  simplePipettes = new HashMap<String, SimplePipette>();  // hashmap storing all pipettes
  simpleCheckBoxes = new HashMap<String, SimpleCheckBox>();  // hashmap storing all checkboxes
  simpleColorPickers = new HashMap<String, SimpleColorPicker>();  // hashmap storing all colorpickers
}

// must be called in draw method
void MaximsLibrary_DRAW() {
  for (SimpleButton button : simpleButtons.values()) {  // displays every button
    button.display();
  }
  for (SimpleCheckBox checkbox : simpleCheckBoxes.values()) {  // displays every checkbox
    checkbox.display();
  }
  for (SimpleColorPicker colorpicker : simpleColorPickers.values()) {  // displays every colorpicker
    colorpicker.display();
  }
  for (SimplePipette pipette : simplePipettes.values()) {  // displays every pipette
    pipette.display();
  }

  if (mousePressed) {  // setting mouseWasPressed to true if mouse is pressed
    mouseWasPressed = true;
  }
  if (mouseWasPressed && !mousePressed) {  // setting mouseWasPressed if mouse is no longer pressed
    mouseWasPressed = false;

    for (SimpleButton button : simpleButtons.values()) {  // calling button method which checks if it was pressed
      button.check();
    }
    for (SimpleCheckBox checkbox : simpleCheckBoxes.values()) {  // calling checkbox method which checks if it was pressed
      checkbox.check();
    }
    for (SimpleColorPicker colorpicker : simpleColorPickers.values()) {  // calling colorpicker method which checks if it was pressed
      colorpicker.check();
    }
    for (SimplePipette pipette : simplePipettes.values()) {  // calling pipette methods which checks if it was pressed
      pipette.pipetteFunction();
      pipette.check();
    }
  }
}
