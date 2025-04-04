/*
Jedidiah B. Cruz
OTGD3
Quiz 1 More Functions
*/

int diameter = 5;
float t = 0.0; //Start angle
float dt = 0.1;
float frequency = 0.22; //Intensity

int xspacing = 5;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 50.0;  // Start angle at 0
float amplitude = 25.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup()
{
 
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  w = width;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  
}

void draw()
{
 
  background(125);
  
  drawCartesianPlane(); 
  drawLinearFunction();
  drawQuadraticFunction();

  //BONUS
  drawSineWaveFunction_1();
  drawSineWaveFunction_2();
  
}


void calcWave() //BONUS
{
  theta += 0.02;

  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void drawSineWaveFunction_1() //BONUS
{
  calcWave();
  noStroke();
  fill(255);

  for (int x = 0; x < yvalues.length; x++) {
    ellipse((x*xspacing) - 638, 2+yvalues[x], 5, 5);
  }
}

  
void drawSineWaveFunction_2() // BONUS
{
  color cyan = color(32, 193, 214);
  fill(cyan);

  noStroke();
  for (int x = -200; x < width/diameter+10; x++) 
  {
    ellipse(x*diameter, amplitude*sin(frequency*(t+x))+x/2,diameter, diameter);
  }
  
  t += dt;
}

void drawCartesianPlane()
{
    
  strokeWeight(1);
  color black = color(0, 0, 0);
  fill(black);
  stroke(black);
  
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for(int i = -300; i <= 300; i += 10)
  {
    line(i, -5, i, 5);
    line(-5, i, 5, i);
  }
   
}

void drawLinearFunction()
{
  /*
  * f(x) = -5x + 30
  * Let x be 4, then y = 10    (4, 10);
  * Let x be -3, then y = 45    (-3, 45)  ;
  */
  
  color purple = color(108, 32, 214);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
   circle(x, (-5 * x) + 30, 5); 
  }
}

void drawQuadraticFunction()
{
  /*
  * f(x) = x^2 - 15x - 3
  * Let x be 5, then y = -47
  * Let x be -2, then y = -23
  */
  
  color yellow = color(237, 227, 36);
  fill(yellow);
  stroke(yellow);
  noStroke();
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
   circle(x * 5, (float)Math.pow(x, 2) - (x * 15) - 3, 5);
  }

}
