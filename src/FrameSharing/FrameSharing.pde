/*
 * A demo processing sketch that selects either Syphon (on OS X) or Spout (on Windows)
 * dynamically depending on the OS to share applications screen.
 *
 * Not all feature of eiher Syphon or Spout are available here, but it is easy to add
 * as needed. More will be added later.
 *
 * @author Serguei Mokhov
 * @see FrameSharingProcessing
 */

FrameSharingProcessing oFSP;

PFont oFont;

void setup()
{
  size(200, 200, P3D);
  oFont = createFont("Arial", 16, true);
  this.oFSP = new FrameSharingProcessing(this, "FrameSharingServer");
}

void draw()
{
  background(255);
  textFont(this.oFont, 16);
  fill(0); 
  text("Hello FrameSharingServer!", 10, 100);
  text("OS: " + UtilOSDetection.getOS(), 10, 120);

  this.oFSP.sendFrame();
}

