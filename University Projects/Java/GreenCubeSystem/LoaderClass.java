/**
 * Write a description of class LoaderClass here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import FileSystem.FileName; //Import ability to use enum
import FileSystem.FileClass; //Imports ability to use files
import javax.swing.JFrame;

public class LoaderClass /**# First class to run */
{
    public static void main(String[] args) /** Its methode creates the WelcomeGUI or FirstLoginGUI form */
    {
        System.out.print("\f");
        
        GcsGui gui = new GcsGui();
        FileClass file = new FileClass();  //Class that reads/writes to serialized files                    
        int count = (int)file.getSerFile(FileName.COUNT);
        
        if (count == 0) //Read file, if count = 0 (if it is the first time the application is launch)
        {
            gui.LoginGUI(1);  //Create a FirstLoginGUI form
            gui.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); //Close frame but don't stop appilcation
            gui.setSize(800, 600); 
        }
        else
        {
            gui.LoginGUI(0);  //Create a LoginForm
            gui.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            gui.setSize(1280,720);  //Minimum average screen size            
        }  
        gui.setLocationRelativeTo(null);  //Centers form
        gui.setVisible(true);
    }    
}
