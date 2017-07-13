PFont f; 

color darkBlue = color(11,39,73);
color yellow = color(237,238,125);
color darkBrown = color(92,73,65);
color lightBrown = color(207,158,95);
color cream = color(249,238,226);
  
char rotor1Config, rotor2Config, rotor3Config;
char codedLetter;
String typing = "";
String config = "";
boolean isConfigSet = false;
boolean isEncodeMode = true;
int plugRadius = 20;
int connections = 0;
int closestPlug, startingPlug;
int rotctr = 0;
  
Plug[] plugboard = new Plug[26];
Wire[] wires = new Wire[13];
Rotor rl, rc, rr;

void setup() {
  pixelDensity(displayDensity());
  size(800,600, P3D);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  f = createFont("Lucida Grande", 16);
  
	//here comes the rotors
	rl = new Rotor(true);
	rl.setFill(darkBrown);
	rl.setStroke(lightBrown);
	rl.setPos(width/2 - 60, 165);

	rc = new Rotor(false);
	rc.setFill(darkBrown);
	rc.setStroke(lightBrown);
	rc.setPos(width/2, 165);

	rr = new Rotor(false);
	rr.setFill(darkBrown);
	rr.setStroke(lightBrown);
	rr.setPos(width/2 + 60, 165);

  //create wires
  for( int i = 0; i < 13; i++) {
    wires[i] = new Wire(0,0);
  }

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
  
  // -----------------STARTING PROMPT LOGIC------------------
  // only run the starting prompt if the configuration has not been set
	if( config.length() < 3 ) {
		//add startup config stuff
    fill(lightBrown);
    textSize(16);
    textFont(f);
    text("Enter a three-letter string below.\n", 200, 40);
    text("String: " + typing, 200, 75);
	} else if (config.length() >= 3) {
    isConfigSet = true;
    // print(isConfigSet);
  }

  if (isConfigSet == false) {
    
    // figure out which plug should be the starting point of the wire
    /*for (int i=0; i<plugboard.length; i++) { 
      if (plugboard[i].letter == rotor1Config) {
        // set the endpoint of the wire equal to the starting point
        wire.xstart = wire.xend = plugboard[i].xpos;
        wire.ystart = wire.yend = plugboard[i].ypos;
        closestPlug = startingPlug = i;
      }
    }*/
  }
  // -----------------STARTING PROMPT LOGIC------------------
  if(config.length() >= 3 && isConfigSet == true) {
      /*rotor1Config = config.charAt(0);
      rotor2Config = config.charAt(1);
      rotor3Config = config.charAt(2);*/
       
      // figure out which plug should be the starting point of the wire
      /*for (int i=0; i<plugboard.length; i++) { 
        if (plugboard[i].letter == rotor1Config) {
          // set the endpoint of the wire equal to the starting point
          wire.xstart = wire.xend = plugboard[i].xpos;
          wire.ystart = wire.yend = plugboard[i].ypos;
          closestPlug = startingPlug = i;
          
          //print(rotor1Config);
        }
      }*/
     
  }
  
  // ----------------CONFIGURATION CONTROLS------------------
  strokeWeight(0);
  fill(lightBrown);
  rect(125,150,150,100,7);
  fill(darkBrown);
  rect(125,150,140,90,7);
  
  // starting configuration letters will go in these white boxes
  fill(cream);
  rect(80,150,25,35);
  fill(0);
  text(String.valueOf(rotor1Config), 80, 150, 25, 35);
  fill(cream);
  rect(125,150,25,35);
  fill(0);
  text(String.valueOf(rotor2Config), 125, 150, 25, 35);
  fill(cream);
  rect(170,150,25,35);
  fill(0);
  text(String.valueOf(rotor3Config), 170, 150, 25, 35);
  
  //isConfigSet = true;
  // ----------------CONFIGURATION CONTROLS------------------
  
  // --------------------ENCODE/DECODE-----------------------
  strokeWeight(0);
  fill(lightBrown);
  rect(675,150,150,100,7);
  fill(darkBrown);
  rect(675,150,140,90,7);
  
  fill(yellow);
  if (isEncodeMode) {
    rect(640,135,65,35,5);
  } else {
    rect(710,135,65,35,5);
  }
  
  fill(lightBrown);
  rect(640,135,60,30,5); // encode
  rect(710,135,60,30,5); // decode
  
  textSize(12);
  fill(0);
  text("ENCODE", 640, 135);
  text("DECODE", 710, 135);
  
  fill(255);
  rect(675,175,110,25);
  
  // --------------------ENCODE/DECODE-----------------------
  
  // --------------------RESET BUTTON------------------------
  fill(lightBrown);
  rect(400,550,150,30,7);
  fill(0);
  text("RESET PLUGBOARD",400,550);
  // --------------------RESET BUTTON------------------------
  
  // -----------------------PLUGBOARD------------------------
  fill(lightBrown);
  rect(400,400,710,210,15);
  fill(darkBrown);
  rect(400,400,700,200,15);
  
  // populate plugboard array
  textSize(16);
  for (int i=0; i<26; i++) {
    plugboard[i].drawPlug();
  }
  // -----------------------PLUGBOARD------------------------
   
   
  // -------------------------WIRE---------------------------
   
  for( int i = 0; i < connections + 1; i++ ) {
    Wire w = wires[i];
    if( w.isDragging() || w.isConnected() ) {
      w.drawWire();
      w.drawStart();
      w.drawEnd();
    }
  }

  
	rl.draw(); rc.draw(); rr.draw();

  fill(0);
  textSize(12);
  text(codedLetter,675,175);
}

