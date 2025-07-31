class ShopBox {
  int x,y,w,h;
  int type;
  int cost;
  
  ShopBox(int _x, int _y, int _w, int _h, int ty) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    type = ty;
  }//ShopBox
  
  
  void displayBox() {
      strokeWeight(10);
      fill(#E5BE9E);
      rect(x, y, w, h);
      fill(0);
      textSize(30);
      textAlign(LEFT);
      switch (type) {
      case 0:
        text("HP UPGRADES", x+10, y+30);
        textSize(15);
        text(HPUPGRADE + " out of " + MAXHPUPGRADE + "        +10 MAX HP", x+10, y+50);
        break;
      case 1:
        text("ATK UPGRADES", x+10, y+30);
        textSize(15);
        text(ATKUPGRADE + " out of " + MAXATKUPGRADE + "       +1 ATK", x+10, y+50);
        break;
      case 2:
        text("DEF UPGRADES", x+10, y+30);
        textSize(15);
        text(DEFUPGRADE + " out of " + MAXDEFUPGRADE + "       +1 DEF", x+10, y+50); 
        break;
      case 3:
        text("Health Potion", x+10, y+30);
        textSize(15);
        text("+10 HP", x+10, y+50);
        break;
      case 4:
        text("Antivenom", x+10, y+30);
        textSize(15);
        text("-2 poison stacks", x+10, y+50);  
        break;
      case 5:
        text("Liquid Nitrogen", x+10, y+30);
        textSize(15);
        text("-3 fire stacks", x+10, y+50);
        break;
      case 6:
        text("Adrenaline", x+10, y+30);
        textSize(15);
        text("+1 energy", x+10, y+50);
        break;
      case 7:
        text("Shieldbreaker", x+10, y+30);
        textSize(15);
        text("negate the effects of defending this turn", x+10, y+50);
        break;
      case 8:
        text("Strength Sigil", x+10, y+30);
        textSize(15);
        text("negate the effects of weak this turn", x+10, y+50);
        break;
      case 9:
        text("Divine Aegis", x+10, y+30);
        textSize(15);
        text("defending is twice as effective this turn", x+10, y+50);
        break;
      }
      textAlign(RIGHT);
      textSize(20);
      if (cost != 0) {
        text(cost + " GOLD", x+470, y+30);
      }
  }//display
  
}//ShopBox
