PImage backgroundImage;
PImage iconImage;

void setup() {
  size(800, 800);
  
  // NEEDED
  MaximsLibrary_SETUP();

  // EXAMPLE BUTTON 1
  createSimpleButton("Button1", 100, 100, 60, 100, this::doSomething);
  simpleButtons.get("Button1").setText("Button 1");
  simpleButtons.get("Button1").setClickEffect(15);
  simpleButtons.get("Button1").setClickEffectDuration(15);
  
  // EXAMPLE BUTTON 2
  backgroundImage = loadImage("images/backgroundimage.png");

  createSimpleButton("Button2", 200, 100, 140, 60, this::doSomethingElse);
  simpleButtons.get("Button2").setText("Button 2");
  simpleButtons.get("Button2").setBackgroundImage(backgroundImage);
 
  // EXAMPLE BUTTON 3 
  createSimpleButton("Button3", 100, 250, 60, 60, this::doSomething);
  simpleButtons.get("Button3").setText("Button 3");
  simpleButtons.get("Button3").setBackgroundColor(color(220,0,255));
  
  // EXAMPLE BUTTON 4
  iconImage = loadImage("images/iconimage.png");
  
  createSimpleButton("Button4", 200, 250, 140, 60, this::doSomethingElse);
  simpleButtons.get("Button4").setIcon(iconImage);
  
  // EXAMPLE CHECKBOX 1
  createSimpleCheckBox("CheckBox1", 500, 200, 30);
  
  // EXAMPLE CHECKBOX 2
  createSimpleCheckBox("CheckBox2", 550, 200, 30);
  simpleCheckBoxes.get("CheckBox2").setBackgroundColor(color(240, 240, 240));
  simpleCheckBoxes.get("CheckBox2").setCheckColor(color(10, 240, 10)); //<>//
}


void draw() {
  background(255);
  
  // NEEDED
  MaximsLibrary_DRAW();
}

void doSomething() {
  println(str(simpleCheckBoxes.get("CheckBox1").value())+" CHECKBOX1");
}

void doSomethingElse() {
  println(str(simpleCheckBoxes.get("CheckBox2").value())+" CHECKBOX2");
}
