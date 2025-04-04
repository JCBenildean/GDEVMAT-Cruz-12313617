class Pollock 
{
  

float gaussian;
float x;
float y;

float scale;

float standardDeviation;
float mean;

int redValue;
int greenValue; 
int blueValue;
int alphaValue;
  
  void randomSplat()
  {
     splatCoordinate();
     splatColor();
     render();  
  }
  
  void render()
  {
    gaussian = randomGaussian();
    standardDeviation = 50;
    mean = 6  ;
    
    scale = standardDeviation * gaussian + mean; 
    
    circle(x, y, scale);
  }
  
  void splatCoordinate()
  {
    gaussian = randomGaussian();
    
    standardDeviation = 255;
    mean = 0;
    
    x = standardDeviation * gaussian + mean;
    y = int(random(-719, 721));
    
  }

  void splatColor()
  {
    redValue = int(random(255) + 1);
    greenValue = int(random(255) + 1);
    blueValue = int(random(255) + 1);
    alphaValue = int(random(10, 100));
     
    fill(redValue, greenValue, blueValue, alphaValue);
    noStroke();
  }
  
}
