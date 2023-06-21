
// MAXIMS SIMPLE Pipette LIBRARY

HashMap<String, SimplePipette> simplePipettes;

void createSimplePipette(String name, int pbxPosition, int pbyPosition, int pbWidth, int pbHeight) {
  SimplePipette newPipette = new SimplePipette(pbxPosition, pbyPosition, pbWidth, pbHeight);
  simplePipettes.put(name, newPipette);
}

class SimplePipette {

  // Functions
  int pclickEffectDurationCount;
  int ptextSizeConst;

  // Geomatry
  int pbxPosition;
  int pbyPosition;
  int pbWidth;
  int pbHeight;

  // Background
  boolean pbbBackgroundColor;
  color pbBackgroundColor;
  PImage pbBackgroundImage;
  boolean pbbBackgroundImage;

  // Display
  int pbTextSize;
  boolean pbbText;
  String pbText;
  boolean pbbIcon;
  PImage pbIcon;

  // Pipette
  boolean pipetteActive;
  color pipetteColor;
  boolean newValue;

  // Effects
  int pbClickEffectDuration;
  int pbClickEffect;

  SimplePipette(int pbxPosition, int pbyPosition, int pbWidth, int pbHeight) {

    this.pbxPosition = pbxPosition;
    this.pbyPosition = pbyPosition;
    this.pbWidth = pbWidth;
    this.pbHeight = pbHeight;

    this.pbBackgroundColor = color(255, 255, 255);
    this.pbbBackgroundColor = true;
    this.pbbBackgroundImage = false;

    this.pbTextSize = 12;
    this.ptextSizeConst = 12;
    this.pbbText = true;
    this.pbText = "";
    this.pbbIcon = false;

    this.pipetteActive = false;
    this.pipetteColor = color(0, 0, 0);
    this.newValue = false;

    this.pbClickEffect = 3;
    this.pbClickEffectDuration = 3;
  }
  void setBackgroundColor(color newColor) {
    this.pbbBackgroundColor = true;
    this.pbbBackgroundImage = false;
    this.pbBackgroundColor = newColor;
  }

  void setBackgroundImage(PImage newImage) {
    this.pbbBackgroundColor = false;
    this.pbbBackgroundImage = true;
    this.pbBackgroundImage = newImage;
  }
  void setText(String newText) {
    this.pbbText = true;
    this.pbbIcon = false;
    this.pbText = newText;
  }
  void setIcon(PImage newImage) {
    this.pbbText = false;
    this.pbbIcon = true;
    this.pbIcon = newImage;
  }
  void setClickEffect(int newClickEffect) {
    this.pbClickEffect = newClickEffect;
  }
  void setClickEffectDuration(int newDuration) {
    this.pbClickEffectDuration = newDuration;
  }
  void setTextSize(int newSize) {
    this.pbTextSize = newSize;
    this.ptextSizeConst = newSize;
  }

  color value() {
    return this.pipetteColor;
  }
  
  boolean newValue(){
    return this.newValue;
  }

  void display() {
    if (this.pbbBackgroundColor) {
      fill(this.pbBackgroundColor);
      rect(this.pbxPosition, this.pbyPosition, this.pbWidth, this.pbHeight);
      fill(255);
    } else if (this.pbbBackgroundImage) {
      image(this.pbBackgroundImage, this.pbxPosition, this.pbyPosition, this.pbWidth, this.pbHeight);
    }
    if (this.pbbText) {
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(this.pbTextSize);
      text(this.pbText, this.pbxPosition + this.pbWidth / 2, this.pbyPosition + this.pbHeight / 2);
      textSize(12);
      fill(255);
    } else if (this.pbbIcon) {
      if (this.pbWidth >= this.pbHeight) {
        image(this.pbIcon, this.pbxPosition + this.pbWidth / 2 - this.pbHeight / 2 + 6, this.pbyPosition + 6, this.pbHeight - 12, this.pbHeight - 12);
      } else {
        image(this.pbIcon, this.pbxPosition + 6, this.pbyPosition + this.pbHeight / 2 - this.pbWidth / 2 + 6, this.pbWidth - 12, this.pbWidth - 12 );
      }
    }
    if (this.pclickEffectDurationCount == this.pbClickEffectDuration) {
      this.pbWidth = this.pbWidth - this.pbClickEffect * 2;
      this.pbHeight = this.pbHeight - this.pbClickEffect * 2;

      this.pbxPosition = pbxPosition + this.pbClickEffect;
      this.pbyPosition = pbyPosition + this.pbClickEffect;
      if (this.pbTextSize - this.pbClickEffect / 2 > 0) {
        this.pbTextSize = this.pbTextSize - this.pbClickEffect / 2;
      } else {
        this.pbTextSize = 1;
      }
    } else if (this.pclickEffectDurationCount == 1) {
      this.pbWidth = this.pbWidth + this.pbClickEffect * 2;
      this.pbHeight = this.pbHeight + this.pbClickEffect*2;

      this.pbxPosition = pbxPosition - this.pbClickEffect;
      this.pbyPosition = pbyPosition - this.pbClickEffect;

      this.pbTextSize = this.ptextSizeConst;
    }
    if (this.pclickEffectDurationCount > 0) {
      this.pclickEffectDurationCount --;
    }

    this.newValue = false;
  }

  void check() {
    if (mouseX > this.pbxPosition && mouseX < this.pbxPosition + this.pbWidth && mouseY > this.pbyPosition && mouseY < this.pbyPosition + this.pbHeight) {
      simpleCursor.changeCursor(CROSS);
      this.pipetteActive = true;
      this.pclickEffectDurationCount = this.pbClickEffectDuration;
    }
  }

  void pipetteFunction() {
    if (this.pipetteActive) {
      this.pipetteColor = get(mouseX, mouseY);
      this.newValue = true;
      this.pipetteActive = false;
      simpleCursor.changeCursor(ARROW);
    }
  }
}
