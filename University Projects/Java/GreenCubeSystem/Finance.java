/**
 * Write a description of class Finance here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import FileSystem.FileName;  //Imports ability to use enum 
import FileSystem.AccountData;  //Imports AccountData class 
import java.util.ArrayList;

public class Finance extends StockManagement<AccountData>//Finance uses a AccountData instance of StockManagement<T>, T in the StockManagement class (as well as Listable) will be of Account class
{
    private ArrayList<AccountData> accountList = new ArrayList<AccountData>();  //This ArrayList wil be used in this classes methodes and by the GcsGui class
    
    public Finance()
    {
        super(FileName.FINANCE);  //Set enum to FINANCE, that only file "Account.ser" will be used for this class
        accountList = super.getList();//ArrayList must be set in constructor before any other action can be done, all methodes will use this ArrayList instead of calling the FileClass Arraylist each and every time. 
    }    
    
    public void AddItem(AccountData item)  
    {
        accountList.add(item);
        super.setList(accountList);//Add change to file. This must be done every time a change is made and not just once before exiting application, because there my occur an unexpected shutdown or error in which case the ArrayList will not be saved  
    }
    
    public void RemoveItem(AccountData item) 
    {
        accountList.remove(item);
        super.setList(accountList);  //Adding a change to .ser file
    }
}
