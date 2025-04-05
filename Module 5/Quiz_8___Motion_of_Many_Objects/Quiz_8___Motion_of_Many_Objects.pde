/*
Jedidiah B. Cruz
OTGD3
Quiz 8 Motion of Many Objects
*/

Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
 
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
  frameRate(120);
 
  for(int i = 0; i <= walkers.length - 1; i++) //Initializes all data in object array
  {
    walkers[i] = new Walker();
    walkers[i].mass = i + 1;
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].position.x = -500;
    walkers[i].position.y = 200;
    walkers[i].randomRGB.x = int(random(0, 255) +1);
    walkers[i].randomRGB.y = int(random(0, 255) +1);
    walkers[i].randomRGB.z = int(random(0, 255) +1);
  }
}



void draw()
{
  background(80);
  noStroke();
 
 //Activity before refreshing
 for(int i = 0; i <= walkers.length - 1; i++)
 {
   
    walkers[i].update();
    walkers[i].render();
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
    
    //Newtons 3rd Law of Motion
    if (walkers[i].position.x > Window.right)  
    {
      walkers[i].position.x = Window.right; 
      walkers[i].velocity.x *= -1; 
    }
    
    if(walkers[i].position.x < Window.left)
    {
      walkers[i].position.x = Window.left; 
      walkers[i].velocity.x *= -1; 
    }
    
    if (walkers[i].position.y > Window.top) 
    {
      walkers[i].position.y = Window.top; 
      walkers[i].velocity.y *= -1; 
    }
    
    if(walkers[i].position.y < Window.bottom)
    {
      walkers[i].position.y = Window.bottom; 
      walkers[i].velocity.y *= -1;
    }
 }
 
}
