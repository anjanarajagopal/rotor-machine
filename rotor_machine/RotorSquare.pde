class RotorSquare {
  int size, xpos, ypos;
  char letter;
  
  RotorSquare(int s, int x, int y, char l) {
     size = s;
     xpos = x;
     ypos = y;
     letter = l;
  }
  
  void drawSquare() {
    fill(237,238,145);
    stroke(11,39,73);
    rect(xpos, ypos, size, size);
    
    fill(255,0,0);
    text(letter,xpos, ypos);
  } 
};