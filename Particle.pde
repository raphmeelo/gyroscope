// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  PImage img;
  
  float r = 6;
  boolean highlight;

  Particle(float x, float y) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
    location = new PVector(x, y);
    lifespan = 255.0; 
    img = loadImage("red_orbit.png");
  }

  void run() {
    update();
    display();
  }

 // void intersects(ArrayList<Particle> particles) {
   // highlight = false;
    //for (Particle other : particles) {
      //if (other != this) {
        //float d = PVector.dist(other.location, location);
        //if (d < r + other.r) {
          //highlight = true;
        //}
      //}
    //}
  //}
  
  void applyForce(PVector f) {
    acceleration.add(f); 
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 1;
  }

  // Method to display
  void display() {
    imageMode(CENTER);
    tint(255,lifespan);
    image(img,location.x, location.y);
    //stroke(0, lifespan);
    //strokeWeight(2);
    //fill(127, lifespan);
    //if (highlight) {
      //fill(127,0,0);
    //}
    //ellipse(location.x, location.y, r*2, r*2);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

