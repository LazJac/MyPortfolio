package FileSystem;
/**
 * Enumeration class FileName - write a description of the enum class here
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
public enum FileName
{
    COUNT ("Count.ser"),
    CODE ("AdminCode.ser"),
    YEAR ("DayOfYear.ser"),
    SETTINGS ("Settings.ser"),
    PASSWORD ("Passwords.ser"),
    FINANCE ("Account.ser"),
    ITEMS ("StorageItems.ser");
    
    private final String name;
    
    FileName(String Name)
    {
        name = Name;
    }    
    
    public String getName()
    {
        return name;
    }
}

