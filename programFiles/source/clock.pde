int CENTERX;
int CENTERY;
int CLOCKDIAM=400;
int s;
int m;
int h;
int CLOCKRADIUS=CLOCKDIAM/2;
void setup(){
 size(500,500);
 CENTERX=width/2;
 CENTERY=height/2;
 background(0);
 s=second();
 m=minute();
 h=hour()%12;
 clockFrame(CENTERX,CENTERY,CLOCKDIAM);
 ticks();
 digital();
}
// still working



void draw(){
  background(0);
  clockFrame(CENTERX,CENTERY,CLOCKDIAM);
  digital();
  labels();
  seconds();
  minutes();
  hours();
  ticks();

  if (frameCount%60==0) {
    s=(s+1)%60;
  }
  if (frameCount%60==0 && s==0) {
    m=(m+1)%60;
  }
  if (frameCount%60==0 && m==0) {
    h=(h+1)%12;
  }
}

void clockFrame(int x, int y, int size){
  fill(0,0,100);
  circle(x, y, size+(size/10));
  fill(150,200,255);
  circle(x , y, size);
  fill(20,50,75);
  circle(x,y,(size/30));
  fill(10,30,35);
} 

void ticks(){
  float rads;
  for (int i=0;i<60;i++) {
    rads=radians(i*6);
    stroke(0,0,100);
    int outerX=int(CLOCKRADIUS*cos(rads)+CENTERX);
    int outerY=int(CLOCKRADIUS*sin(rads)+CENTERY);
    outerX=(outerX*19+CENTERX)/20;
    outerY=(outerY*19+CENTERY)/20;
    if (i%15==0) {
      strokeWeight(4);
      line(outerX,outerY,(outerX*6+CENTERX)/7,(outerY*6+CENTERY)/7);
    }
    else if (i%5==0) {
      strokeWeight(3);
      line(outerX,outerY,(outerX*7+CENTERX)/8,(outerY*7+CENTERY)/8);
    }
    else {
      strokeWeight(2);
      line(outerX,outerY,(outerX*10+CENTERX)/11,(outerY*10+CENTERY)/11);
    }
  }
}

void labels(){
  fill(0,0,100);
  textSize(height/20);
  textAlign(CENTER,CENTER);
  text("12", CENTERX, (0.9*height)/4);
  text("6", CENTERX, (3.1*height)/4);
  text("9",(0.9*width)/4, CENTERY);
  text("9",(0.9*width)/4, CENTERY);
  text("3",(3.1*width)/4, CENTERY);
}


void seconds(){
  int outerX=outX(s,6);
  int outerY=outY(s,6);
  strokeWeight(1);
  line((outerX*8+CENTERX)/9,(outerY*8+CENTERY)/9,CENTERX,CENTERY);
}

void minutes(){
  int outerX=outX(m,6);
  int outerY=outY(m,6);
  strokeWeight(3);
  line((outerX*3+CENTERX)/4,(outerY*3+CENTERY)/4,CENTERX,CENTERY);
}

void hours(){
  int outerX=outX(h,30);
  int outerY=outY(h,30);
  strokeWeight(6);
  line((outerX*2+CENTERX)/3,(outerY*2+CENTERY)/3,CENTERX,CENTERY);
}

int outX(int t, int mult) {
  return int(CLOCKRADIUS*cos(radians(t*mult+270))+CENTERX);
}
int outY(int t, int mult) {
  return int(CLOCKRADIUS*sin(radians(t*mult+270))+CENTERX);
}

void digital(){
  strokeWeight(3);
  stroke(15,15,140);
  fill(0,0,100);
  rect(CENTERX/1.3, CENTERY+height/18, width/4.3, height/10, 10);
  textSize(30);
  fill(255,255,0);
  text(m, CENTERX, CENTERY+height/10);
  text(":", CENTERX+width/26, CENTERY+height/10);
  text(s, CENTERX+width/13, CENTERY+height/10);
  text(":", CENTERX-width/26, CENTERY+height/10);
  text(h, CENTERX-width/13, CENTERY+height/10);
}

/**  for (int i=0;i<60;i = i + 5) {

    rads=radians(i*6);
    stroke(0,0,100);
    int outerX=int(CLOCKRADIUS*cos(rads)+CENTERX);
    int outerY=int(CLOCKRADIUS*sin(rads)+CENTERY);
    outerX=(outerX*19+CENTERX)/20;
    outerY=(outerY*19+CENTERY)/20;
    
    int nmbr = 1;
    textSize(height/20);
    text(nmbr, (((outerX*4+CENTERX)/5)-(width/100)), (((outerY*4+CENTERY)/5)+(height/70)));
    nmbr = nmbr+1;
  }
  */
