 //<>//
// MAXIMS SIMPLE CHECKBOX LIBRARY

HashMap<String, SimpleCheckBox> simpleCheckBoxes;  // creating Hashmap to hold all checkboxes and there names

void createSimpleCheckBox(String name, int cxPosition, int cyPosition, int cDimension) {  // method to create a new checkbox 
  SimpleCheckBox newCheckBox = new SimpleCheckBox(cxPosition, cyPosition, cDimension);  // creating new checkbox
  simpleCheckBoxes.put(name, newCheckBox);  // adding checkbox to hashmap
}


class SimpleCheckBox {  // class for checkboxes

  int cxPosition;
  int cyPosition;
  int cDimension;

  boolean cValue;

  boolean bcColors;
  color cBackgroundColor;
  color cCheckColor;

  boolean bcImage;
  PImage cFalseImage;
  PImage cTrueImage;

  SimpleCheckBox(int cxPosition, int cyPosition, int cDimension) {
    this.cxPosition = cxPosition;
    this.cyPosition = cyPosition;
    this.cDimension = cDimension;

    this.cValue = false;

    this.bcColors = false;
    this.cBackgroundColor = color(220, 220, 220);
    this.cCheckColor = color(0, 0, 255);

    this.bcImage = true;
    this.cFalseImage = loadImage("Images/FalseImage.png");
    this.cTrueImage = loadImage("Images/TrueImage.png");
  }

  void setCheckColor(color newColor) {  // method to change the color of the check of the checkbox
    this.bcColors = true;
    this.bcImage = false;
    this.cCheckColor = newColor;
  }

  void setBackgroundColor(color newColor) {  // method to change the background color of the checkbox
    this.bcColors = true;
    this.bcImage = false;
    this.cBackgroundColor = newColor;
  }

  void setCheckBoxImages(PImage True, PImage False) {  // method to change the images displayed when checked or not of the checkbox  
    this.bcColors = false;
    this.bcImage = true;
    this.cTrueImage = True;
    this.cFalseImage = False;
  }
  
  boolean value() {  // method to get the status of the checkbox
    return this.cValue;
  }

  void display() {  // method to display the checkbox
    if (this.bcColors) {
      fill(this.cBackgroundColor);
      rect(this.cxPosition, this.cyPosition, this.cDimension, this.cDimension);
      fill(255, 255, 255);
      if (this.cValue) {
        fill(this.cCheckColor);
        stroke(this.cCheckColor * 2);
        ellipse(this.cxPosition + this.cDimension / 2, this.cyPosition + this.cDimension / 2, this.cDimension / 1.5, this.cDimension / 1.5);
        fill(255, 255, 255);
        stroke(0, 0, 0);
      }
    } else {
      if (this.cValue) {
        image(this.cTrueImage, this.cxPosition, this.cyPosition, this.cDimension, this.cDimension);
      } else {
        image(this.cFalseImage, this.cxPosition, this.cyPosition, this.cDimension, this.cDimension);
      }
    }
  }

  void check() {  // method to check if the checkbox was clicked
    if (mouseX > this.cxPosition && mouseX < this.cxPosition + this.cDimension && mouseY > this.cyPosition && mouseY < this.cyPosition + this.cDimension) {
      this.cValue = !this.cValue;
    }
  }
}
