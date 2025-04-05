class Walker
{
  
  public PVector position = new PVector(); //Main properties of walkers
  public PVector randomRGB = new PVector();
  
  public PVector velocity = new PVector(); //Initialized values for walkers acceleration
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10; // added velocity limit for stability of visual
  
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
 
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
 
  void render()
  {
    noStroke();
    fill (randomRGB.x, randomRGB.y, randomRGB.z);
    circle(position.x, position.y, scale);
  }
  
}
