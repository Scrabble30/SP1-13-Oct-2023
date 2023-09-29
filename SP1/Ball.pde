class Ball {

  // Declare instance variables
  boolean colliding;
  PVector pos;
  PVector vel;
  float radius;

  Ball(float x, float y, float radius) {
    pos = new PVector(x, y);
    vel = new PVector();
    this.radius = radius;
  }

  void update() {
    updatePosition();
    show();
  }

  void updatePosition() {
    pos.add(vel);

    // Check for wall collision and reflect the velocity if the ball is colliding with any of the four walls
    if (pos.x <= radius || pos.x >= width-radius)
      vel.x = -vel.x;
    if (pos.y <= radius || pos.y >= height-radius)
      vel.y = -vel.y;

    // Constrain the position to never be outside the valid bounds of the window
    pos.set(constrain(pos.x, radius, width-radius), constrain(pos.y, radius, height-radius));
  }

  void show() {
    // Set the color depending on the colliding variable
    if (colliding) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }

    // Draw a circle representing the ball
    circle(pos.x, pos.y, radius*2);
  }

  // Check if the current ball is colliding with another ball
  boolean isColliding(Ball other) {
    // a^2 + b^2 = c^2
    // If the total distance between the center of the balls are less than the sum of their radii
    return sq(pos.x-other.pos.x)+sq(pos.y-other.pos.y) <= sq(radius+other.radius);
  }
}
