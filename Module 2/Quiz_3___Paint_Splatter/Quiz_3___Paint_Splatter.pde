/*
Jedidiah B. Cruz
OTGD3
Quiz 3 Modified Random Walker
*/

void setup()
{
 
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
  
}

Pollock painting = new Pollock();

void draw()
{
  
  painting.randomSplat();
  
}
