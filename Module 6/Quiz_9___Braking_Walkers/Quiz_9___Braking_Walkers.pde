/*
Jedidiah B. Cruz
OTGD3
Quiz 9 Braking Walkers
*/

Walker[] walkers = new Walker[8];

PVector wind = new PVector(0.15, 0);
//PVector gravity = new PVector(0, -0.4);

void setup()
{
 
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
  frameRate(120);
 

  mouseClicked();
}

void mouseClicked()
{  

  int posY = 0;
 
  for(int i = 0; i <= walkers.length - 1; i++) //Make 8 walker instances
  {
    posY = 2 * (Window.windowHeight / 8) * (i -(8 / 2));
    walkers[i] = new Walker();
    walkers[i].mass = i + 1;
    walkers[i].scale = walkers[i].mass * 12;
    walkers[i].position.x = -500;
    walkers[i].position.y = posY;
    walkers[i].randomRGB.x = int(random(0, 255) +1);
    walkers[i].randomRGB.y = int(random(0, 255) +1);
    walkers[i].randomRGB.z = int(random(0, 255) +1);
     
  }
}

void draw()
{
  background(80);
  noStroke();
  
  //To indicate the middle
  stroke(250, 250, 250);
  strokeWeight(8);
  line(0, -250, 0, 250);
  noStroke();
  
 for (Walker w : walkers)
 {
   
   w.acceleration = new PVector(0.2, 0); //Declaring acceleration
   
   float mew;
   
   if (w.position.x > 0)
   {
     mew = 0.4f;
   }
   else
   {
     mew = 0.01f;
   }
   
   float normal = 1;
   float frictionMagnitude = mew * normal; //friction strength
   PVector friction = w.velocity.copy(); 
   friction.mult(-1);
   friction.normalize();
   friction.mult(frictionMagnitude);
   w.applyForce(friction);
   
   PVector acceleration = new PVector(-0.12 * w.mass, 0); //Added acceleration (Bonus)
   w.applyForce(acceleration);
   w.render();
   w.update();

    
    //Newtons 3rd Law of Motion
    if (w.position.x > Window.right)  
    {
      w.position.x = Window.right; 
      w.velocity.x *= -1; 
    }
    
    if(w.position.x < Window.left)
    {
      w.position.x = Window.left; 
      w.velocity.x *= -1; 
    }
    
    if (w.position.y > Window.top) 
    {
      w.position.y = Window.top; 
      w.velocity.x *= -1; 
    }
    
    if(w.position.y < Window.bottom)
    {
      w.position.y = Window.bottom; 
      w.velocity.y *= -1;
    }
 }
}
 
