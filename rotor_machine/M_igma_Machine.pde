// RotorSquare square1 = new RotorSquare(75,0,0,'S');
// RotorSquare square2 = new RotorSquare(75,0,0,'E');

color darkBlue = color(11,39,73);
color yellow = color(237,238,145);
color darkBrown = color(92,73,65);
color lightBrown = color(207,158,95);
color cream = color(249,238,226);

PFont f; 
Plug[] plugboard = new Plug[26];

char rotor1Config, rotor2Config, rotor3Config;

void setup() {
  size(800,600, P3D);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  f = createFont("Arial", 16);
  
  // initialize plugboard
  plugboard[0] = new Plug(105,335,'Q');
  plugboard[1] = new Plug(173.33,335,'W');
  plugboard[2] = new Plug(241.66,335,'E');
  plugboard[3] = new Plug(310,335,'R');
  plugboard[4] = new Plug(378.33,335,'T');
  plugboard[5] = new Plug(446.66,335,'Y');
  plugboard[6] = new Plug(515,335,'U');
  plugboard[7] = new Plug(583.33,335,'I');
  plugboard[8] = new Plug(651.66,335,'O');
  plugboard[9] = new Plug(720,335,'P');
  plugboard[10] = new Plug(140,400,'A');
  plugboard[11] = new Plug(208.125,400,'S');
  plugboard[12] = new Plug(276.25,400,'D');
  plugboard[13] = new Plug(344.375,400,'F');
  plugboard[14] = new Plug(412.5,400,'G');
  plugboard[15] = new Plug(480.625,400,'H');
  plugboard[16] = new Plug(548.75,400,'J');
  plugboard[17] = new Plug(616.875,400,'K');
  plugboard[18] = new Plug(685,400,'L'); 
  plugboard[19] = new Plug(180,465,'Z');  
  plugboard[20] = new Plug(257.5,465,'X');  
  plugboard[21] = new Plug(335,465,'C');  
  plugboard[22] = new Plug(412.5,465,'V');
  plugboard[23] = new Plug(490,465,'B');  
  plugboard[24] = new Plug(567.5,465,'N');  
  plugboard[25] = new Plug(645,465,'M');   
}


void draw() {
  background(darkBlue);
  noStroke();
  textFont(f);
  
  text("Enter one character in each white text box below.", 25, 40);
  
  // ----------------CONFIGURATION CONTROLS------------------
  fill(lightBrown);
  rect(125,150,150,100,7);
  fill(darkBrown);
  rect(125,150,140,90,7);
  
  // starting configuration letters will go in these white boxes
  fill(cream);
  rect(80,150,25,35);
  fill(0);
  text("A", 80, 150, 25, 35);
  fill(cream);
  rect(125,150,25,35);
  fill(0);
  text("B", 125, 150, 25, 35);
  fill(cream);
  rect(170,150,25,35);
  fill(0);
  text("C", 170, 150, 25, 35);
  fill(cream);
  // ----------------CONFIGURATION CONTROLS------------------
  
  
  // -----------------ADVANCE ROTOR BUTTONS------------------
  fill(lightBrown);
  rect(675,150,150,100,7);
  fill(darkBrown);
  rect(675,150,140,90,7);
  
  fill(cream);
  triangle(660,125,660,175,625,150);
  triangle(690,125,690,175,725,150);
  // -----------------ADVANCE ROTOR BUTTONS------------------
  
  
  // -----------------------PLUGBOARD------------------------
  fill(lightBrown);
  rect(400,400,710,210,15);
  fill(darkBrown);
  rect(400,400,700,200,15);
  
  // populate plugboard array
  for (int i=0; i<26; i++) {
    plugboard[i].drawPlug();
  }
  // -----------------------PLUGBOARD------------------------
   
   
  // -------------------------WIRE---------------------------
  
  // -------------------------WIRE---------------------------
   
  println(mouseX, mouseY);
  
  /*
  pushMatrix();
  translate(400,235);
  rotateX(PI/4);
  square2.drawSquare();
  fill(255,0,0);
  text('E', 0,0);
  popMatrix(); 
  */
 /*
  pushMatrix();
  translate(400,300);
  square1.drawSquare();
  translate(0,-65);
  rotateX(PI/4);
  square2.drawSquare();
  popMatrix(); */
}
