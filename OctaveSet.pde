class OctaveSet {
  ArrayList<float[]> octaves = new ArrayList<float[]>();
  
  OctaveSet() {
    float lowestA = 22.5;
    float[] baseOctave = new float[12];
    for(int i = 0; i < baseOctave.length; i++) {
      //octave starts on A, 9 half tones below A
      baseOctave[i] = lowestA * (pow(2, (1 / 12.0) * (i - 9)));
    }
    for(int i = 0; i < maxOctave; i++) {
      float[] thisOctave = new float[12];
      for (int j = 0; j < thisOctave.length; j++) {
        thisOctave[j] = baseOctave[j] * pow(2, (i));
      }
      octaves.add(thisOctave);
    }
  }
}