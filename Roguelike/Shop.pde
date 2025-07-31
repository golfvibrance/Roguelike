class Shop {
  ShopBox[] boxes;
  int x = 600;
  int y = 105;
  int w = 500;
  int h = 60;
  Shop(int numboxes) {
    boxes = new ShopBox[numboxes];
  }//Guide
  
  void display() {
    fill(255);
    strokeWeight(10);
    setupBox();
    showBox();
  }//display
  
  void setupBox() {
    for (int i = 0; i < boxes.length; i++) { 
      boxes[i] = new ShopBox(x, y+(h*i), w, h, i);
    }
  }//setupBox
  
  void showBox() {
    for (int i = 0; i < boxes.length; i++) { 
      determineCost(boxes[i]);
      boxes[i].displayBox();
    }
  }//showBox
  
  void determineCost(ShopBox box) {
    int price = 0;
    switch (box.type) {
      case 0:
        if (HPUPGRADE != MAXHPUPGRADE) {
          price = 50;
        }
        break;
      case 1:
        if (ATKUPGRADE != MAXATKUPGRADE) {
          price = 60;
        }
        break;
      case 2:
        if (DEFUPGRADE != MAXDEFUPGRADE) {
          price = 60;
        }
        break; 
      case 3:
        price = 15;
        break;
      case 4:
        price = 10;
        break;
      case 5:
        price = 10;
        break;
      case 6:
        price = 25;
        break;
      case 7:
        price = 15;
        break;
      case 8:
        price = 15;
        break;   
      case 9:
        price = 30;
        break; 
    }
    box.cost = price;
  }//determineCost
  
  boolean inZone() {
    if (mouseX >= x && mouseX <= x + (w * 10) && mouseY >= y && mouseY <= y + (h * 10)) {
      return true;
    }
    else {
      return false;
    }
  }//inZone
  
  int returnZone() {
    int zone;
    if (mouseY != y) {//to prevent divide by 0 error
      zone = (mouseY - y) / h;
    }
    else {
      return 0;
    }
    return zone;
  }//returnZone
  
  void buyItem() {
    if (inZone() && boxes[returnZone()].cost <= GOLD) {
      int zone = returnZone();
      switch (zone) {
        case 0:
          if (HPUPGRADE != MAXHPUPGRADE) {
            MAX_HP += 10;
            HP += 10;
            HPUPGRADE++;
            GOLD -= boxes[zone].cost;
          }
          break;
        case 1:
          if (ATKUPGRADE != MAXATKUPGRADE) {
            ATK++;
            ATKUPGRADE++;
            GOLD -= boxes[zone].cost;
          }
          break;
        case 2:
          if (DEFUPGRADE != MAXDEFUPGRADE) {
            DEF++;
            DEFUPGRADE++;
            GOLD -= boxes[zone].cost;
          }
          break;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          if (backpack.hasInventorySpace()) {
            switch (zone) {
              case 3:
                backpack.addItem(new Item(1));
                break;
              case 4:
                backpack.addItem(new Item(2));
                break;
              case 5:
                backpack.addItem(new Item(3));
                break;
              case 6:
                backpack.addItem(new Item(4));
                break;
              case 7:
                backpack.addItem(new Item(5));
                break;
              case 8:
                backpack.addItem(new Item(6));
                break;
              case 9:
                backpack.addItem(new Item(7));
                break;
            }
            GOLD -= boxes[zone].cost;
          }
          break;
      }
    }
  }//buyItem
  
}//Shop
