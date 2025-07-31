class Inventory {
  ArrayList<Slot> slots = new ArrayList<Slot>();

  Inventory() {
  }//Inventory

  void display(int x, int y, int s, int c) {
    if (!isFrozen) {
      fill(#5a5a5a);
    }
    else {
      fill(#A5F2F3);
    }
    strokeWeight(10);
    rect(x, y-70, 495, 590);
    line(x, y, width, y);
    fill(0);
    textSize(40);
    textAlign(CENTER,LEFT);
    textSize(40);
    text("INVENTORY" + ((isFrozen) ? " (FROZEN)" : ""), x+250, y-20);
    int initialX = x;
    if (slots.isEmpty()) { 
      for (int i = 0; i < c; i++) {
        if (x + s > width) {
          x = initialX;
          y += s;
          }
        Slot slot = new Slot(x, y, s);
        slots.add(slot);
        x += s;
        }
      }
    for (Slot slot : slots) {
      slot.display();
    }
  }//display

  void addItem(Item newItem) {
    for (Slot slot : slots) {
      if (slot.item.ITEM_ID == 0) { // Check if slot is empty
        slot.addItem(newItem);
        break;
      }
    }
  }//addItem

  void useItem(int slotIndex) {
    if (slotIndex >= 0 && slotIndex < slots.size()) {
      Slot slot = slots.get(slotIndex);
      if (slot.item.ITEM_ID != 0) {
        slot.item.use();
        slot.removeItem();
        shiftItemsUp(slotIndex);
      }
    }
  }//useItem

  void shiftItemsUp(int emptySlotIndex) {
    for (int i = emptySlotIndex; i < slots.size()-1; i++) {
      slots.get(i).addItem(slots.get(i+1).item);
      slots.get(i+1).removeItem();
    }
  }//shiftItemsUp

  int getSlotIndex(int mouseX, int mouseY) {
    for (int i = 0; i < slots.size(); i++) {
      if (slots.get(i).isClicked(mouseX, mouseY)) {
        return i;
      }
    }
    return -1;
  }//getSlotIndex
  
  boolean hasInventorySpace() {
    for (Slot slot : slots) {
      if (slot.item.ITEM_ID == 0) {
        return true; 
      }
    }
    return false; 
  }//hasInventorySpace
  
}//Inventory
