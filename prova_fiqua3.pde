// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
//variabile raggio e angolo
float r = 150;
float a = 0.0;
float aVel = 0.00;
float aAcc = 0.001;
ParticleSystem ps;

void setup() {
  size(640,360,P3D);
  //blendMode(ADD);
  frameRate(120);
  ps = new ParticleSystem(new PVector());
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  //rotazione non def
  rotateX(PI/3);
  float x = r*cos(a);
  float y = r*sin(a);
  
 
  ps.addParticle(x,y);
  ps.update();
  ps.intersection();
  ps.display();
  a += aVel;
  aVel += aAcc;
  
  aVel = constrain(aVel,0,0.02);
}
