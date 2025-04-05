class Walker
{
  
  public PVector position = new PVector(); //Main properties of walkers
  public PVector randomRGB = new PVector();
  
  public float scale; //Scaling size

 
  Walker()
  {
      position = new PVector(); 
  }
   
  Walker(float x, float y)
  {
      position = new PVector(x, y);
  }
  
  Walker(PVector position)
  {
     this.position = position; 
  }
 
  void render()
  {
    noStroke();
    fill (randomRGB.x, randomRGB.y, randomRGB.z);
    circle(position.x, position.y, scale);
  }
  
}
