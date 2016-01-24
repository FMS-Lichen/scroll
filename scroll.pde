import java.awt.GraphicsEnvironment;
import java.awt.DisplayMode;
float[]rad;
boolean b;
GraphicsEnvironment env;
DisplayMode dm;

void setup() {
  strokeWeight(10);
  env = GraphicsEnvironment.getLocalGraphicsEnvironment();
  dm = env.getDefaultScreenDevice().getDisplayMode();
  size(dm.getWidth(), dm.getHeight());
  rad=new float[width/10];
  for (int i=0; i<rad.length; i++) {
    rad[i]=0;
  }
  b=true;
  fullScreen();
  noCursor();
}
void draw() {
  background(255);
  for (int i=0; i<rad.length; i++) {
    if (b)
      rad[i]+=0.5+0.02*i;
    if (rad[i]>360)rad[i]-=360;
    else if (rad[i]<0)rad[i]+=360;
    if (cos(radians(rad[i]))>=0)
      stroke(255, 0, 0);
    else
      stroke(255, 200, 200);
    point(i*10+5, height/2*(1+sin(radians(rad[i]))));
  }
}
void keyPressed() {
  if (key==' ') {
    b=!b;
  }
  if (!b) {
    if (keyCode==RIGHT) {
      for (int i=0; i<rad.length; i++)
        rad[i]+=0.5+0.02*i;
    } else if (keyCode==LEFT) {
      for (int i=0; i<rad.length; i++)
        rad[i]-=0.5+0.02*i;
    }
  }
}