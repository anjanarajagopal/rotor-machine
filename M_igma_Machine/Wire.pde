int plugRad=20;

class Wire {
  float xstart, ystart, xend, yend;
  
  Wire(float x, float y) {
    xstart = xend = x;
    ystart = yend = y;
  }
  
  void drawStart() {
    fill(lightBrown);
    ellipse(xstart, ystart, plugRad, plugRadius);
  }
  
  void drawEnd() {
    fill(lightBrown);
    ellipse(xend, yend, plugRad, plugRadius);
  }
  
  void drawWire() {
    stroke(lightBrown);
    strokeWeight(10);
    line(xstart, ystart, xend, yend);
  }
};
