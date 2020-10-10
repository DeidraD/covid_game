// Master variables
int mode = 1;  // Current room
int w = 40;  // Wall thickness
int tx = 620;  // Text x-coordinate
int ty = 420;  // Text y-coordinate
int nx = 600;  //NPC Text x-coordinate
int ny = 80;  //NPC Text y-coordinate
boolean gate = true;  // Is the gate closed or open?

// Hero variables
int x = 400;  // Hero x-coordinate
int y = 240;  // Hero y-coordinate
int r = 40;  // Hero radius
float speed = 2.0;  // Hero speed

// Room 1 variables
int gx = 260;  // Gate x-coordinate
int dx = 150;  // Dagger x-coordinate
int dy = 210;  // Dagger y-coordinate

// Room 2 variables
int kx = 440;  // Key x-coordinate
int ky = 230;  // Key y-coordinate

boolean daggerOnOff = false; // starts off

void setup() {
  size(640, 480);
  ellipseMode(RADIUS);
  noCursor();
  textSize(14);
  textAlign(RIGHT);
}

void draw() {
  
  if (mode == 1) {  // ROOM 1
                          // Background image for closet
                          // Background image for hallway
    
    // Walls
    background(255);
    noStroke();
    fill(0);
    rect(0, 0, width, w);  // Top
    rect(0, 0, w, height);  // Left
    rect(0, height-w, width, w);  // Bottom
    
    //NPC
    

    // Gate
    fill(0);
    if (gate == true) {
      // Dagger
      fill(102);
      triangle(dx, dy, dx+5, dy-10, dx+10, dy);
      rect(dx, dy, 10, 70);
      rect(dx-10, dy+45, 30, 10);  
      for (int y = w; y <= height-w; y += 20) {
        ellipse(gx, y, 5, 5);
      }
      text("Use the arrow keys to explore", tx, ty);
                                      // Create person
                                     // Create person text box (for stoyyline)
                                    // Change shape of dagger into a needle 
    } else {
      text("Edit the code to grab the dagger", tx, ty);
                                  // Create second statement from person for when hero returns(COMPLETED)
      
      // Check if hero is on top of the dagger
      if (x > dx && x < dx+30 && y > dy && y < dy+75) {
        daggerOnOff = true;
      }
      if (daggerOnOff == true) {
        // Dagger
        fill(102);
        triangle(x-100, y, x-100, y+10, x-110, y+5);
        rect(x-100, y, 70, 10);
        rect(x-55, y-10, 10, 30);
      } else{
        // Dagger
        fill(102);
        triangle(dx, dy, dx+5, dy-10, dx+10, dy);
        rect(dx, dy, 10, 70);
        rect(dx-10, dy+45, 30, 10);
        
      }
    }
    //NPC Text
    if (gate==true){
      text("Um...Why dont you have a mask on?", nx, ny);
      text("Can you please put one on, it is required!", nx, 100);
    }
    if (gate==false){
      if (daggerOnOff==false){
        text("Its still not on... I'm waiting", nx, ny);
      }
      
    }
    
    if (daggerOnOff==true){
        text("Thank you for putting the mask on!", nx, ny);
      }
      //NPC
      pushMatrix();
      translate(550,150);
      fill(238,254,35);
      ellipse(0,0,r,r);
      fill(0);
      ellipse(-15,-5,7,20);
      ellipse(15,-5,7,20);
      popMatrix();


    // Stop the hero from walking through walls
    if (gate == true) {
      if (x < gx+r+5) {  // Check gate
        x = gx+r+5;
      }
    } 
    else {
      if (x < w+r) {  // Check left wall
        x = w+r;
      }
    }
    if (y > height-w-r) {  // Check bottom wall
      y = height-w-r;
    }
    if (y < w+r) {  // Check top wall
      y = w+r;
    }

    // Move to room 2
    if (x > width+r) {
      mode = 2; 
      x = r;
    }
    
  } else {  // ROOM 2
    if (daggerOnOff == true) {
      // Dagger
      fill(102);
      triangle(x-100, y, x-100, y+10, x-110, y+5);
      rect(x-100, y, 70, 10);
      rect(x-55, y-10, 10, 30);          
    }
                                // Change shape of the dagger 
                                // Background image for hallway { ending }
                                // Background image for hospital room
    
    // Walls
    background(255);
    noStroke();
    fill(0);
    rect(0, 0, width, w);  // Top
    rect(width-w, 0, w, height);  // Right
    rect(0, height-w, width, w);  // Bottom

    // Key
                               // Change shape of key to key card (COMPLETED)
    if (gate == true) {
      fill(102);
      pushMatrix();
      translate(kx, ky);
       fill(255);
      noStroke();
     rect(0,-50,150,100,20); 
     fill(0);
     noStroke();
     rect(0,20,150,15);
     fill(121);
     noStroke();
     square(10,-40,50);
     rect(70,-40,75,5);
   rect(70,-30,55,5);
     rect(70,-20,65,5);
     fill(114,174,253);
     noStroke();
     rect(70,-10,75,20);
  
      popMatrix();
    }

    // Text
    fill(0);
    if (gate == true) {
                                    // Add some text ere potentially to further storyline
      text("Grab the key card to open the gate", tx-w, ty);
    } 
    else {
      text("You have the key card! The gate is open!", tx-w, ty);
    }

    // Check if hero is on top of the key
    if (x > kx && x < kx+80 && y > ky && y < ky+30) {
      gate = false;
    }

    // Stop the hero from walking through walls
    if (x < -r) {
      mode = 1;
      x = width-r;
    }
    if (x > width-w-r) {  // Check right wall
      x = width-w-r;
    }
    if (y > height-w-r) {  // Check bottom wall
      y = height-w-r;
    }
    if (y < w+r) {  // Check top wall
      y = w+r;
    }
    // Move to room 2
    if (x > width+r) {
      mode = 2; 
      x = r;
    }
  }

  // Draw hero
                                // Change hero color and make y-axis longer
  fill(126);
  ellipse(x, y, r, r);

  // Move hero with arrow keys
  if (keyPressed && key == CODED) {
    if (keyCode == UP) { 
      y -= speed;
    } else if (keyCode == DOWN) { 
      y += speed;
    } else if (keyCode == LEFT) { 
      x -= speed;
    } else if (keyCode == RIGHT) {
      x += speed;
    }
  }
}
