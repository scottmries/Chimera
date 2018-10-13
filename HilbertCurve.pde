class HilbertCurve {
  int iterations;
  int pointsPerSide;
  HilbertPoint[] points;
  
  float xOffset;
  float yOffset;
  
  float scale;
  
  HilbertCurve(int totalWidth, int totalHeight, int maxPoints) {
    int maxHorizontalPowerOfTwo = 0;
    int maxVerticalPowerOfTwo = 0;
    float widthQuotient = totalWidth;
    float heightQuotient = totalHeight;
    while(widthQuotient > 2) {
      maxHorizontalPowerOfTwo++;
      widthQuotient /= 2.0;
    }
    while(heightQuotient > 2) {
      maxVerticalPowerOfTwo++;
      heightQuotient /= 2.0;
    }
    iterations = min(min(maxVerticalPowerOfTwo, maxHorizontalPowerOfTwo), floor(pow(floor(pow(maxPoints, 1 / 2.0)), 1 / 2.0)) + 1);
    println("iterations: " + iterations);
    pointsPerSide = int(pow(2, iterations));
    scale = min(totalWidth / float(pointsPerSide), totalHeight / float(pointsPerSide));
    println("scale " + scale);
    points = new HilbertPoint[pointsPerSide * pointsPerSide];
    xOffset = scale * (totalWidth / scale - pointsPerSide) / 2;
    yOffset = scale * (totalHeight / scale - pointsPerSide) / 2;
    println("offsets: " + xOffset + " " + yOffset);
    for(int i = 0; i < points.length; i++) {
      points[i] = scale(findHilbertPoint(i), scale);
      points[i].x += xOffset;
      points[i].y += yOffset;
    }
    
  }
  
  int lastTwoBits(int i) {
    return i & 3;
  }
  
  HilbertPoint findHilbertPoint(int index) {
    int[][] positions = {
      {0, 0}, 
      {0, 1}, 
      {1, 1},
      {1, 0}
    };
    
    int[] tmp = positions[lastTwoBits(index)];
    index = index >> 2;
    
    int x = tmp[0];
    int y = tmp[1];
    
    for (int n = 4; n <= pointsPerSide; n *= 2) {
        int n2 = n / 2;
        int swap;
        switch (lastTwoBits(index)) {
        case 0: /* case A: left-bottom */
          swap = x;
          x = y;
          y = swap;
          break;

        case 1: /* case B: left-upper */
            y = y + n2;
            break;

        case 2: /* case C: right-upper */
            x = x + n2;
            y = y + n2;
            break;

        case 3: /* case D: right-bottom */
            swap = y;
            y = (n2 - 1) - x;
            x = (n2 - 1) - swap;
            x = x + n2;
            break;
        }
        
        index = (index >> 2);
    }
    return new HilbertPoint(x, y);
  }
  
  HilbertPoint scale(HilbertPoint point, float scale) {
    return new HilbertPoint(floor(point.x * scale), floor(point.y * scale));
  }
}
