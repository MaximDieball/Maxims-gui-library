
// MAXIMS SIMPLE BUTTON LIBRARY

HashMap<String, SimpleButton> simpleButtons;  // creating Hashmap to hold all buttons and its name

void createSimpleButton(String name, int bxPosition, int byPosition, int bWidth, int bHeight, Runnable onPressAction) {  // method to create a new button 
  SimpleButton newButton = new SimpleButton(bxPosition, byPosition, bWidth, bHeight, onPressAction);  // creating new button
  simpleButtons.put(name, newButton);  // adding button to hashmap
}

class SimpleButton {  // class for buttons

  Runnable onPressAction;
  int clickEffectDurationCount;
  int textSizeConst;

  int bxPosition;
  int byPosition;
  int bWidth;
  int bHeight;

  boolean bbBackgroundColor;
  color bBackgroundColor;
  PImage bBackgroundImage;
  boolean bbBackgroundImage;

  int bTextSize;
  boolean bbText;
  String bText;
  boolean bbIcon;
  PImage bIcon;

  int bClickEffectDuration;
  int bClickEffect;

  SimpleButton(int bxPosition, int byPosition, int bWidth, int bHeight, Runnable onPressAction) { 

    this.onPressAction = onPressAction;

    this.bxPosition = bxPosition;
    this.byPosition = byPosition;
    this.bWidth = bWidth;
    this.bHeight = bHeight;

    this.bBackgroundColor = color(255, 255, 255);
    this.bbBackgroundColor = true;
    this.bbBackgroundImage = false;

    this.bTextSize = 12;
    this.textSizeConst = 12;
    this.bbText = true;
    this.bText = "";
    this.bbIcon = false;

    this.bClickEffect = 3;
    this.bClickEffectDuration = 3;
  }
  void setBackgroundColor(color newColor) {  // method to change the background color of the button
    this.bbBackgroundColor = true;
    this.bbBackgroundImage = false;
    this.bBackgroundColor = newColor;
  }

  void setBackgroundImage(PImage newImage) {  // method to change the background image color of the button
    this.bbBackgroundColor = false;
    this.bbBackgroundImage = true;
    this.bBackgroundImage = newImage;
  }
  void setText(String newText) {  // method to change the text of the button
    this.bbText = true;
    this.bbIcon = false;
    this.bText = newText;
  }
  void setIcon(PImage newImage) {  // method to change the icon of the button
    this.bbText = false;
    this.bbIcon = true;
    this.bIcon = newImage;
  }
  void setClickEffect(int newClickEffect) {  // method to change how much the button changes size when clicked
    this.bClickEffect = newClickEffect;
  }
  void setClickEffectDuration(int newDuration) {  // method to change the time a button stays pressed(smaller)
    this.bClickEffectDuration = newDuration;
  }
  void setTextSize(int newSize) {  // method to change the size of the text of the button
    this.bTextSize = newSize;
    this.textSizeConst = newSize;
  }

  void display() {  // method to display the button
    if (this.bbBackgroundColor) {
      fill(this.bBackgroundColor);
      strokeWeight(1);
      rect(this.bxPosition, this.byPosition, this.bWidth, this.bHeight);
      fill(255);
    } else if (this.bbBackgroundImage) {
      image(this.bBackgroundImage, this.bxPosition, this.byPosition, this.bWidth, this.bHeight);
    }
    if (this.bbText) {
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(this.bTextSize);
      text(this.bText, this.bxPosition + this.bWidth / 2, this.byPosition + this.bHeight / 2);
      textSize(12);
      fill(255);
    } else if (this.bbIcon) {
      if (this.bWidth >= this.bHeight) {
        image(this.bIcon, this.bxPosition + this.bWidth / 2 - this.bHeight / 2 + 6, this.byPosition + 6, this.bHeight - 12, this.bHeight - 12);
      } else {
        image(this.bIcon, this.bxPosition + 6, this.byPosition + this.bHeight / 2 - this.bWidth / 2 + 6, this.bWidth - 12, this.bWidth - 12 );
      }
    }
    if (this.clickEffectDurationCount == this.bClickEffectDuration) {
      this.bWidth = this.bWidth - this.bClickEffect * 2;
      this.bHeight = this.bHeight - this.bClickEffect * 2;

      this.bxPosition = bxPosition + this.bClickEffect;
      this.byPosition = byPosition + this.bClickEffect;
      if (this.bTextSize - this.bClickEffect / 2 > 0) {
        this.bTextSize = this.bTextSize - this.bClickEffect / 2;
      } else {
        this.bTextSize = 1;
      }
    } else if (this.clickEffectDurationCount == 1) {
      this.bWidth = this.bWidth + this.bClickEffect * 2;
      this.bHeight = this.bHeight + this.bClickEffect*2;

      this.bxPosition = bxPosition - this.bClickEffect;
      this.byPosition = byPosition - this.bClickEffect;

      this.bTextSize = this.textSizeConst;
    }
    if (this.clickEffectDurationCount > 0) {
      this.clickEffectDurationCount --;
    }
  }

  void check() {  // method to check if the button was clicked
    if (mouseX > this.bxPosition && mouseX < this.bxPosition + this.bWidth && mouseY > this.byPosition && mouseY < this.byPosition + this.bHeight) {
      if (onPressAction != null) {
        this.onPressAction.run();
        this.clickEffectDurationCount = this.bClickEffectDuration;
      }
    }
  }
}
