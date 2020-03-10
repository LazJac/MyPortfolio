package FileSystem;
/**
 * Write a description of class UserData here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import java.io.Serializable;
import java.lang.NullPointerException;

public class UserData implements Serializable
{
    private String password;
    private final int userType;
    private final String userName;        
    
    public UserData(String UserName, String Password, int UserType) throws NullPointerException
    {
        userName = UserName;
        password = Password;
        userType = UserType;
    }     
    
    public void setPassword(String Password)
    {
        password = Password;
    }
    
    public String getPassword()
    {
        return password;
    }
    
    public String getUserName()
    {
        return userName;
    }
    
    public int getUserType()
    {
        return userType;
    }
}