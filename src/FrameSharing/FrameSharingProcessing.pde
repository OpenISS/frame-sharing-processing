import codeanticode.syphon.*;

/**
 * A simple wrapper of Shyphon and Spout for Processing on OS X and Windowx.
 * Requires Syphon and Spout libraries present, but imstantiates the right one
 * depending on the underlying OS.
 * TODO: figure our Linux, possibly using gstreamer or some such
 *
 * @author Serguei Mokhov
 * @see FrameSharing main application
 */
public class FrameSharingProcessing
{
  public static final int FRAME_SHARING_SYPHON = 0;
  public static final int FRAME_SHARING_SPOUT = 1;
  
  int iFrameEngineType;
  
  codeanticode.syphon.SyphonServer oSyphonServer;
  Spout oSpoutServer;
  
  public FrameSharingProcessing(String pstrServerName)
  {
    switch(this.iFrameEngineType)
    {
      case FRAME_SHARING_SYPHON:
        this.oSyphonServer = new SyphonServer(this, pstrServerName);
        break;
        
      case FRAME_SHARING_SPOUT:
        this.oSpoutServer = new Spout();
        oSpoutServer.initSender(pstrServerName, width, height);
        break;
      
      default:
        System.err.println("Should never happen.");
    }
  }

  public void sendFrame()
  {
    switch(this.iFrameEngineType)
    {
      case FRAME_SHARING_SYPHON:
        this.oSyphonServer.sendScreen();
        break;
        
      case FRAME_SHARING_SPOUT:
        this.oSpoutServer.sendTexture();
        break;
      
      default:
        System.err.println("Should never happen.");
    }
  }
  
  public void closeSender()
  {
    switch(this.iFrameEngineType)
    {
      case FRAME_SHARING_SYPHON:
        break;
        
      case FRAME_SHARING_SPOUT:
        this.oSpoutServer.closeSender();
        break;
      
      default:
        System.err.println("Should never happen.");
    }
  }
}

// EOF
