/**
 * Write a description of interface Listable here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import java.util.ArrayList;

public interface Listable<T> /**# T can be of class UserData, AccountData or StorageData  */
{    
    void setList(ArrayList<T> arrList);  //Sets a new/altered ArrayList into a file of type T
    ArrayList<T> getList(); //Get the ArrayList from a file of type T and puts it into a new ArrayList
    
    void AddItem(T item); //Adds a new item of type T into an ArrayList. Also calls setList methode to add new changes to a file.
    void RemoveItem(T item);  //Removes an existing item of type T from an ArrayList. Also calls setList methode to add new changes to a file.
}
