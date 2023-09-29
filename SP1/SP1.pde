// Initialize array
ArrayList<Ball> balls = new ArrayList();

void setup() {
  size(400, 300);

  // Create 15 balls with a random radius, position and velocity
  for (int i = 0; i < 15; i++) {
    float radius = random(10, 30);
    float x = random(radius, width-radius);
    float y = random(radius, height-radius);

    // Create ball
    Ball ball = new Ball(x, y, radius);
    // Get a random2D vector and save it to the ball velocity variable
    PVector.random2D(ball.vel);

    // Add the newly created ball to the list
    balls.add(ball);
  }
}

void draw() {
  background(30);

  // Loop over every ball in the last
  for (Ball ball : balls) {
    // Reset the colliding variable
    ball.colliding = false;

    // Loop over every other ball and check for collision
    for (Ball other : balls) {
      if (ball != other && ball.isColliding(other)) {
        // If colliding, set the colliding variable and break out of the loop early
        ball.colliding = true;
        break;
      }
    }

    // Update the ball
    ball.update();
  }
}
