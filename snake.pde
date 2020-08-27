class Snake {
  PVector pos;
  PVector vel;
  ArrayList<PVector> trace;
  int len;
  
  Snake() {
    pos = new PVector((int)random(width)/grid * grid, (int)random(height)/grid * grid);
    
    vel = new PVector();
    trace = new ArrayList<PVector>();
    len = 1;
  }
  
  void update() {
    
    trace.add(pos.copy());
    pos.x += grid * vel.x;
    pos.y += grid * vel.y;
    
    //pos.x = (pos.x+width) % width;
    //pos.y = (pos.y+height)%height;
    
    if(pos.x < 0 || pos.x >= width || pos.y < 0 || pos.y >= height) {
      dead = true;
      loser = true;
      highScore = max (highScore, len);
      println("dead: hit wall");
    }
    
    while(trace.size() > len-1) trace.remove(0);
    for(int i=0; i<trace.size(); i++) {
      PVector p = trace.get(i);
      if(p.x == pos.x && p.y == pos.y) {
       //update();
       dead = true; loser = true;
       highScore = max (highScore, len);
       println("dead: hit his self");
      }
    }
  }
  
  void eat() {
    if(pos.x == food.x && pos.y == food.y) {
      len++; if( len%(speed/4)==0 && speed > 2) speed-=1;
      println("eat:", len-1, "speed is:", 12-speed);
      generateFood();
    }
  }
  
  void show() {
    fill(255, 255, 0);
    rect(pos.x, pos.y, grid, grid); //head
    fill(0, 255, 0);
    for (PVector p : trace) {
      rect(p.x, p.y, grid, grid);
    }
  }
}

void keyPressed() {
  if((keyCode == 'A' || keyCode == LEFT) && snake.len == 1) {
   snake.vel.x = -1;
   snake.vel.y = 0;
 }
  
 if((keyCode == 'A' || keyCode == LEFT) && snake.len == 1) {
   snake.vel.x = -1;
   snake.vel.y = 0;
 } else
 if((keyCode == 'D' || keyCode == RIGHT) && snake.len == 1) {
   snake.vel.x = 1;
   snake.vel.y = 0;
 } else 
 if((keyCode == 'W' || keyCode == UP) && snake.len == 1) {
   snake.vel.x = 0;
   snake.vel.y = -1;
 } else
 if((keyCode == 'S' || keyCode == DOWN) && snake.len == 1) {
   snake.vel.x = 0;
   snake.vel.y = 1;
 }
 
 if((keyCode == 'A' || keyCode == LEFT) && snake.vel.x != 1) {
   snake.vel.x = -1;
   snake.vel.y = 0;
 } else
 if((keyCode == 'D' || keyCode == RIGHT) && snake.vel.x != -1) {
   snake.vel.x = 1;
   snake.vel.y = 0;
 } else 
 if((keyCode == 'W' || keyCode == UP) && snake.vel.y != 1) {
   snake.vel.x = 0;
   snake.vel.y = -1;
 } else
 if((keyCode == 'S' || keyCode == DOWN) && snake.vel.y != -1) {
   snake.vel.x = 0;
   snake.vel.y = 1;
 }
}
