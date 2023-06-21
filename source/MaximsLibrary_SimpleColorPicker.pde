
// MAXIMS SIMPLE COLORPICKER LIBRARY

HashMap<String, SimpleColorPicker> simpleColorPickers;
void createSimpleColorPicker(String name, int cxPosition, int cyPosition, int cWidth, int cHeight) {
  SimpleColorPicker newColorPicker = new SimpleColorPicker(cxPosition, cyPosition, cWidth, cHeight);
  simpleColorPickers.put(name, newColorPicker);
}


class SimpleColorPicker {

  int cxPosition;
  int cyPosition;
  int cWidth;
  int cHeight;
  color cColor;

  boolean cross;
  boolean newValue;

  PImage cColorPalete;

  SimpleColorPicker(int cxPosition, int cyPosition, int cWidth, int cHeight) {
    this.cxPosition = cxPosition;
    this.cyPosition = cyPosition;
    this.cWidth = cWidth;
    this.cHeight = cHeight;

    this.newValue = false;
    this.cross = false;

    this.cColorPalete = loadImage("Images/colorPalete.png");
    this.cColor = color(0);
  }


  void setColorPalete(PImage colorPalete) {
    this.cColorPalete = colorPalete;
  }

  color value() {
    return this.cColor;
  }

  boolean newValue() {
    return this.newValue;
  }

  void display() {
    rect(this.cxPosition-1, this.cyPosition-1, this.cWidth+1, this.cHeight+1);
    image(this.cColorPalete, this.cxPosition, this.cyPosition, this.cWidth, this.cHeight);
    if (mouseX > this.cxPosition && mouseX < this.cxPosition + this.cWidth && mouseY > this.cyPosition && mouseY < this.cyPosition + this.cHeight) {
      if (simpleCursor.currentCursor != CROSS) {
        simpleCursor.changeCursor(CROSS);
        this.cross = true;
      }
    } else if (this.cross == true) {
      simpleCursor.changeCursor(ARROW);
      this.cross = false;
    }

    this.newValue = false;
  }

  void check() {
    if (mouseX > this.cxPosition && mouseX < this.cxPosition + this.cWidth && mouseY > this.cyPosition && mouseY < this.cyPosition + this.cHeight) {
      this.cColor = get(mouseX, mouseY);
      this.newValue = true;
    }
  }
}
