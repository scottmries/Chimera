class HilbertCamInterface {
  Capture cam;
  HilbertCurve curve;
  int valuesToReturn = 10;
  float[] returnValues;
  
  HilbertCamInterface(Capture cam, HilbertCurve curve) {
    println(cam);
    this.cam = cam;
    this.curve = curve;
    returnValues = new float[valuesToReturn];
  }
  
  void implement() {
    if(cam.available()) {
      cam.read();
    }
    cam.loadPixels();
    int interval = floor(curve.points.length / valuesToReturn);
    println(interval);
    println("curve points: " + curve.points.length);
    for(int i = 0; i < valuesToReturn; i++) {
      println(i);
      HilbertPoint p = curve.points[i * interval];
      println(p.x + " " + p.y);
      color c = cam.pixels[p.x + (cam.width - 1) * p.y];
      float value = map(red(c) + green(c) + blue(c), 0, 255 * 3, 0, 1);
      returnValues[i] = value;
    }
    println(returnValues);
  }
}