class Button {
  int x, y, w, h;
  int BUTTON_ID;
  
  Button(int bx, int by, int ID) {
    x = bx;
    y = by;
    w = 150;
    h = 40;
    BUTTON_ID = ID;
  }//constructor
  
  Button(int bx, int by, int s, int ID) {
    x = bx;
    y = by;
    w = s;
    h = s;
    BUTTON_ID = ID;
  }//constructor
  
  
  Button(int bx, int by, int bw, int bh, int ID) {
    x = bx;
    y = by;
    w = bw;
    h = bh;
    BUTTON_ID = ID;
  }//constructor
  
  void display() {
    strokeWeight(10);
    fill(#9EA2E5);
    rect(x,y,w,h);
    textAlign(CENTER, LEFT);
    textSize(25);
    fill(0);
    switch (BUTTON_ID) {
      case 1:
        text("ATTACK", x+75, y+30);
        break;
      case 2:
        text("DEFEND", x+75, y+30);
        drawShield(x+75, y-55, 45);
        break;
      case 3:
        if (ENERGY == 0) {
          fill(255,0,0);
        }
        text("END TURN", x+75, y+30);
        break;
      case 4:
        textSize(20);
        text("GUIDE", x+37, y+40);
        break;
      case 5:
        textSize(20);
        bp.resize(80, 80);
        image(bp, x, y);
        break;
      case 6:
        textSize(20);
        text("SHOP", x+37, y+40);
        break;
    }
  }
  
  void function() {
    if (!win && !dead) {
    switch (BUTTON_ID) {
      case 1:
      if (ENERGY != 0) {
        if (fightingboss) {
          boss.hp -= round(ATK*(isDefending ? 0.75 : 1));
        }
        else {
          enemy.hp -= round(ATK*(isDefending ? 0.75 : 1));
        }
        ENERGY--;
      }
        break;
      case 2:
      if (ENERGY != 0) {
        CURRENTDEF += round(DEF*(defenseboost ? 2 : 1));
        ENERGY--;
      }
        break;
      case 3:
        ENERGY = MAX_ENERGY;
        if (!fightingboss) {
          enemy.calculatedmg(plannedattack);
          enemy.applydmg();
          enemy.applymisc();
          CURRENTDEF = 0;
          defenseboost = false;
          plannedattack = enemy.chooseattack();
        }
        else if (fightingboss) {
          boss.doublestrike(plannedattack0, plannedattack1);
          boss.applydmg();
          boss.applymisc();
          CURRENTDEF = 0;
          defenseboost = false;
          plannedattack0 = boss.chooseattack();
          plannedattack1 = boss.chooseattack();
        }
        break;
      case 4:
        CURRENT_MENU = 0;
        break;
      case 5:
        CURRENT_MENU = 1;
        break;
      case 6:
        CURRENT_MENU = 2;
        break;
      }
    }
  }//function
  
  void drawShield(float x, float y, float size) {
    float w = size;
    float h = size*1.2;
    strokeWeight(5);
    fill(200);
    beginShape();
    vertex(x-w/2, y-h/4); 
    vertex(x+w/2, y-h/4); 
    vertex(x+w/3, y+h/2); 
    vertex(x, y+h/1.2);
    vertex(x-w/3, y+h/2); 
    endShape(CLOSE);
    beginShape();
    vertex(x-w/3, y-h/6); 
    vertex(x+w/3, y-h/6); 
    vertex(x+w/6, y+h/3);
    vertex(x, y+h/1.5); 
    vertex(x-w/6, y+h/3); 
    endShape(CLOSE);
    textAlign(CENTER);
    fill(255);
    text(CURRENTDEF, x, y+h/3);
  }//drawShield
  
  boolean mouseIsOver() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
  
}//Button
