/**
 * Abstract class StockManagment - write a description of the class here
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import FileSystem.*; //Imports ability to use files, enum and file classes
import java.util.ArrayList;

public abstract class StockManagement<T> implements Listable<T> //StockManagement can be of class UserData, AccountData or StorageData. As StockManagement type is set, Listable's type will also be set to the same type
{
    /**# T = UserData, AccountData or StorageData. */
    
    private final FileName fileName;  //enum
    private FileClass<ArrayList<T>> file = new FileClass<ArrayList<T>>();
    
    public StockManagement(FileName fileName)
    {
        this.fileName = fileName; //To open correct type of file enum of the file type is set
    }    
    
    public ArrayList<T> getList() 
    {
        return file.getSerFile(fileName); //Get the ArrayList in FileClass with all the item info readed by the previous ststment
    }
    
    public void setList(ArrayList<T> arrList)  
    {
        file.setSerFile(fileName, arrList); //Set the ArrayList in FileClass with the given ArrayList
    }                            
}

















