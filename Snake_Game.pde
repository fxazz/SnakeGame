int grid = 40;
int highScore = 0;
int speed = 12;

boolean dead = true;
boolean loser = false;
boolean pause = false;

PVector food;

Snake snake;

void setup() {
  size(800, 800);
  snake = new Snake();
  food = new PVector();
  generateFood();
  //frameRate(12);
}

void draw() {
  background(0);
  fill(255);
  if(!dead && !pause) {
    if(frameCount % speed == 0) snake.update();
    snake.show();
    snake.eat();
    fill(255, 0, 0);
    
    rect(food.x, food.y, grid, grid);
  
    //println(snake.len);
  } else if(dead) {
    if(loser) {
      //background(0);
      textAlign(CENTER, CENTER);
      textSize(30);
      text("YOU R DEAD, GET REKK KID!!" + "\nHighscore: " + (highScore-1), width/2, height/2);
    } else {
      textAlign(CENTER, CENTER);
      textSize(30);
      text("Snake Game\nClick to start", width/2, height/2);
    }
  }
}

void generateFood() {
  food.x = floor(random(width));
  food.y = floor(random(height));
  food.x = floor(food.x/grid)*grid;
  food.y = floor(food.y/grid)*grid;
}

void mousePressed() {
  if (dead) {
    snake = new Snake();
    generateFood();
    speed = 12;
    dead = false;
  }
}
