public class Walker
{
  
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public PVector randomRGB = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 12;
  
  public float mass = 1;
  
  public Walker()
  {
    
  }
  
  //Newton's 2nd law of motion
  public void applyForce(PVector force)
  {
    PVector f  = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update()
  {
     //this.acceleration = PVector.random2D();
     this.velocity.add(this.acceleration); 
     this.velocity.limit(velocityLimit);
     this.position.add(this.velocity);
     this.acceleration.mult(0);
  }
  
  public void render()
  {
     fill(randomRGB.x, randomRGB.y, randomRGB.z);
     circle(position.x, position.y, scale); 
  }
  
  public void checkEdges()
  {
    if(this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if(this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    if(this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if(this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
  
}
