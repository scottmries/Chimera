class MonoSynth {
  SawOsc osc;
  
  MonoSynth(PApplet p) {
    osc = new SawOsc(p);
    osc.amp(0.1);
  }
  
  void setFreq(float freq) {
    osc.freq(freq);
  }
  
  void play() {
    osc.play();
  }
  
  void stop() {
    osc.stop();
  }
  
}