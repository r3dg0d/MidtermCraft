/*
println("IF IT AIN'T BROKE...")
println("DON'T FIX IT.")
println("\n");
println("LAW ONE OF CODE.");

println("IF IT HARMS HUMANS, DON'T CODE IT.");
println("LAW TWO OF CODE.");

println("ADVANCEMENTS ARE NECESSARY.");
println("LAW THREE OF CODE.");
*/

// block size in pixels
int blockSize = 50;

// 2D array to represent the world
int[][] world = new int[20][20];

// position of the tree in the world
int treeX, treeY;

// position of the player in the world
float playerX, playerY;

void setup() {
  // set the window size and text alignment
  size(800, 600);
  textAlign(CENTER, CENTER);
  textSize(36);

  // display the splash screen
  background(255);
  fill(0);
  text("Midterm Craft", width/2, height/2);

  // wait for 5 seconds
  delay(5000);

  // create the world
  background(200, 200, 200);
  for (int i = 0; i < world.length; i++) {
    for (int j = 0; j < world[i].length; j++) {
      // initialize all blocks to air (0)
      world[i][j] = 0;
    }
  }
  for (int i = 0; i < world.length; i++) {
    // set the bottom row of blocks to ground (1)
    world[i][world[0].length-1] = 1;
  }
  // randomly place a tree (2) in the world
  treeX = (int)random(0, world.length);
  treeY = (int)random(0, world[0].length-1);
  world[treeX][treeY] = 2;

  // set the initial position of the player
  playerX = world.length/2;
  playerY = world[0].length/2;
}

void draw() {
  // clear the screen
  background(200, 200, 200);

  // center the view on the player
  translate(width/2, height/2);
  translate(-blockSize * playerX, -blockSize * playerY);

  // draw the world
  for (int i = 0; i < world.length; i++) {
    for (int j = 0; j < world[i].length; j++) {
      pushMatrix();
      translate(i * blockSize, j * blockSize);
      drawBlock(world[i][j]);
      popMatrix();
    }
  }
}

void keyPressed() {
  // move the player based on the WASD keys
  if (key == 'w') {
    playerY -= 1;
  }
  if (key == 's') {
    playerY += 1;
  }
  if (key == 'd') {
    playerX += 1;
  }
  if (key == 'a') {
    playerX -= 1;
  }
}

void drawBlock(int blockType) {
  // set the color of the block to white
  fill(255);

  // change the color of the block based on the mouse position
  fill(map(mouseX, 0, width, 0, 255), map(mouseY, 0, height, 0, 255), 255);

  // draw the block
  rect(0, 0, blockSize, blockSize);
}
