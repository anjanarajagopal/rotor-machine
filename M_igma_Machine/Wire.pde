class Wire {
  public float xstart, ystart, xend, yend;
  boolean connected;
  boolean drag;
  
  Wire(float x, float y) {
    xstart = xend = x;
    ystart = yend = y;
  }
  
  void drawStart() {
    fill(lightBrown);
    ellipse(xstart, ystart, plugRadius, plugRadius);
  }
  
  void drawEnd() {
    fill(lightBrown);
    ellipse(xend, yend, plugRadius, plugRadius);
  }
  
  void drawWire() {
    stroke(lightBrown);
    strokeWeight(10);
    line(xstart, ystart, xend, yend);
    //println(xstart, ystart, xend, yend);
  }
  void connect() {
    connected = true;
    drag = false;
  }
  void disconnect() {
    connected = false;
    drag = false;
  }
  boolean isConnected() {
    return connected;
  }
  boolean isDragging() {
    return drag;
  }
  void startDrag() {
    drag = true;
  }
};
