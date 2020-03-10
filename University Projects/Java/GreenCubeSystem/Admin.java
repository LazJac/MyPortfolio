/**
 * Write a description of class Admin here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import FileSystem.FileName;  //Imports ability to use enum 
import FileSystem.UserData;  //Imports UserData class, contains Usernames and Passwords
import java.util.ArrayList;

public class Admin extends StockManagement<UserData>//Admin uses a UserData instance of StockManagement<T>, T in the StockManagement class (as well as Listable) will be of UserData class
{
    private ArrayList<UserData> userList = new ArrayList<UserData>();  //This ArrayList wil be used in this classes methodes and by the GcsGui class
    
    public Admin()
    {
        super(FileName.PASSWORD);  //Set enum to PASSWORD, that only file "Passwords.ser" will be used for this class
        userList = super.getList();  //ArrayList must be set in constructor before any other action can be done, all methodes will use this ArrayList instead of calling the FileClass Arraylist each and every time.
    }                     
    
    public void AddItem(UserData item) //AddItem in this case adds a new User + Password
    {       
        userList.add(item);       
        super.setList(userList);//Add change to file. This must be done every time a change is made and not just once before exiting application, because there my occur an unexpected shutdown or error in which case the ArrayList will not be saved  
    }
    
    public void RemoveItem(UserData item) //RemoveUser in this case removes a particular User + Password
    {
        userList.remove(item);
        super.setList(userList);  //Adding a change to a serilized file
    }
    
    
    public int FindUser(String userName, String password) //(Test to check if a user already exists) or (Test to check if a user exists and there password matches, also send back the user type (Admin, Finance or Management) if username and password matches) 
    {
        int found = 0; 
        for (int k = 0;k < userList.size();k++)
        {       
            if (userList.get(k).getUserName().equals(userName) && userList.get(k).getPassword().equals(password)) //Checks if name and password givven matches
            {
                found = userList.get(k).getUserType();
            }
        }
        return found; //Returns type if needed
    }
    
    public void ReadFile() //Test
    {
        System.out.println("This text is only temp. until the final product is done\n");
        for (int k = 0;k < userList.size();k++)
        {
            System.out.printf("Username: %s  Password: %s Type of user %s\n", userList.get(k).getUserName(), userList.get(k).getPassword(), userList.get(k).getUserType());
        }
        System.out.print("\nFor 'Type of user' :\n1 = Admin\n2 = Finance\n3 = Management");
    }
}
