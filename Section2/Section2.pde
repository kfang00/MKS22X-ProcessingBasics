int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    float side = (v2x-v1x);
    if (levels < 2) {
      return;
    }
    else {
      fill(255, levels * 15, 0);
      triangle(v1x, v1y, v2x, v2y, v3x, v3y);
      gasket(levels - 1,(v2x + v3x)/2, (v2y + v3y)/2, ((v1x + v3x)/2) + side, (v2y + v3y)/2, v2x, v3y);
      gasket(levels - 1,((v2x + v3x)/2) - side, (v1y + v3y)/2, (v1x + v3x)/2, (v1y + v3y)/2, v1x, v3y);
      gasket(levels - 1,(v1x + v3x)/2,v1y + ((v1y - v3y)/2),(v2x + v3x)/2,v1y + ((v1y - v3y)/2), v3x, v1y);
    }
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels",20,20);
  fill(255,0,0);
  triangle(0, height-10, width, height-10, width/2, 10);
  gasket(levels,(0 + (width/2))/2, height/2, (width+(width/2))/2, height/2, width/2, height-10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
