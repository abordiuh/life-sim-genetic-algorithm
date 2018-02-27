// Particles, by Daniel Shiffman.

EnvMap emap = new EnvMap(100, 64);

void setup() {
  size(1024, 768);
  orientation(LANDSCAPE);

  noStroke();
  emap.placeEntitiesRandomly(200);
  emap.placeResourcesRandomly(100);
  hint(DISABLE_DEPTH_MASK);
} 

void draw () {
  background(255);

  emap.DrawEnvMap(); 
  emap.executeEntitiesActions(); //<>//
  emap.placeResourcesRandomly(100);

  fill(0);
  textSize(16);
  text("Frame rate: " + int(frameRate), 10, 20);
}

void drawGrid ()
{
}