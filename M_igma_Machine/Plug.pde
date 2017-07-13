int innerRadius = 20;
int outerRadius = 27;

class Plug {
  float xpos, ypos;
  char letter, connectedTo;
  boolean connected;
  int wire_uid;
  
  Plug(float x, float y, char l) {
    xpos = x;
    ypos = y;
    letter = l;
  }
  
  void drawPlug() {
    strokeWeight(0);
    
    fill(cream);
    ellipse(xpos, ypos, outerRadius, outerRadius);
    
    fill(darkBrown);
    ellipse(xpos, ypos, innerRadius, innerRadius);
    
    fill(lightBrown);
    textSize(26);
    text(letter,xpos-28, ypos-3);
  }
  
  boolean isConnected() {
    return connected;
  }
  
  void connect() {
    connected = true;
  }
  
  void disconnect() {
    connected = false;
  }
};


Plug closest_plug(float xpos, float ypos, Plug[] board, int count) {
  Plug closest = new Plug(180,465,'Z');
  closest.connected = true;
  float shortest = 1000f;
  for(int i = 0; i < count; i++) {
    Plug p = board[i];
    float d = dist(xpos, ypos, p.xpos, p.ypos);
    if( d < shortest ) {
      shortest = d;
      closest = p;
    }
  }
  return closest;
}
