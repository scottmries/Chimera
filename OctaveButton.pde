class OctaveButton extends Button {
  Boolean increments;
  
  OctaveButton(int x, int y, int z, int width, int height, color activeColor, color inactiveColor, Boolean increments) {
    super(x, y, z, width, height, activeColor, inactiveColor);
    this.increments = increments;
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
      String text = "up";
      if(!increments) {
        text = "down";
      }
      text(text, x + 10, y + 10);
    }  
  }
  
  void clickCallback() {
    if(increments) {
      if(octave < 8) {
        octave++;
      }
    } else {
      if(octave > 0) {
        octave--;
      }
    }
  }
}