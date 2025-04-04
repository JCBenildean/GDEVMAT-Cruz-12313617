/*
Jedidiah B. Cruz
OTGD3
Quiz 5 Vector Walker
*/

void setup()
{
 
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  frameRate(120);
  
}

Walker bouncer = new Walker();
Walker walker = new Walker();

void draw()
{
      
  background(255);

//Simulate Bouncing Ball
  bouncer.moveAndBounce();
  bouncer.randomizeColor();
  bouncer.render();
  
//Simulate Walker with PVector
  walker.normalWalk();
  walker.randomizeColor();
  walker.render();

}
