
int MAX_VALUE = 100;
int MIN_VALUE = -100;

Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  int bars = int(random(1, 41));
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[bars];
    speeds = new float[bars];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    //THESE ARE WRONG: They just illustrate how they could look
    //fill(255, 0, 0);
    float sx = x ;
    float sy = y + 100;

    for (int a = 0; a < values.length; a++) {
      if ((values[a] > 50) && (values[a] <= 100)) {
        fill(0 + (265 - values[a]), 265 - (105 - values[a]), 0);
      }
      else if ((values[a] <= 50) && (values[a] > 0)) {
        fill(255, 250 - (50 - values[a]), 0);
      }
      else if ((values[a] < 0) && (values[a] >= -100)) {
        fill(255, 128 + values[a], 0);
      }
  
      rect(sx + (a * (400.0/bars)), sy, (400.0/bars), values[a] * -1);
    }
    
   // fill(0, 255, 0);


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      if ((values[i] < -100) || (values[i] > 100)) {
        speeds[i] = speeds[i] * -1;
      }
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min

      
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
  int green = 255;
  int red = 100;
}
void draw() {
  background(255);
  v.display();
  v.update();
}
