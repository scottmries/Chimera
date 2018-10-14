class Button {
  int x, y, z, width, height;
  color activeColor, inactiveColor;
  Boolean active = false;
  String text;
  
  Button(int x, int y, int z, int width, int height, color activeColor, color inactiveColor) {
    buttons.add(this);
    this.x = x;
    this.y = y;
    this.z = z;
    this.width = width;
    this.height = height;
    this.activeColor = activeColor;
    this.inactiveColor = inactiveColor;
  }
  
  Button(int x, int y, int z, int width, int height, color activeColor, color inactiveColor, String text) {
    buttons.add(this);
    this.x = x;
    this.y = y;
    this.z = z;
    this.width = width;
    this.height = height;
    this.activeColor = activeColor;
    this.inactiveColor = inactiveColor;
    this.text = text;
  }
  
  void draw() {
    stroke(0);
    if(active) {
      fill(activeColor);
    } else {
      fill(inactiveColor);
    }
    rect(x, y, width, height);
    if(text != null) {
      if(active) {
        fill(inactiveColor);
      } else {
        fill(activeColor);
      }
      textSize(height - 20);
      text(text, x + 10, y + 10);
    }  
  }

  public int mousePressed() {
    // returns its own z-index if the click is within its bounds
    if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
      return z;
    }
    return -1001;
  }
  
  void clickedCallback() {
    active = true;
  }

  public void mouseReleased() {
    // TODO: use touch array to allow polyphony
    active = false;
  }
}