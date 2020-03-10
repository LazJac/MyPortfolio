package FileSystem;
/**
 * Write a description of class FileClass here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import java.util.ArrayList;
import java.util.NoSuchElementException;
import javax.swing.JOptionPane;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;
import java.io.EOFException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.ClassCastException;

public class FileClass<T>
{
    private String path;
    private ObjectInputStream input;
    private ObjectOutputStream output; 
    
    private String current = System.getProperty("user.dir");
    
    public FileClass()  //Improve count
    {
        //String home = System.getProperty("user.home"); 
        //path = home + "\\AppData\\Local\\GCS_app\\";
        
        path = current +  "\\GCS_app\\";  
    }            
    
    
    public T getSerFile(FileName fileName)
    {
        T object = null;  
        boolean fileNotEmpty = openFile(fileName.getName(), true);
        if (fileNotEmpty)
        {
            object = ReadRecords(); 
            CloseFile(true);
            return object;
        }
        
        if (object instanceof Integer)
        {
            return object;
        }
        else
        {
            ArrayList<T> arr = new ArrayList<T>();
            return (T) arr;
        }
    } 
    
    public void setSerFile(FileName fileName, T object)
    { 
        boolean fileNotEmpty = openFile(fileName.getName(), false);
        if (fileNotEmpty)
        {
            AddRecords(object);
            CloseFile(false);
        }
    }            
    
    
    private boolean openFile(String fileName, boolean isLoading)
    {      
        boolean test = true;
        try
        {
            if (isLoading == true)
            {
                input = new ObjectInputStream(Files.newInputStream(Paths.get(path + fileName)));
            }
            else
            {
                output = new ObjectOutputStream(Files.newOutputStream(Paths.get(path + fileName)));
            }            
        }
        catch (EOFException error)
        {
            test = false;
        }
        catch (IOException error)
        {            
            JOptionPane.showMessageDialog(null,"GCS_app folder is not at the correct place!", "File Not Found", JOptionPane.ERROR_MESSAGE);   
            System.exit(1);
        }
        return test;
    }
    
    private T ReadRecords()
    {      
        T object = null;
        try
        {
             object = (T) input.readObject();
        }
        catch (ClassNotFoundException | IOException | ClassCastException error)
        {
            JOptionPane.showMessageDialog(null,error.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);   
            System.exit(1);
        }
        return object;
    }
    
    private void AddRecords(T object)
    { 
        try
        {         
            output.writeObject(object);
        }
        catch (NoSuchElementException | IOException error)
        {
            JOptionPane.showMessageDialog(null,error.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);   
            System.exit(1);;
        }                              
    }    
    
    private void CloseFile(boolean isLoading)
    {
        try
        {
            if (isLoading)
            {
                if (input != null)
                {
                    input.close();
                }
            }
            else
            {
                if (output != null)
                {
                    output.close();
                }
            }
        }
        catch (IOException error)
        {
            JOptionPane.showMessageDialog(null,error.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);   
            System.exit(1);
        }
    }
}
