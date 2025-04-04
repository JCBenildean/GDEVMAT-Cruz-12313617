/*
Jedidiah B. Cruz
OTGD3
Quiz 10 Sinking Logs
*/

Walker[] walkers = new Walker[10];

void setup()
{
 
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);

  //frameRate(60); Disabled for consistency
  
  int posX = 0;
 
  for(int i = 0; i <= walkers.length - 1; i++) //Make 8 walker instances
  {
    posX = 2 * (Window.windowWidth / 10) * (i - 5); // Equalizes spacing to fit within sketch
    walkers[i] = new Walker();
    walkers[i].mass = int(random(1, 10)) + 1; // Randomize mass
    walkers[i].scale = walkers[i].mass * 12; //Scaled according to mass
    walkers[i].position.x = posX;
    walkers[i].position.y = 400;
    
    //randomize color
    walkers[i].randomRGB.x = int(random(0, 255) +1);
    walkers[i].randomRGB.y = int(random(0, 255) +1);
    walkers[i].randomRGB.z = int(random(0, 255) +1);
     
  }
}

Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

PVector wind = new PVector(0.1, 0); //Adding wind force

void draw()
{
    background(255); 
    ocean.render(); 
    
    for(Walker myWalker : walkers)
    {  
    myWalker.render();
    myWalker.update();
    
    myWalker.applyForce(wind); //Apply wind force
    
    //Apply gravity
    PVector gravity = new PVector(0, -0.15f * myWalker.mass); 
    myWalker.applyForce(gravity); 
    
    //Apply friction
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = myWalker.velocity.copy();
    myWalker.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); //applying friction to walker
    
      if (myWalker.position.y <= Window.bottom)
      {
        myWalker.position.y = Window.bottom;
        myWalker.velocity.y *= -1;
      }
      
      //Apply Drag Force when in contact with liquid
      if (ocean.isCollidingWith(myWalker))
      {
        PVector dragForce = ocean.calculateDragForce(myWalker);
        myWalker.applyForce(dragForce);
      }
    }
    

}
