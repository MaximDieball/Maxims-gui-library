void setup() { //<>//
  size(1200, 900);
  background(255);
  
  MaximsLibrary_SETUP();
  
  createSimpleButton("resetChangeButton", 25, 25, 50, 50, this::resetLatestChange);
  reset = loadImage("images/reset.png");
  simpleButtons.get("resetChangeButton").setIcon(reset);
  
  createSimpleButton("repeatButton", 100, 25, 50, 50, this::resetLatestReset);
  repeat = loadImage("images/repeat.png");
  simpleButtons.get("repeatButton").setIcon(repeat);
  
  createSimpleButton("resetEveryThingButton", 175, 25, 50, 50, this::resetEveryting);
  resetEverything = loadImage("images/reseteverything.png");
  simpleButtons.get("resetEveryThingButton").setIcon(resetEverything);
  
  createSimpleButton("upPencilSizeButton", 820, 8, 30, 30, this::upPencilSize);
  up = loadImage("images/up.png");
  simpleButtons.get("upPencilSizeButton").setIcon(up);
  
  createSimpleButton("downPencilSizeButton", 820, 58, 30, 30, this::downPencilSize);
  down = loadImage("images/down.png");
  simpleButtons.get("downPencilSizeButton").setIcon(down);
  
  createSimpleColorPicker("colorPicker", 960, 8, 200, 80);
  
  createSimplePipette("pipette", 1165, 7, 29, 29);
  pipette = loadImage("images/pipette.png");
  simplePipettes.get("pipette").setIcon(pipette);
  
  createSimpleButton("lineButton", 820, 58, 30, 30, this::downPencilSize);
  down = loadImage("images/down.png");
  simpleButtons.get("lineButton").setIcon(down);
  
  simpleCursor.changeCursor(PEN);
  saveSnapshot();
}
void draw() {
  menuBar();
  MaximsLibrary_DRAW();
  drawingLogic();
  cursorLogic();
}