void keyPressed() {
  if( ((int)key >= 97 && (int)key <= 122 ) || ((int)key >= 65 && (int)key <= 90)  || key == '\n') {
     if (!isConfigSet) {
        if(key == '\n') {
          config = typing.toUpperCase();
          rotor1Config = config.charAt(0);
          rl.setDefault(rotor1Config);
          //println(rotor1Con_itoalpha( _index_of_s(route, java.lang.Character.toUpperCase(c)) )fig);
          rotor2Config = config.charAt(1);
          rc.setDefault(rotor2Config);
          //println(rotor2Config);
          rotor3Config = config.charAt(2);
          rr.setDefault(rotor3Config);
          //println(rotor3Config);
          //println(typing);
          typing = "";
        }
        typing = typing + key; 
     }
     else {
       if(isEncodeMode && key != '\n') {
         codedLetter = rr.encode(rc.encode(rl.encode(key)));
       } else {
         codedLetter = rl.decode(rc.decode(rr.decode(key)));
         text(codedLetter,675,175);
     }
     rl.fwd(1);
    }
  }
}

//void mouseReleased() {
//  if (isConfigSet) {
//    if (mouseX>40 && mouseX<760 && mouseY>295 && mouseY<505) {
//      for (int i=0; i<plugboard.length; i++) {
//        if (mouseX>plugboard[i].xpos-plugRadius && mouseX<plugboard[i].xpos+plugRadius &&  
//            mouseY>plugboard[i].ypos-plugRadius && mouseY<plugboard[i].ypos+plugRadius) {
//            closestPlug = i;
//        }  
//      }
//    } 
    
//    if (closestPlug == -1) {
//        closestPlug = startingPlug;
//      }
      
//      //wire.xend = plugboard[closestPlug].xpos;
//      //wire.yend = plugboard[closestPlug].ypos;
//  }
  
//  // swap two faces 
//} 

void mouseDragged() {
  if(isConfigSet && mouseButton == LEFT) {
    Wire w = wires[connections];
    if( !w.isConnected() ) {
      w.xend = mouseX;
      w.yend = mouseY;
      println(w.xend);
    }
  }

}

void mousePressed() {
  // println("foo");
  if (mouseX>40 && mouseX<760 && mouseY>295 && mouseY<505) {
    if(isConfigSet && mouseButton == LEFT ) {
      Plug p = closest_plug(mouseX, mouseY, plugboard, 26);
      if( !p.isConnected() ) {
        // println(p.xpos);
        wires[connections].xstart = p.xpos;
        wires[connections].ystart = p.ypos;
        wires[connections].xend = p.xpos;
        wires[connections].yend = p.ypos;
        wires[connections].startDrag();
      }
    }
  }
  
  if (mouseX >= 325 && mouseX <= 475 && mouseY >= 535 && mouseY <=565) {
     fill(yellow);
     rect(400,550,160,30);
     fill(lightBrown);
    rect(400,550,150,30,7);
    fill(0);
    text("RESET PLUGBOARD",400,550);
    for( int i = 0; i < connections; i++) {
      wires[i].disconnect();
    }
    for( int i  = 0; i < 26; i++) {
      plugboard[i].disconnect();
    }
    connections = 0;
    rr.reset();
   }
  
}

void mouseReleased() {
  if(isConfigSet && mouseButton == LEFT && wires[connections].isDragging()) {
    Plug end = closest_plug(mouseX, mouseY, plugboard, 26);
    Plug start = closest_plug(wires[connections].xstart, wires[connections].ystart, plugboard, 26);
    if(end == start) {
      wires[connections].disconnect();
      return;
    }
    wires[connections].xend = end.xpos;
    wires[connections].yend = end.ypos; 
    start.connect();
    end.connect();
    wires[connections++].connect();
    rr.swap(end.letter, start.letter);
  }
  
  // encode/decode
  if (mouseX >= 610 && mouseX <= 670 && mouseY >= 120 && mouseY <= 150) {
    isEncodeMode = true;
    rl.reset(); rc.reset(); rr.reset();
  } else if (mouseX >= 680 && mouseX <= 740 && mouseY >= 120 && mouseY <= 150) {
    isEncodeMode = false;
    rl.reset(); rc.reset(); rr.reset();
  }
 
}
