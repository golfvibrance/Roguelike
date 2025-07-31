class Item {
  int ITEM_ID;
  PImage itemphoto;

  Item(int ID) {
    this.ITEM_ID = ID;
    itemphoto = getItemImage(ITEM_ID);
  }

  void use() {
    switch (ITEM_ID) {
      case 1:
        HP = min(HP+10, MAX_HP);
        break;
      case 2:
        poisondmg = max(poisondmg-2, 0);
        break;
      case 3:
        firedmg = max(firedmg-3, 0);
        break;
      case 4:
        ENERGY += 1;
        break;
      case 5:
        if (isDefending) {
          isDefending = false;
        }
        break;
      case 6:
        if (isWeakened) {
          isWeakened = false;
        }
        break;
      case 7:
        defenseboost = true;
        break;
    }
  }//use

  PImage getItemImage(int ID) {
    switch (ID) {
      case 1: 
        return potion;
      case 2: 
        return antivenom;
      case 3: 
        return nitrogen;
      case 4: 
        return adren;
      case 5: 
        return sbreak;
      case 6: 
        return strength;
      case 7: 
        return divine;
      default: 
        return null;
    }
  }//getItemImage

  void display(int x, int y, int size) {
    if (itemphoto != null) {
      image(itemphoto, x+5, y+5, size-10, size-10);
    }
  }//display
  
}//Item
