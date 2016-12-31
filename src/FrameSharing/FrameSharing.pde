FrameSharingProcessing oFSP;

PFont oFont;

void setup()
{
  size(200, 200, P3D);
  oFont = createFont("Arial", 16, true);
  //this.oFSP = new FrameSharingProcessing("FrameSharingServer");
}

void draw()
{
  background(255);
  textFont(this.oFont, 16);
  fill(0); 
  text("Hello Strings!", 10, 100);
  text("OS: " + UtilOSDetection.getOS(), 10, 120);

  //this.oFSP.sendFrame();
}

void exit()
{
  //this.oFSP.closeSender();
}

