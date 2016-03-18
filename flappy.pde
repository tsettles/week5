bird b; //giving bird class a variable
float[] values;
int index;

void setup() {
  size(600, 250);
  b = new bird(); //new bird object
  values = new float[width/3];
  index = 0;
}

float maybeRandomHeight() {
  if (random(900) < 12) {
    return random(height/6, 2*height/3);
  } else {
    return 0;
  }
}


void draw() {
  background(255);
  b.display(); //calling the display of the bird function
  b.move();   //calling the falling of the bird function
  b.reset();   //calling the resetting of the bird function
  values[index] = maybeRandomHeight();
  index = index + 1;



  if (index >= values.length) {
    index = 0;
  }
  for (int i = 0; i < values.length; ++i) {
    int realIndex = index + i;
    if (realIndex >= values.length) {
      realIndex -= values.length;
    }
    //draws out the top gaps
    if (values[realIndex]>height/2) {
      line(i*3, values[realIndex]/4, i*3, 0);
      line(i*3, height-values[realIndex], i*3, height);
    }
    //draws out the gaps at the bottom
    if (values[realIndex]<height/3) {
      line(i*3, height-values[realIndex], i*3, height);
      line(i*3, values[realIndex]*1.5, i*3, 0);
    }
  }
}

//the bird class is pretty much everything about the bird

class bird {
  //defining the arguments for the bird
  float xpos, ypos, ymove;
  bird() {
    //bird's x,y positions
    xpos = width/2;
    ypos = height/2;
  }
  void display() {
    //what the bird looks like
    stroke(0, 150, 255);
    fill(0, 255, 230);
    strokeWeight(2);
    ellipse(xpos, ypos, 20, 20);
  }
  /* //Not sure how to do this part 
  void checkCollisions() {
    if (yPos>250) {
      end=false;
    }
    */
  void jump() {
    //the jump action
    ymove=-5;
  }
  void move() {
    //the falling
    ymove+=0.2;
    ypos+=ymove;
  }
  void reset() {
    //resetting the bird
    if (ypos>height || ypos<0) {
      setup();
    }

      for (int i = 0; i<3; i++) {


        }
      }
    }

  class pillar {
    float xPos, opening;
    boolean cashed = false;
    pillar(int i) {
      xPos = 100+(i*200);
      opening = random(600)+100;
    }
    void drawPillar() {
      line(xPos, 0, xPos, opening-100);  
      line(xPos, opening+100, xPos, 800);
    }
    void checkPosition() {
      if (xPos<0) {
        xPos+=(200*3);
        opening = random(600)+100;
        cashed=false;
      } 
      if (xPos<250&&cashed==false) {
        cashed=true;

      }
    }
  }


void mousePressed() {
  //using the mouse click to control the bird
  b.jump(); //calling the bird's jumping function
}
void keyPressed() {
  //using the space key to control the bird
  b.jump(); //calling the bird's jumping function
}
