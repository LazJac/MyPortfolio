package FileSystem;
/**
 * Write a description of class StorageData here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import java.io.Serializable;
import java.lang.NullPointerException;

public class StorageData implements Serializable
{    
    private float size;
    private final String name;
    private int sizeType;
    private final int expi, dayOfWeek;
    
    public StorageData(String Name, float Size, int SizeType, int Expi, int DayOfWeek) throws NullPointerException  
    {
        name = Name;
        size = Size;
        sizeType = SizeType;
        expi = Expi;
        dayOfWeek = DayOfWeek;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setSize(float Size)
    {
        size = Size;
    }
    
    public float getSize()
    {
        return size;
    }
    
    public void setType(int SizeType)
    {
        sizeType = SizeType;
    }
    
    public int getType()
    {
        return sizeType;
    }    
    
    public int getExpiration()
    {
        return expi;
    }    
    
    public int getDayOfWeek()
    {
        return dayOfWeek;
        //365 dae 'n jaar + 52 dae van elke day(MOn,- sun) elke, maar 53 vir die dag wat die jaar meer begin
        // + As jaar begin op bv. Fri sal die jaar eindig op 'n Sat
    }
}
