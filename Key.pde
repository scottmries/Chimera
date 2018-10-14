class Key extends Button {
  float pitch;
  
  Key (int x, int y, int z, int width, int height, color activeColor, color inactiveColor, float pitch) {
    super(x, y, z, width, height, activeColor, inactiveColor);
    this.pitch = pitch;
  }
  
  void clickedCallback() {
    this.active = true;
    synth.setFreq(pitch);
    synth.play();
  }
  
  void mouseReleased() {
    this.active = false;
    synth.stop();
  }
}