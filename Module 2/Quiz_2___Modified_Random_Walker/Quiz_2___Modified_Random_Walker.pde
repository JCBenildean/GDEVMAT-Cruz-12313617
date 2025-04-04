/*
Jedidiah B. Cruz
OTGD3
Quiz 2 Modified Random Walker
*/

void setup()
{
 
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);

  
  
}

Walker myWalker = new Walker(); // Creates new instance of walker class
Walker freeWalker = new Walker();

void draw()
{
  
  
  myWalker.randomWalk();
  myWalker.render(); 
  
  //South East Bias
  freeWalker.randomWalkBiased();
  freeWalker.render();
  
}
