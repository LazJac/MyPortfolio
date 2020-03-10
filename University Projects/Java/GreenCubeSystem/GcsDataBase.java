/**
 * Write a description of class GcsDataBase here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import java.util.ArrayList;

public class GcsDataBase
{
    private final String itemName;
    /**# Items will be grouped onto other items made in the same day of te week, on any date */
    private ArrayList<Float> sunday = new ArrayList<Float>();
    private ArrayList<Float> monday = new ArrayList<Float>();
    private ArrayList<Float> tuesday = new ArrayList<Float>();
    private ArrayList<Float> wednesday = new ArrayList<Float>();
    private ArrayList<Float> thursday = new ArrayList<Float>();
    private ArrayList<Float> friday = new ArrayList<Float>();
    private ArrayList<Float> saturday = new ArrayList<Float>();

    public GcsDataBase(String ItemName)
    {
        itemName = ItemName;
    }
    
    public String getItemName()
    {
        return itemName;
    }
    
    public void addRecord(float size, int dayOfWeek) //Adds a item of a matching ItemName to a specific day of the week  
    {                  
        switch (dayOfWeek)
        {
            case 1:  /** Sunday */
            {
                sunday.add(size);
                break;
            }
            case 2:
            {
                monday.add(size);
                break;
            }
            case 3:
            {
                tuesday.add(size);
                break;
            }
            case 4:
            {
                wednesday.add(size);
                break;
            }
            case 5:
            {
                thursday.add(size);
                break;
            }
            case 6:
            {
                friday.add(size);
                break;
            }
            case 7:  /** Saterday */
            {
                saturday.add(size);
                break;
            }
        }
    }
    
    public Float[] FindRecord(int dayOfWeek) //Return a group of items made in a specific day of the week  
    {
        ArrayList<Float> temp = new ArrayList<Float>();
        switch (dayOfWeek)
        {
            case 1:  /** Sunday */
            {
                temp = sunday;                                
                break;
            }
            case 2:
            {
                temp = monday;
                break;
            }
            case 3:
            {
                temp = tuesday;
                break;
            }
            case 4:
            {
                temp = wednesday;
                break;
            }
            case 5:
            {
                temp = thursday;
                break;
            }
            case 6:
            {
                temp = friday;
                break;
            }
            case 7:  /** Saterday */
            {
                temp = saturday;
                break;
            }
        }
        return temp.toArray(new Float[temp.size()]);
    }
}

















