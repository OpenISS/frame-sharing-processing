// Trimmed version from: http://stackoverflow.com/questions/14288185/detecting-windows-or-linux
// for Processing
public static class UtilOSDetection
{
    public static String soOS = System.getProperty("os.name").toLowerCase();

    public static boolean isWindows()
    {
        return soOS.contains("win");
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
            || soOS.contains("sunos")
            || soOS.contains("aix");
    }

    public static String getOS()
    {
        return soOS;
    }
}

// EOF
