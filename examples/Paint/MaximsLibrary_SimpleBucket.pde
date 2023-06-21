// MAXIMS SIMPLE BUTTON LIBRARY 

// IN WORK IN WORK IN WORK IN WORK IN WORK IN WORK IN WORK IN WORK IN WORK IN WORK IN WORK IN WORK

HashMap<String, SimpleBucket> simpleBuckets;

void createSimpleBucket(String name, int bxPosition, int byPosition, int bWidth, int bHeight) {
  SimpleBucket newBucket = new SimpleBucket(bxPosition, byPosition, bWidth, bHeight);
  simpleBuckets.put(name, newBucket);
}

class SimpleBucket {

  // Functions
  int clickEffectDurationCount;
  int textSizeConst;

  // Geomatry
  int bbxPosition;
  int bbyPosition;
  int bbWidth;
  int bbHeight;

  // Background
  boolean bbbBackgroundColor;
  color bbBackgroundColor;
  PImage bbBackgroundImage;
  boolean bbbBackgroundImage;

  // Display
  int bbTextSize;
  boolean bbbText;
  String bbText;
  boolean bbbIcon;
  PImage bbIcon;

  boolean bucketActive;
  int clickedColor;
  int clickedX;
  int clickedY;
  ArrayList<ArrayList> checkedPixels = new ArrayList<ArrayList>();
  ArrayList<ArrayList> foundPixels = new ArrayList<ArrayList>();


  // Effects
  int bbClickEffectDuration;
  int bbClickEffect;

  SimpleBucket(int bbxPosition, int bbyPosition, int bbWidth, int bbHeight) {

    this.bbxPosition = bbxPosition;
    this.bbyPosition = bbyPosition;
    this.bbWidth = bbWidth;
    this.bbHeight = bbHeight;

    this.bbBackgroundColor = color(255, 255, 255);
    this.bbbBackgroundColor = true;
    this.bbbBackgroundImage = false;

    this.bbTextSize = 12;
    this.textSizeConst = 12;
    this.bbbText = true;
    this.bbText = "";
    this.bbbIcon = false;

    this.bucketActive = false;

    this.bbClickEffect = 3;
    this.bbClickEffectDuration = 3;
  }
  void setBackgroundColor(color newColor) {
    this.bbbBackgroundColor = true;
    this.bbbBackgroundImage = false;
    this.bbBackgroundColor = newColor;
  }

  void setBackgroundImage(PImage newImage) {
    this.bbbBackgroundColor = false;
    this.bbbBackgroundImage = true;
    this.bbBackgroundImage = newImage;
  }
  void setText(String newText) {
    this.bbbText = true;
    this.bbbIcon = false;
    this.bbText = newText;
  }
  void setIcon(PImage newImage) {
    this.bbbText = false;
    this.bbbIcon = true;
    this.bbIcon = newImage;
  }
  void setClickEffect(int newClickEffect) {
    this.bbClickEffect = newClickEffect;
  }
  void setClickEffectDuration(int newDuration) {
    this.bbClickEffectDuration = newDuration;
  }
  void setTextSize(int newSize) {
    this.bbTextSize = newSize;
    this.textSizeConst = newSize;
  }

  void display() {
    if (this.bbbBackgroundColor) {
      fill(this.bbBackgroundColor);
      strokeWeight(1);
      rect(this.bbxPosition, this.bbyPosition, this.bbWidth, this.bbHeight);
      fill(255);
    } else if (this.bbbBackgroundImage) {
      image(this.bbBackgroundImage, this.bbxPosition, this.bbyPosition, this.bbWidth, this.bbHeight);
    }
    if (this.bbbText) {
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(this.bbTextSize);
      text(this.bbText, this.bbxPosition + this.bbWidth / 2, this.bbyPosition + this.bbHeight / 2);
      textSize(12);
      fill(255);
    } else if (this.bbbIcon) {
      if (this.bbWidth >= this.bbHeight) {
        image(this.bbIcon, this.bbxPosition + this.bbWidth / 2 - this.bbHeight / 2 + 6, this.bbyPosition + 6, this.bbHeight - 12, this.bbHeight - 12);
      } else {
        image(this.bbIcon, this.bbxPosition + 6, this.bbyPosition + this.bbHeight / 2 - this.bbWidth / 2 + 6, this.bbWidth - 12, this.bbWidth - 12 );
      }
    }
    if (this.clickEffectDurationCount == this.bbClickEffectDuration) {
      this.bbWidth = this.bbWidth - this.bbClickEffect * 2;
      this.bbHeight = this.bbHeight - this.bbClickEffect * 2;

      this.bbxPosition = bbxPosition + this.bbClickEffect;
      this.bbyPosition = bbyPosition + this.bbClickEffect;
      if (this.bbTextSize - this.bbClickEffect / 2 > 0) {
        this.bbTextSize = this.bbTextSize - this.bbClickEffect / 2;
      } else {
        this.bbTextSize = 1;
      }
    } else if (this.clickEffectDurationCount == 1) {
      this.bbWidth = this.bbWidth + this.bbClickEffect * 2;
      this.bbHeight = this.bbHeight + this.bbClickEffect*2;

      this.bbxPosition = bbxPosition - this.bbClickEffect;
      this.bbyPosition = bbyPosition - this.bbClickEffect;

      this.bbTextSize = this.textSizeConst;
    }
    if (this.clickEffectDurationCount > 0) {
      this.clickEffectDurationCount --;
    }
  }

  void check() {
    if (mouseX > this.bbxPosition && mouseX < this.bbxPosition + this.bbWidth && mouseY > this.bbyPosition && mouseY < this.bbyPosition + this.bbHeight) {
      simpleCursor.changeCursor(CROSS);
      this.bucketActive = true;
      this.clickEffectDurationCount = this.bbClickEffectDuration;
    }
  }

  void bucketFunction() {
    if (this.bucketActive) {
      this.clickedX = mouseX;
      this.clickedY = mouseY;
      this.clickedColor = get(clickedX, clickedY);
      this.bucketActive = false;
      simpleCursor.changeCursor(ARROW);
    }
  }

  void Search(int X, int Y) {
    //checkedPixels.add(Integer[X, Y] intArray);
    if (get(X-1, Y) == this.clickedColor) {
      Search(X-1, Y);
    }
  }
  void bucketSearch(int clickedX, int clickedY) {
  }
}
