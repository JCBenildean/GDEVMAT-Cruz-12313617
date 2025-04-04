class Walker
{
  
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  
  public float s;
  public float ts = 0;
  
  public float r;
  public float g;
  public float b;
  public float tr = 560;
  public float tg = 255;
  public float tb = 0;
  
  void render()
  {
    circle(x, y, s);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.001f;
    ty += 0.001f;
  }
 
  void perlinScale()
  {
    s = map(noise(ts), 0, 1, 5, 150); 
    
    ts += 0.001f;
  }
  
  void perlinColor()
  {
    r = map(noise(tr), 0, 1, 0, 255); 
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    tr += 0.001f;
    tg += 0.001f;
    tb += 0.001f;
    
    fill(r, g, b);
    noStroke();
  } 
 
}
