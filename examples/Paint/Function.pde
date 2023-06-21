PImage cacheImg;
boolean mouseWasPressedM = false;
boolean yPressed = false;
boolean zPressed = false;

String colorValue;

ArrayList<PImage> snapshots = new ArrayList<PImage>();
ArrayList<PImage> resetSnapshots = new ArrayList<PImage>();

PImage snapshot;
PImage reset;
PImage resetEverything;
PImage repeat;
PImage pipette;
PImage up;
PImage down;

int pencilSize = 10;
color pencilColor = color(0);

void drawingLogic() {

  if (simpleColorPickers.get("colorPicker").newValue()) {
    colorValue = "PICKER";
  } else if (simplePipettes.get("pipette").newValue()) {
    colorValue = "PIPETTE";
  }

  if (mousePressed == true && mouseY > 100) {
    mouseWasPressedM = true;

    if (colorValue == "PICKER") {
      stroke(simpleColorPickers.get("colorPicker").value());
    } else if (colorValue == "PIPETTE") {
      stroke(simplePipettes.get("pipette").value());
    }
    strokeWeight(pencilSize);
    if (simpleCursor.currentCursor() == PEN) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    resetSnapshots.clear();
  }
  if (mouseWasPressedM == true && mousePressed == false) {
    saveSnapshot();
    mouseWasPressedM = false;
  }
  strokeWeight(pencilSize);
  stroke(0);
  line(900, 50, 900, 50);
  stroke(0);
}
void resetLatestChange() {
  if (snapshots.size() >= 2) {
    resetSnapshots.add(0, snapshots.get(0).copy());
    snapshots.remove(0);
    snapshot = snapshots.get(0);
    image(snapshot, 0, 100, width, height - 100);
  }
}
void resetEveryting() {
  if (snapshots.size() >= 2) {
    snapshot = snapshots.get(snapshots.size()-1);
    image(snapshot, 0, 100, width, height - 100);
    saveSnapshot();
  }
}
void resetLatestReset() {
  if (resetSnapshots.size() > 0) {
    snapshot = resetSnapshots.get(0);
    image(snapshot, 0, 100, width, height - 100);
    resetSnapshots.remove(0);
    saveSnapshot();
  }
}

void saveSnapshot() {
  snapshot = get(0, 100, width, height - 100);
  snapshots.add(0, snapshot.copy());
}

void upPencilSize() {
  if (pencilSize < 70) {
    pencilSize+=2;
  }
}
void downPencilSize() {
  if (pencilSize > 2) {
    pencilSize-=2;
  }
}
void cursorLogic() {
  if (simpleCursor.currentCursor() == PEN && mouseY < 100) {
    simpleCursor.changeCursor(ARROW);
  } else if (simpleCursor.currentCursor() == ARROW && mouseY > 100) {
    simpleCursor.changeCursor(PEN);
  }
}
void menuBar() {
  fill(200);
  noStroke();
  rect(0, 0, width, 100);
  fill(255);
  stroke(1);
}
