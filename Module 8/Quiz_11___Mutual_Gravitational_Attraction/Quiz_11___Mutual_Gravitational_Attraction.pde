/*
Jedidiah B. Cruz
OTGD3
Quiz 11 Mutual Gravitational Attraction
*/

Walker[] walkers = new Walker[10];
Walker bigMatter = new Walker();
Walker smallMatter = new Walker();

void setup()
{
 
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);
  
  frameRate(240); //Enabled for more apparent performance
  
 
  for(int i = 0; i <= walkers.length - 1; i++) //Make 8 walker instances
  {
    walkers[i] = new Walker();
    walkers[i].mass = int(random(1, 10)) + 1; // Randomize mass
    walkers[i].scale = walkers[i].mass * 12; //Scaled according to mass
    
    //Randomize position
    walkers[i].position.x = int(random(-300, 300) +1); 
    walkers[i].position.y = int(random(-300, 300) +1);
    
    //randomize color
    walkers[i].randomRGB.x = int(random(0, 255) +1);
    walkers[i].randomRGB.y = int(random(0, 255) +1);
    walkers[i].randomRGB.z = int(random(0, 255) +1);   
  }
}

//Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

PVector wind = new PVector(0.1, 0); //Adding wind force
PVector gravitational = new PVector();

void draw()
{
    background(255); 
    
    
    for(int i = 0; i < walkers.length - 1; i++)
    {
      walkers[i].update();
      walkers[i].checkEdges();
      walkers[i].render();
      for(int j = 0; j < walkers.length - 1; j++)
      {
        
        if(i != j)
        {
          gravitational = walkers[j].calculateAttraction(walkers[i]);
          walkers[i].applyForce(gravitational);
        }
        
      }
    }
    

}
