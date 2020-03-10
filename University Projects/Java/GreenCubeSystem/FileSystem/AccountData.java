package FileSystem;
/**
 * Write a description of class AccountData here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import java.io.Serializable;
import java.lang.NullPointerException;

public class AccountData implements Serializable
{
    private final double capital;
    private final double profit;
    private final double expens;
    public AccountData(double Capital, double Profit, double Expens) throws NullPointerException
    {
        capital = Capital;
        profit = Profit;
        expens = Expens;
    }
    
    public double getCapital()
    {
        return capital;
    }
    
    public double getProfit()
    {
        return profit;
    }
    
    public double getExpens()
    {
        return expens;
    }
}
