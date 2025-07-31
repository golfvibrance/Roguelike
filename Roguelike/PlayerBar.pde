class PlayerBar {
  int x, y, w, h;
  
  PlayerBar() {
    x = 0;
    y = 615;
    w = 600;
    h = 80;
  }//PlayerBar
  
  PlayerBar(int bx, int by, int bw, int bh) {
    x = bx;
    y = by;
    w = bw;
    h = bh;
  }//PlayerBar
  
  void display() {
    fill(#9EC5E5);
    stroke(0);
    strokeWeight(10);
    rect(x, y, w, h, 16);
    textSize(30);
    fill(0);
    textAlign(CENTER, LEFT);
    if (HP <= 0) {
      dead = true;
      skull.resize(30, 30);
      image(skull, x+240, y+10);
      text("YOU ARE DEAD", x+125, y+40);
      text("GAME OVER", x+370, y+40);
    }
    else {
      text("PLAYER STATS", x+112, y+40);
    }
      text("HP: " + HP + "/" + MAX_HP, x+83, y+70);
      text("DEF: " + DEF, x+210, y+70); 
      text("ATK: " + ATK, x+335, y+70); 
      text("GOLD: " + GOLD, x+470, y+70); 
      drawEnergy(370,535,25);
  }//display
  
  void drawEnergy(float x, float y, float size) {
    ellipseMode(RADIUS);
    fill(#5D5ABF);
    ellipse(x,y,size,size);
    fill(255);
    textSize(20);
    text(ENERGY,x,y+10);
  }
  
}//PlayerBar
