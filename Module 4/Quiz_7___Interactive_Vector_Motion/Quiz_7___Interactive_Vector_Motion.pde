/*
Jedidiah B. Cruz
OTGD3
Quiz 7 Interactive Vector Motion
*/

//Initializing blackhole and walkers array
Walker blackHole = new Walker();
Walker[] walkers = new Walker[100];

int framesLeft; //Globan value to be modified for sketch reset

void setup()
{
 
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);

  frameRate(60); //Lowered framerate from 120
  
  sketchStart(); //Starts walkers spawn
  
}

//Placed in seperate function for ease of reactivation
void sketchStart()
{
  framesLeft = 0;
  for(int i = 0; i <= walkers.length - 1; i++) //Make 8 walker instances
  {
    walkers[i] = new Walker();
    walkers[i].scale = int(random(1, 15) +1); //Scaled according to mass

    
    //Randomize positionwith gaussian
    walkers[i].position.x = 222 * randomGaussian() + 0 ; 
    walkers[i].position.y = 87 * randomGaussian() + 0 ;

    
    //randomize color
    walkers[i].randomRGB.x = int(random(0, 255) +1);
    walkers[i].randomRGB.y = int(random(0, 255) +1);
    walkers[i].randomRGB.z = int(random(0, 255) +1);   
  }
}

//Adds mouse functionality
PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}


void draw()
{
  background(42);
  
  if (framesLeft >= 555) sketchStart(); //Resets the sketch through frame count of 555
  
  //Enables mouse tracking
  PVector mouse = mousePos();
  blackHole.position = mouse;
  
  PVector direction; //Initializing

  //Loop that makes all instances of walkers move
   for (Walker walkers : walkers)
   {
      direction = PVector.sub(walkers.position, blackHole.position); //subtracts without modifying inputed values
     
      walkers.acceleration.x = -(direction.normalize()).x * 0.2; //Formula makes walkers move toward mouse & add acceleration
      walkers.acceleration.y = -(direction.normalize()).y * 0.2;
      
      walkers.update(); //allows increase of acceleration
      walkers.render(); 
      
      println(direction); //Testing code
      println(walkers.acceleration);
      
      
      walkers.position.sub(walkers.acceleration); //Makes walker move based on acceleration listed above
   }
  
  //Adds black hole cursor to mouse BONUS
  fill(255, 255, 255);
  circle(mouse.x, mouse.y, 50);
  
  framesLeft++; //add frame count
    
}
