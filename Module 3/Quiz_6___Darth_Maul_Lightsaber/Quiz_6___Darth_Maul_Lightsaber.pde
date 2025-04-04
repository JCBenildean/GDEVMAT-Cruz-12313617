/*
Jedidiah B. Cruz
OTGD3
Quiz 6 Darth Maul Lightsaber
*/

void setup()
{
 
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);

  frameRate(120);
  
}

PVector mousePos() // Tracks mouse position
{
   float x = mouseX - Window.windowWidth; //Removed division due to mouse not corectly tracking
   float y = -(mouseY - Window.windowHeight); //Add "/ 2" after Window.windowHeight if not correctly tracking
   return new PVector(x, y);
}

void draw()
{
    background(130); 
   
    PVector mouse = mousePos();
    println("Magnitude: " + mouse.mag());
   
    //Red Outer Glow
    stroke(255, 0, 0);
    strokeWeight(16);
    mouse.normalize().mult(400);
    line(0, 0, -mouse.x, -mouse.y);
    line(0, 0, mouse.x, mouse.y);
    
    //White Inner Glow
    stroke(255, 233, 233);
    strokeWeight(4);
    mouse.normalize().mult(390);
    line(0, 0, -mouse.x, -mouse.y);
    line(0, 0, mouse.x, mouse.y);
    
    //Black Handle
    stroke(0, 0, 0);
    strokeWeight(20);
    mouse.normalize().mult(85);
    line(0, 0, -mouse.x, -mouse.y);
    line(0, 0, mouse.x, mouse.y);

}
