import java.util.Set;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.Collections;
import FileSystem.FileName;  //Imports ability to use enum 
import FileSystem.StorageData;  //Imports StorageData class 

public class Management extends StockManagement<StorageData>//Management uses a StorageData instance of StockManagement<T>, T in the StockManagement class (as well as Listable) will be of StorageData class
{
    private ArrayList<StorageData> storageList = new ArrayList<StorageData>();  //This ArrayList wil be used in this classes methodes and by the GcsGui class
    private GcsDataBase[] dataBase;
    
    public Management()
    {
        super(FileName.ITEMS);  //Set enum to ITEMS, that only file "StorageItems.ser" will be used for this class
        storageList = super.getList();//ArrayList must be set in constructor before any other action can be done, all methodes will use this ArrayList instead of calling the FileClass Arraylist each and every time.
    }    
    
    public void AddItem(StorageData item) //Add a stock item to a .ser file and adds a database entry to an exicting GcsDataBase
    {        
        storageList.add(item);  
        super.setList(storageList);//Add change to file. This must be done every time a change is made and not just once before exiting application, because there my occur an unexpected shutdown or error in which case the ArrayList will not be saved  
        addToGcsDataBase(item.getName(), item.getSize(), item.getDayOfWeek()); //Adds the StorageData's name, size and the day of the week the item was added
    }
    
    public void RemoveItem(StorageData item) //Removes a stock item
    {
        storageList.remove(item); //finds the first item that matches the class 'item'
        super.setList(storageList);  //Add chage to .ser file
    }
    
    
    public String[] ListStockItems()  //Return a list of strings containing all the items names with no repeats(one of each item)
    {
        String[] arrString = {""}; //The String[] kan not return as null, because null can't be added to a JList without an error
        int storageListSize = storageList.size(); //Lenght of all stock items 
        
        if (storageListSize > 0)
        {
            boolean notFound;         
            HashSet<String> listString = new HashSet<String>(); //Create a temp list to save the unknown amount of items
            
            for (int k = 0;k < storageListSize;k++)
            {
                String name = storageList.get(k).getName();
                listString.add(name);
            }        
                
            arrString = listString.toArray(new String[listString.size()]);
        }         
        return arrString;
    }
    
    
    public void CreateGcsDataBase()
    {
        int storageListSize = storageList.size();
        if (storageListSize > 0)
        {
            
            String[] itemNames = ListStockItems(); //Reload a new items list incase a brand new item was added since the last time it was used 
            int itemNamesLength = itemNames.length;
            dataBase = new GcsDataBase[itemNamesLength]; //A database for each item
            for (int k = 0;k < itemNamesLength;k++)
            {
                dataBase[k] = new GcsDataBase(itemNames[k]);            
                for (int j = 0;j < storageListSize;j++)
                {                
                    if (itemNames[k].equals(storageList.get(j).getName())) //Adds al the items of the same type into the same database
                    {                    
                        dataBase[k].addRecord(storageList.get(j).getSize(), storageList.get(j).getDayOfWeek());  //adds a record to a database                          
                    }
                }
            }
            
        }        
    } 
    
    private void addToGcsDataBase(String itemName, float size, int dayOfWeek)
    {
        for (int k = 0;k < dataBase.length;k++)
        {
            if(dataBase[k].getItemName() == itemName)
            {
                dataBase[k].addRecord(size, dayOfWeek);
                return;
            }
        }
    } 
    
    public void DisplayGcsDataBase() //TEST
    {
        if (dataBase != null)
        {
            CreateGcsDataBase();
            for (int i = 0;i < 8;i++)
            {
                for (int k = 0;k < dataBase.length;k++) 
                {
                    Float[] arr = dataBase[k].FindRecord(i);
                    
                    for (int j = 0;j < arr.length;j++)
                    {
                        System.out.println(arr[j] + "   " + dataBase[k].getItemName() + "   Day: " + i);
                    }                    
                }
            }  
        }
        else
        {
            System.out.print("NULL");
        }
    }    
}













