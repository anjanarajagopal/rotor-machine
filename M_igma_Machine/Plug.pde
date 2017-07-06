int innerRadius = 20;
int outerRadius = 27;

class Plug {
  float xpos, ypos;
  char letter;
  
  Plug(float x, float y, char l) {
    xpos = x;
    ypos = y;
    letter = l;
  }
  
  void drawPlug() {
    noStroke();
    
    fill(cream);
    ellipse(xpos, ypos, outerRadius, outerRadius);
    
    fill(darkBrown);
    ellipse(xpos, ypos, innerRadius, innerRadius);
    
    fill(lightBrown);
    textSize(26);
    text(letter,xpos-28, ypos-3);
  }
};