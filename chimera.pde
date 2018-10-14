import java.util.Map;
import processing.video.*;

int sampleRate = 44100;

//TODO: make a note class and associate buttons with notes
//Map<String, Note> keyMap = new Map<String, Note>();
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<Button> keys = new ArrayList<Button>();
Button octaveButton = new Button(0, 0, 2, width / 3, 100, color(255), color(0), "Octave");
Button sourceButton = new Button(width / 3 + 1, 0, 2, width / 3, 100, color(255), color(0), "Source");
OctaveButton octaveUp = new OctaveButton(0, 0, 2, width / 6 - 1, 100, color(255), color(0), false);
OctaveButton octaveDown = new OctaveButton(width / 6, 0, 2, width / 6 - 1, 100, color(255), color(0), true);

HilbertCurve curve;

int[] blackKeyIndices = {1, 3, 6, 8, 10};

int octave = 4;

Capture cam;

void setup() {
  fullScreen();
  orientation(LANDSCAPE);
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }   
  
  for (int i = 0; i < 13; i++) {
    color activeColor;
    color inactiveColor;
    Boolean blackKey = false;
    int z;
    for (int j = 0; j < blackKeyIndices.length; j++) {
      if (blackKeyIndices[j] == i) {
        blackKey = true;
      }
    } 
    if (blackKey) {
      activeColor = color(128);
      inactiveColor = color(0);
      z = 1;
    } else {
      inactiveColor = color(255);
      activeColor = color(128);
      z = 0;
    }
    keys.add(new Button(
      i * width / 13, 
      100, 
      z, 
      width / 13 - 1, 
      height - 100, 
      activeColor, 
      inactiveColor)
      );
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  background(255);
  for (Button b : buttons) {
    b.draw();
  }
  fill(0, 255, 0);
  textSize(100);
  text(octave, width / 3 + 1, 10);
  image(cam, 0, 0, cam.width, cam.height);
  stroke(0, 255, 0);
  if (curve == null && cam.width > 0 && cam.height > 0) {
    curve = new HilbertCurve(cam.width, cam.height, sampleRate);
  } else if (curve != null) {
    for(int i = 0; i < curve.points.length - 1; i++){
      line(
        curve.points[i].x, 
        curve.points[i].y,
        curve.points[i+1].x,
        curve.points[i+1].y
      );
    }
  }
}

void mousePressed() {
  Button topMostButton = buttons.get(0);
  Boolean buttonHit = false;
  int topMostZ = -1000;
  for (Button b : buttons) {
    int z = b.mousePressed();
    if (z > topMostZ) {
      topMostZ = z;
      topMostButton = b;
      buttonHit = true;
    } 
    if(buttonHit) {
      topMostButton.clickedCallback();
    }
  }
}

void mouseReleased() {
  for (Button key : keys) {
    key.mouseReleased();
  }
}