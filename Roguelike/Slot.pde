class Slot {
  int x, y, size;
  Item item = new Item(0);

  Slot(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    fill(#8b7257);
    rect(x, y, size, size);
    item.display(x, y, size);
  }

  void addItem(Item newItem) {
    this.item = newItem;
  }

  void removeItem() {
    this.item = new Item(0);
  }

  boolean isClicked(int mouseX, int mouseY) {
    return mouseX > x && mouseX < x + size && mouseY > y && mouseY < y + size;
  }
}
