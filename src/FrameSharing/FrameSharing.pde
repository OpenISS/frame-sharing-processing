FrameSharingProcessing oFSP;

void setup()
{
  this.oFSP = new FrameSharingProcessing("FrameSharingServer");
}

void draw()
{
  this.oFSP.sendFrame();
}

void exit()
{
  this.oFSP.closeSender();
}
