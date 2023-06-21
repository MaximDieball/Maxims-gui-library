
// MAXIMS SIMPLE CURSOR LIBRARY

SimpleCursor simpleCursor = new SimpleCursor();  // creating SimpleCursor Object

class SimpleCursor {
  
  int currentCursor;

  SimpleCursor() {
    this. currentCursor = ARROW;
  }
  void changeCursor(int newCursor) {
    if (newCursor == PEN) {
      cursor(pen,1,1);
    } else {
      cursor(newCursor);
    }
    currentCursor = newCursor;
  }

  int currentCursor() {
    return this.currentCursor;
  }
}
