final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24, life, soldier, vegetable, rat, stone1, stone2;
PImage groundhogDown,groundhogIdle,groundhogLeft,groundhogRight;
PImage []soil=new PImage [6];
int soilbaseY=160;
int lifeX=10;
int ratX=320;
int ratY=80;
int ratSpeed=80/15;
boolean idle=true;
// For debug function; DO NOT edit or remove this!
int playerHealth = 2;
float cameraOffsetY = 0;
boolean debugMode = false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
 groundhogDown = loadImage("img/groundhogDown.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  stone1=loadImage("img/stone1.png");
  stone2=loadImage("img/stone2.png");
  rat=loadImage("img/groundhogIdle.png");
  soldier=loadImage("img/soldier.png");
  vegetable=loadImage("img/cabbage.png");
  life=loadImage("img/life.png");
  for(int i=0; i<6; i++){
    soil[i]=loadImage("img/soil"+i+".png");
  }
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {
      ratX=320;
      ratY=80;
			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game


		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, soilbaseY - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		image(soil8x24, 0, 160);
    for(int k=0; k<6; k++){
    for(int i=0; i<8; i++){
    for(int j=0; j<4; j++){
      float soilX=i*width/8;
      float soilY=soilbaseY+j*width/8;
      image(soil[0], soilX, soilY, width/8,width/8);
      image(soil[1], soilX, soilY+1*4*width/8, width/8,width/8);
      image(soil[2], soilX, soilY+2*4*width/8, width/8,width/8);
      image(soil[3], soilX, soilY+3*4*width/8, width/8,width/8);
      image(soil[4], soilX, soilY+4*4*width/8, width/8,width/8);
      image(soil[5], soilX, soilY+5*4*width/8, width/8,width/8);
    }
    }
    }
      //rock1
      float rock1Y=0;
      for(int i=0; i<8; i++){
        float rock1X=i*80;

        image(stone1,rock1X,soilbaseY+rock1Y);
        rock1Y+=80;       
      }
      //rock2
      float rock2Y=0;
      float rock2YY=0;
      for(int i=0; i<8; i++){
        float rock2XX=i*160;
        float rock2X=i*80;
        image(stone1,width-80*7-rock2X,soilbaseY+width/8*8+rock2Y);
        image(stone1,width-80*6-rock2XX,soilbaseY+width/8*8+rock2YY);
        image(stone1,width-80*5-rock2XX,soilbaseY+width/8*9+rock2YY);
        image(stone1,width-80*3-rock2X,soilbaseY+width/8*8+rock2Y);
        image(stone1,width-80*2-rock2XX,soilbaseY+width/8*8+rock2YY);
        image(stone1,width-80-rock2XX,soilbaseY+width/8*9+rock2YY);
        image(stone1,width-80-rock2X,soilbaseY+width/8*10+rock2Y);
        image(stone1,width+80*2-rock2XX,soilbaseY+width/8*8+rock2YY);
        image(stone1,width+80-rock2XX,soilbaseY+width/8*11+rock2YY);
        image(stone1,width-80-rock2X,soilbaseY+width/8*14+rock2Y);
        rock2Y+=80;    
        rock2YY+=160;
      }
      
      //rock3
      float rock3Y=0;
      for(int i=0; i<8; i++){
        float rock3X=i*80;
        image(stone1,width-80*7-rock3X,soilbaseY+width/8*16+rock3Y);
        image(stone1,width-80*6-rock3X,soilbaseY+width/8*16+rock3Y);
        image(stone2,width-80*6-rock3X,soilbaseY+width/8*16+rock3Y);
        image(stone1,width-80*4-rock3X,soilbaseY+width/8*16+rock3Y);
        image(stone1,width-80*3-rock3X,soilbaseY+width/8*16+rock3Y);
        image(stone2,width-80*3-rock3X,soilbaseY+width/8*16+rock3Y);
        image(stone1,width-80-rock3X,soilbaseY+width/8*17+rock3Y);
        image(stone2,width-80-rock3X,soilbaseY+width/8*17+rock3Y);
        image(stone1,width-80-rock3X,soilbaseY+width/8*16+rock3Y);
        image(stone1,width-80-rock3X,soilbaseY+width/8*19+rock3Y);
        image(stone1,width-80-rock3X,soilbaseY+width/8*20+rock3Y);
        image(stone2,width-80-rock3X,soilbaseY+width/8*20+rock3Y);
        image(stone1,width-80-rock3X,soilbaseY+width/8*22+rock3Y);
        image(stone1,width-80-rock3X,soilbaseY+width/8*23+rock3Y);
        image(stone2,width-80-rock3X,soilbaseY+width/8*23+rock3Y);
        rock3Y+=80;       
      }

      
      //rat
     // image(rat,ratX,ratY);
     
		// Player

    if(idle){
     image(rat,ratX,ratY); 
    }
   if(downPressed){
      if(ratY<height-80){
        idle = false;
        leftPressed = false;
        rightPressed = false;
        image(groundhogDown,ratX,ratY);
        if(ratY < soilbaseY+80*19){
         soilbaseY -= ratSpeed;
          if(soilbaseY%80 == 0){
          downPressed = false;
          idle = true;
          }
        }else{
          ratY += ratSpeed;
          if(ratY%80 == 0){
          downPressed = false;
          idle = true;
          }
        } 
      }else{
        downPressed = false;
        idle = true;
      }
    }
     if(leftPressed){
      if(ratX>0){
        idle = false;
        downPressed = false;
        rightPressed = false;
        image(groundhogLeft,ratX,ratY);
        ratX -= ratSpeed;
        if(ratX%80 == 0){
          leftPressed = false;
          idle = true;
        }
      }
      else{
        leftPressed = false;
        idle = true;
      }

    }
    
    if(rightPressed){
      if(ratX<width-80){
        idle = false;
        leftPressed = false;
        downPressed = false;
        image(groundhogRight,ratX,ratY);
        ratX += ratSpeed;
        if(ratX%80 == 0){
          rightPressed = false;
          idle = true;
        }
      }
      else{
        rightPressed = false;
        idle = true;
      }
    }
    


		// Health UI
    for(int i=0; i<playerHealth; i++){
     image(life, lifeX+i*70,10);

     
    }
     if(playerHealth == 0){
      gameState = GAME_OVER;
    }

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
      
        ratX=320;
        ratY=80;
        playerHealth=2;
    
        
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
  
 if(key==CODED){
   switch(keyCode){
     //case UP:
     //ratY-=80;
     //if(ratY<80){
     //ratY=80; 
     //}
     //break;
   
     case DOWN:
           if(ratX%80 == 0 && ratY%80 == 0 && soilbaseY%80 == 0){
            downPressed = true;
            leftPressed = false;
            rightPressed = false;
          }
          break;
      case LEFT:
          if(ratX%80 == 0 && ratY%80 == 0 && soilbaseY%80 == 0){
            leftPressed = true;
            downPressed = false;
            rightPressed = false;
          }
          break;
      case RIGHT:
          if(ratX%80 == 0 && ratY%80 == 0 && soilbaseY%80 == 0){
            rightPressed = true;
            leftPressed = false;
            downPressed = false;
          }
          break;
      }
    }

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
