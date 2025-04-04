class Walker
{
  //NORMAL WALK ---------------------------------------------------
  
  //Initializing Variables
  public PVector randomPosition = new PVector();
  public PVector randomRGB = new PVector();
  public PVector speed = new PVector(5, 8); 
  
  void render() //Render programm to screen
  {
    circle(randomPosition.x, randomPosition.y, 50);
  }
  
  void normalWalk() //Randomize direction
  {
     int rng = int(random(8)); // Generates random value
     
     switch (rng)
     {
       case 0: //North
         randomPosition.y += speed.y;
         break;
       case 1: //South
         randomPosition.y -= speed.y;
         break;
       case 2: //East
         randomPosition.x += speed.x;
         break;
       case 3: //West
         randomPosition.x -= speed.x;
         break;
       case 4: //North East
         randomPosition.y += speed.y;
         randomPosition.x += speed.x; 
         break;
       case 5: //North West
         randomPosition.y += speed.y;
         randomPosition.x -= speed.x;
         break;
       case 6: //South East
         randomPosition.y -= speed.y;
         randomPosition.x += speed.x;
         break;
       case 7: //South West
         randomPosition.y -= speed.y;
         randomPosition.x -= speed.x;
         break;
     }
     
     //Bounce Condition
    if ((randomPosition.x > Window.right) || (randomPosition.x < Window.left))
    {
      speed.x *= -1; 
    }
    
    if ((randomPosition.y > Window.top) || (randomPosition.y < Window.bottom))
    {
      speed.y *= -1;
    }
     
  }
  
  void randomizeColor() //Randomize color
  {
     randomRGB.x = int(random(255) + 1);
     randomRGB.y = int(random(255) + 1);
     randomRGB.z = int(random(255) + 1);
     
     fill(randomRGB.x, randomRGB.y, randomRGB.z);
     noStroke();
  }
  
  //BOUNCE -----------------------------
  
  void moveAndBounce() //Randomize direction
  {
    randomPosition.add(speed);
     
    //Bounce Condition
    if ((randomPosition.x > Window.right) || (randomPosition.x < Window.left))
    {
      speed.x *= -1; 
    }
    
    if ((randomPosition.y > Window.top) || (randomPosition.y < Window.bottom))
    {
      speed.y *= -1;
    }
     
  }
  
}
