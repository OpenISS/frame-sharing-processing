// http://stackoverflow.com/questions/14288185/detecting-windows-or-linux
public class UtilOSDetection
{
    public static String soOS = System.getProperty("os.name").toLowerCase();

    public static boolean isWindows()
    {
        return so.contains("win");
    }

    public static boolean isMac()
    {
        return soOS.contains("mac");
    }

    public static boolean isUnix()
    {
        return
            soOS.contains("nix")
            || soOS.contains("nux")
            || soOS.indexOf("sunos")
            || soOS.indexOf("aix");
    }

    public static String getOS()
    {
        return soOS;
    }
}

// EOF
