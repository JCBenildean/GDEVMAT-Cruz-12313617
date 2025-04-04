class Walker
{
  
  float x;
  float y;
  
  void render()
  {
    circle(x, y, 15);
  }
  
  void randomWalk()
  {
     int rng = int(random(8)); // Generates random value
     
     println("Random Walk: " + rng);
     
     int redValue = int(random(255) + 1);
     int greenValue = int(random(255) + 1);
     int blueValue = int(random(255) + 1);
     int alphaValue = int(random(50, 100));
     
     fill(redValue, greenValue, blueValue, alphaValue);
     
     switch (rng)
     {
       case 0: //North
         y += 10;
         break;
       case 1: //South
         y -= 10;
         break;
       case 2: //East
         x += 10;
         break;
       case 3: //West
         x -= 10;
         break;
       case 4: //North East
         y += 5;
         x += 5; 
         break;
       case 5: //North West
         y += 5;
         x -= 5;
         break;
       case 6: //South East
         y -= 5;
         x += 5;
         break;
       case 7: //South West
         y -= 5;
         x -= 5;
         break;
     }
     
  }
  
  void randomWalkBiased() //SouthEast Biased
  {
    
    int rng = int(random(10)); // Generates random value
    
    println("Random Biased Walk: " + rng);
    
    int redValue = int(random(255) + 1);
    int greenValue = int(random(255) + 1);
    int blueValue = int(random(255) + 1);
    int alphaValue = int(random(50, 100));
     
    fill(redValue, greenValue, blueValue, alphaValue);
      
    switch (rng)
     {
       case 0: //North
         y += 10;
         break;
       case 1: //South
         y -= 10;
         break;
       case 2: //East
         x += 10;
         break;
       case 3: //West
         x -= 10;
         break;
       case 4: //North East
         y += 5;
         x += 5; 
         break;
       case 5: //North West
         y += 5;
         x -= 5;
         break;
       case 6: //South West
         y -= 5;
         x -= 5;
         break;
     }
     
     if (rng >= 7 && rng <= 9) //South East Bias
     {
       println("Working");
       y -= 5;
       x += 5;
     }
    
  }
  
}
