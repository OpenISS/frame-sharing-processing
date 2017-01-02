import codeanticode.syphon.*;
import spout.*;

/**
 * A simple wrapper of Shyphon and Spout for Processing on OS X and Windowx.
 * Requires Syphon and Spout libraries present, but imstantiates the right one
 * depending on the underlying OS.
 *
 * TODO: add receiving side
 * TODO: figure our Linux, possibly using gstreamer or some such
 *
 * @author Serguei Mokhov
 * @see FrameSharing main application
 */
public class FrameSharingProcessing
{
  public static final int FRAME_SHARING_UNKNOWN = -1;
  public static final int FRAME_SHARING_SYPHON = 0;
  public static final int FRAME_SHARING_SPOUT = 1;
  
  protected int iFrameEngineType = FRAME_SHARING_UNKNOWN;
  
  protected codeanticode.syphon.SyphonServer oSyphonServer;
  protected spout.Spout oSpoutServer;

  protected PApplet oSketch = null;

  public FrameSharingProcessing(PApplet poSketch)
  {
    this.iFrameEngineType
      = UtilOSDetection.isMac()
      ? FRAME_SHARING_SYPHON
      : UtilOSDetection.isWindows()
        ? FRAME_SHARING_SPOUT 
        : FRAME_SHARING_UNKNOWN;
        
    if(this.iFrameEngineType == FRAME_SHARING_UNKNOWN)
    {
      throw new RuntimeException("No frame sharing middleware support for OS: " + UtilOSDetection.getOS());
    }
    
    this.oSketch = poSketch;
  }

  public FrameSharingProcessing(PApplet poSketch, int piFrameEngineType, String pstrServerName)
  {
    this(poSketch);
    this.iFrameEngineType = piFrameEngineType;
    this.setup(pstrServerName);
  }

  public FrameSharingProcessing(PApplet poSketch, int piFrameEngineType)
  {
    this(poSketch);
    this.iFrameEngineType = piFrameEngineType;
    this.setup(this.getClass().getName());
  }
  
  public FrameSharingProcessing(PApplet poSketch, String pstrServerName)
  {
    this(poSketch);
    this.setup(pstrServerName);
  }

  protected void setup(String pstrServerName)
  {
    switch(this.iFrameEngineType)
    {
      case FRAME_SHARING_SYPHON:
        this.oSyphonServer = new codeanticode.syphon.SyphonServer(this.oSketch, pstrServerName);
        break;
        
      case FRAME_SHARING_SPOUT:
        this.oSpoutServer = new spout.Spout(this.oSketch);
        this.oSpoutServer.createSender(pstrServerName, width, height);
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
        //this.oSpoutServer.closeSender();
        break;
      
      default:
        System.err.println("Should never happen.");
    }
  }
}

// EOF
