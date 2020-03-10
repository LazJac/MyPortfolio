/**
 * Write a description of class GcsGui here.
 * 
 * @author  (van Wyk, JJ & van Staden, DA) 
 * @version (25950665    & 25864246)
 */
import FileSystem.*;
import java.io.File;
import java.io.IOException;
import java.util.Random;  
import java.util.Calendar;
import javax.imageio.ImageIO;

import java.awt.Font;
import java.awt.Color;
import java.awt.Insets;
import java.awt.Dimension;
import java.awt.Component;
import java.awt.GridLayout;
import java.awt.BorderLayout;
import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import java.awt.event.MouseEvent; 
import java.awt.event.MouseAdapter;
import java.awt.event.ActionEvent; 
import java.awt.event.ActionListener;

import javax.swing.Box; 
import javax.swing.JMenu;
import javax.swing.JList;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.ImageIcon; 
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JTabbedPane;
import javax.swing.JScrollPane;
import javax.swing.JOptionPane;
import javax.swing.ButtonGroup;
import javax.swing.JRadioButton;
import javax.swing.BorderFactory;
//import javax.swing.JPasswordField;
import javax.swing.ListSelectionModel;

/**# 
 *    ############################################### -- INDEX -- ###############################################
 *    -----------------------------------------------------------------------------------------------------------
 *    Press " CTRL + F " type in the index your looking for and check the checkbox " Match Case " !!!
 *    -----------------------------------------------------------------------------------------------------------
 *    
 *    1.    START           and     VARIABLES
 *    
 *    
 *    2.    GUI_COMPONENTS
 *          > createJPanel(int type, int width, int heigth)
 *          > createJLabel(int type, String text)
 *          > createJTextField()
 *          > createJButton(int type, String text)
 *          > createJRadioButton(int type, String text, boolean setFocusOn)
 *          > createJTextArea(String text, int rows, int colums)
 *    
 *    3.    CONSTRUCTOR     and     WELCOME_GUI
 *          > GcsGui()
 *          > WelcomeGUI()
 *           
 *    4.    LOGIN_GUI
 *          > LoginGUI(int loginType)
 *          > addComponent(Component component, int row, int column, int width, int height)
 *          > class LoginHandler
 *          > class FirstLoginHandler
 *          > class ChangePasswordHandler
 *          
 *    5.    MAIN_GUI
 *          > MainGUI(int tabType)
 *          > class MenuStripHandler
 *          > AdminTAB()
 *          > class AdminHandler
 *          > FinanceTAB()
 *          > class FinanceHandler
 *          > ManagementTAB()
 *          > class ManagementHandler
 *    
 *    6.    TEST_FIELDS
 *          > testTextField(int testType, JTextField field)
 *          > testTextField(int testType, JTextField field, JLabel label, String text)
 *    
 *    
 *    7.    END
 *    
 *    ###########################################################################################################
 */
public class GcsGui extends JFrame
{
    //###########################################################################################################################################################################################################################################
    //##        <<<  START  >>>     <<<  VARIABLES  >>>                                                                                                                                                                                        ##
    //###########################################################################################################################################################################################################################################
    private int num = -1;
    private Random genNum = new Random();    
    private final Color gcsGreen = new Color(204, 228, 169);
    private final Color gcsYellow = new Color(252, 202, 29);
    private Calendar calendar = Calendar.getInstance();
    private String current = System.getProperty("user.dir");  //Will find the Current directory path that the program is placed in; It can be anywhere.
    
    private GridBagLayout formGrid;
    private GridBagConstraints constraints;
    private JTabbedPane tabbedPane; 
    private GridLayout gridLayout, gridLayout2;
    private BorderLayout borderLayout;
    private JList<String> stockJList; 
    private String[] itemName;
    private JTextArea textArea, currentStock; 
    private JPanel panel1, panel2, panel3, panel4; 
    private ButtonGroup radioGroup, radioGroupSize, radioSettings; 
    private JRadioButton radFinance, radManagement, radKilo, radGram, radLiter, radMilli, rad1day, rad2day, rad1week; 
    private JLabel lblConfirm, lblConfirm2, lblConfirm3, lblConfirm4, lblCapital, lblProfit, lblExpens, lblItemName, lblItemSize, lblItemExpi, lblRemainItemName, lblTestRemain, lblTestBuffer, lblSetTest, label1, label2, label3, label4, label5, label6, label7;
    private JTextField userAdmin, passAdmin, passAdmin2, txtfCapital, txtfProfit, txtfExpens, txtfItemName, txtfItemSize, txtfItemExpi, txtfRemainSize, txtfBuffer, textField1;       
    private JButton addUserAdmin, addFinance, btnNewItem, btnRemainSizeBack, btnRemainSizeNext, btnBuffer, btnSet, button1, button2, button3, button4, button5, button6;
    private JMenu fileMenu, exitMenu, minimizeMenu, changeSizeMenu; 
    private JMenuItem logout, exitApp, minimize, screenSize1, screenSize2, screenSize3, screenSize4, screenSize5, screenSize6;
    private JMenuBar bar;    
        
    private final FileClass<Integer> file = new FileClass<Integer>(); 
    private final Admin adminClass = new Admin();
    private final Finance financeClass = new Finance();
    private final Management managementClass = new Management();    
    
    //###########################################################################################################################################################################################################################################
    //##         <<<  GUI_COMPONENTS  >>>     [6 Methodes]  {Doesn't use GCS classes}                                                                                                                         ##
    //###########################################################################################################################################################################################################################################
    
    private JPanel createJPanel(int type, int width, int heigth) //Create a stylized JPanel according to 'type'
    {
        JPanel panel = new JPanel();
        panel.setPreferredSize(new Dimension(width, heigth)); //The size the panel will try to make, but may still be bigger or smaller
        panel.setBackground(Color.WHITE);
        switch (type)
        {
            case 1:
            {
                panel.setBorder(BorderFactory.createEtchedBorder(1)); 
                /** .setBorder will change the GUI block around the JPanel. This also adds a GUI block, since JPanels do not come with a visable border.
                 *    BorderFactory is a class that has a large groep of Borders
                 *    .createEtchedBorder(1) creates a 'etched' Border found in BorderFactory  */ 
                panel.setBackground(new Color(236, 255, 201));
                break;
            }
            case 2:
            {
                panel.setBorder(BorderFactory.createDashedBorder(null));                
                break;
            }
        }  
                
        return panel;
    }
    
    private JLabel createJLabel(int type, String text, int textSize) //Create a stylized JLabel according to 'type'
    {
        JLabel label = new JLabel(text); 
        if (type == 0)
        {
            label.setFont(new Font(Font.MONOSPACED, Font.BOLD, textSize)); 
            /** .setFont changes the look of the Jlabel's text
             *    Font.MONOSPACED = The style of the text
             *    Font.BOLD = Makes text bold
             *    12 = The size of the text  */
        }
        else
        {
            label.setFont(new Font(Font.MONOSPACED, Font.ITALIC, textSize)); //Makes text italic
            label.setForeground(Color.RED); //Makes text color red
        }
        return label;
    }
    
    private JButton createJButton(int type, String text) //Create a stylized JButton according to 'type'
    {
        JButton button = new JButton(text);
        button.setOpaque(false); //Makes JButton see-throw
        button.setContentAreaFilled(false); //Removes the default light blue color of the button(it is actually a image)
        switch (type)
        {
            case 0:
            {
                button.setBorder(BorderFactory.createEtchedBorder(1, Color.gray, gcsGreen)); //new Color (Red, Green, Blue) = create new color
                break;
            }
            case 1:
            {
                button.setMargin(new Insets(8, 20, 8, 20)); //Creates empty space around the button's text
                button.setBorderPainted(false); //Removes Border
                break;
            }
            case 2:
            {
                button.setMargin(new Insets(8, 20, 8, 20));
                break;
            }
        } 
        button.setFont(new Font(Font.SERIF, Font.PLAIN, 16));          
        return button;
    }
    
    private JTextField createJTextField() //Create a stylized JTextField  
    {
        JTextField textField = new JTextField();
        textField.setBorder(BorderFactory.createEtchedBorder(1));
        return textField;
    }
    
    private JRadioButton createJRadioButton(String text, boolean setFocusOn) //Create a stylized JRadioButton   
    {
        JRadioButton rbutton = new JRadioButton(text, setFocusOn);
        try
        {
            rbutton.setIcon(new ImageIcon(ImageIO.read(new File(current + "//Images//radIcon.jpg"))));
            rbutton.setSelectedIcon(new ImageIcon(ImageIO.read(new File(current + "//Images//radIcon2.jpg"))));
        }
        catch (IOException error)
        {
            JOptionPane.showMessageDialog(null,"JRadioButton image not found in 'Image' folder", "Image 'radIcon.jpg' or 'radIcon2.jpg' Not Found", JOptionPane.ERROR_MESSAGE);
        }
        rbutton.setOpaque(false);
        return rbutton;
    }
    
    private JTextArea createJTextArea(String text, int rows, int colums) //Create a stylized JTextArea  
    {
        JTextArea textArea = new JTextArea(text, rows, colums);
        textArea.setFont(new Font(Font.SERIF, Font.PLAIN, 18));
        textArea.setBackground(new Color(250, 255, 250));
        return textArea;
    }
    
    private JMenu createJMenu(int type, String text)
    {
        JMenu menu = new JMenu(text);        
        if (type == 0)
        {
            menu.setEnabled(false);
        }
        else
        {
            menu.setFont(new Font(Font.SERIF, Font.BOLD, 14));
            menu.setForeground(new Color(80, 125, 80));
        }
        return menu;
    }
    
    private JMenuItem createJMenuItem(String text, char mnemonic)
    {
        JMenuItem menuItem = new JMenuItem(text, mnemonic);
        menuItem.setBackground(new Color(252, 202, 29));
        menuItem.setFont(new Font(Font.MONOSPACED, Font.PLAIN, 12));
        return menuItem;
    }    
    
    //###########################################################################################################################################################################################################################################
    //##        <<<  CONSTRUCTOR  >>>  <<<  WELCOME_GUI  >>>     [1 Methodes + Constructor]  {Doesn't use GCS classes}                                                                                                                         ##
    //###########################################################################################################################################################################################################################################
        
    public GcsGui() /**# Only used to create an empty form */ 
    {
        super(); //Create the empty form without title(Title will be set later)       
        setUndecorated(true); //Hides the frame around the for, because it makes the form unmovable, unscalable and buttons to close, max or min form kan be controlled more easally
        //setAlwaysOnTop(true);       // Dalk menuStrip choice?      NB  
    }
    
    public void WelcomeGUI()
    {
        //Will be .gif, set later NB
    }
    
    //###########################################################################################################################################################################################################################################
    //##        <<<  LOGIN_GUI  >>>                        [2 Methodes + 3 Inner Classes]  {Uses GCS class: FileClass<Integer>}                                                                                                                           ##
    //###########################################################################################################################################################################################################################################
    
    public void LoginGUI(int loginType)
    {
        if (loginType == 0) 
        {
            setTitle("Login"); //Although the frame will not show the title that is being set, the title can still be seen on the Windows Toolbar

            adminClass.ReadFile(); //Test
            
            try
            {
                setContentPane(new JLabel(new ImageIcon(ImageIO.read(new File(current + "//Images//login.jpg")))));
                /**# setContentPane changes the body of the JFrame
                 *     The image is placed inside a JLabel that is stricted over the whole JFrame
                 *     ImageIcon reads the image at the given File path  */                 
            }
            catch (IOException error)
            {
                JOptionPane.showMessageDialog(null,"Frame image not found in 'Image' folder", "Image 'login.jpg' Not Found", JOptionPane.ERROR_MESSAGE);
            }
                       
            formGrid = new GridBagLayout();
            setLayout(formGrid);
            constraints = new GridBagConstraints();
            
            JButton button = createJButton(0, "Temp"); // NB
            JButton button4 = createJButton(0, "Temp"); // NB
            
            label1 = createJLabel(0,"User Name :",12); /** Creates a stylized JLabel */
            userAdmin = createJTextField(); 
            label2 = createJLabel(0,"Password :",12);
            passAdmin = createJTextField();
            button1 = createJButton(0,"Login"); /** Creates a stylized JButton */
            try
            {
                button1.setIcon(new ImageIcon(ImageIO.read(new File(current + "//Images//login_icon.jpg"))));
                //button`.setRolloverIcon(new ImageIcon(ImageIO.read(new File(current + "//Images//login_icon.jpg")));
                //button1.setRolloverSelectedIcon(new ImageIcon(ImageIO.read(new File(current + "//Images//login_icon.jpg"))));
            }
            catch (IOException error)
            {
                JOptionPane.showMessageDialog(null,"LoginButton image not found in 'Image' folder", "Image 'login_icon.jpg' or 'radIcon2.jpg' Not Found", JOptionPane.ERROR_MESSAGE);
            }
            button1.setHorizontalTextPosition(JButton.CENTER);
            button1.setVerticalTextPosition(JButton.BOTTOM);
            button2 = createJButton(0,"Change Password");
            button3 = createJButton(0,"Exit");
            
            
            constraints.fill = GridBagConstraints.HORIZONTAL;  //NB
            addComponent(button, 4, 0, 1, 1);
            
            constraints.fill = GridBagConstraints.HORIZONTAL;
            addComponent(label1, 0, 1, 1, 1);
            addComponent(userAdmin, 1, 1, 1, 1);
            addComponent(label2, 2, 1, 1, 1);
            addComponent(passAdmin, 3, 1, 1, 1);
            addComponent(button1, 5, 1, 1, 1);
            addComponent(button2, 6, 1, 1, 1);
            addComponent(button3, 7, 1, 1, 1);
            
            
            LoginHandler handler = new LoginHandler();
            passAdmin.addActionListener(handler);
            button1.addActionListener(handler);
            button3.addActionListener(handler);
        }
        else if (loginType == 1)
        {
            setTitle("First Signin");

            try
            {
                setContentPane(new JLabel(new ImageIcon(ImageIO.read(new File(current + "//Images//first_login.jpg")))));                
            }
            catch (IOException error)
            {
                JOptionPane.showMessageDialog(null,"Frame image not found in 'Image' folder", "Image 'first_login.jpg' Not Found", JOptionPane.ERROR_MESSAGE);
            }
            
            formGrid = new GridBagLayout();
            setLayout(formGrid);
            constraints = new GridBagConstraints();
            
            label1 = createJLabel(0,"User :",12);
            userAdmin = createJTextField(); 
            label2 = createJLabel(1,"",12); /** Creates a empty stylized JLabel, because even if the button has no text when text is added the font and color will stay as you set it here */
            
            label3 = createJLabel(0,"Password :",12);
            passAdmin = createJTextField(); 
            label4 = createJLabel(1,"",12);
            
            label5 = createJLabel(0,"Type Password Again :",12);
            passAdmin2 = createJTextField();
            label6 = createJLabel(1,"",12);
            button1 = createJButton(0,"Confirm");
            
            label7 = createJLabel(1,"",12);
            textField1 = createJTextField();
            textField1.setVisible(false); //Hide the button
            button2 = createJButton(0,"Continue");
            button2.setVisible(false);
            
            
            constraints.fill = GridBagConstraints.HORIZONTAL;
            addComponent(label1, 0, 0, 1, 1);
            addComponent(userAdmin, 1, 0, 1, 1);
            addComponent(label2, 1, 1, 1, 1);
            
            addComponent(label3, 2, 0, 1, 1);
            addComponent(passAdmin, 3, 0, 1, 1);
            addComponent(label4, 3, 1, 1, 1);
            
            addComponent(label5, 4, 0, 1, 1);
            addComponent(passAdmin2, 5, 0, 1, 1);
            addComponent(label6, 5, 1, 1, 1);
            addComponent(button1, 6, 0, 1, 1);
            
            addComponent(label7, 7, 0, 1, 1);
            addComponent(textField1, 8, 0, 1, 1);
            addComponent(button2, 9, 0, 1, 1);
            
            
            FirstLoginHandler handler = new FirstLoginHandler();
            button1.addActionListener(handler);
            button2.addActionListener(handler);
            userAdmin.addActionListener(handler);
            passAdmin.addActionListener(handler);
            passAdmin2.addActionListener(handler);
            textField1.addActionListener(handler); //If 'Enter' is pressed while on the JTextField, it will act asif you pressed the button. This is used to save time by not having to move your mouse and press the button
        } else if (loginType == 2)
        {
            //Change password NB
        }
    }        
        
    private void addComponent(Component component, int row, int column, int width, int height)
    {
        constraints.gridx = column;
        constraints.gridy = row;
        constraints.gridwidth = width;
        constraints.gridheight = height;
        formGrid.setConstraints(component, constraints);
        add(component);
    }
    
    private class LoginHandler implements ActionListener
    {
        @Override
        public void actionPerformed(ActionEvent event) 
        {
            if (event.getSource() == button3) // If the button/textField pressed was 'button3'
            {        
                int answer = JOptionPane.showConfirmDialog(null, "Do you want to exit?", "Exit", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
                if (answer == JOptionPane.YES_OPTION)
                {
                    System.exit(0); //Exit application
                }
            }
            else
            {
                if (testTextField(0,userAdmin) && testTextField(0,passAdmin)) //Checks id both 'userAdmin' and 'passAdmin' JTextFields are 'true'(thus textfields text's aren't empty, because testType = 0; If testType = 1 it whould test if the text is only made of numbers)           
                {
                    int userType = adminClass.FindUser(userAdmin.getText(), passAdmin.getText());                                    
                    if (userType != 0) //Make sure that user doesn't already exist and if user exists(thus not = to 0) get the type of user as well
                    {                            
                        GcsGui guiMain = new GcsGui(); //Open new form
                        
                        guiMain.MainGUI(userType); //Opens all the tabs the type of user needs to see    
                            guiMain.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                            guiMain.setSize(1280,720);
                            guiMain.setLocationRelativeTo(null); //Centers form
                            guiMain.setVisible(true);
                        System.gc(); 
                        dispose(); //dispose() removes item not related to garbage collector and also closes the form.
                    }
                    else
                    {
                        userAdmin.setBackground(gcsYellow); //Sets the entire JtextFields color red to indicate an error was made
                        passAdmin.setBackground(gcsYellow);
                    }
                }    
            }           
        }
    }
    
    private class FirstLoginHandler implements ActionListener
    {
        @Override
        public void actionPerformed(ActionEvent event)
        {
            if (event.getSource() != button2 && event.getSource() != textField1) //If any button besides 'button2' and 'textField1' was pressed
            {                             
                if(testTextField(0,userAdmin, label2,"Re-enter your username") && testTextField(0,passAdmin, label4,"Re-enter your password") && testTextField(0,passAdmin2, label6,"Re-enter your password from above"))
                {               
                    if (passAdmin.getText().equals(passAdmin2.getText())) //If the two passwords are the same, then continue
                    {
                        adminClass.AddItem(new UserData(userAdmin.getText(), passAdmin.getText(), 1)); //Add a new user to a serilized file
                            label1.setVisible(false); //Hide components
                            label2.setVisible(false); 
                            label3.setVisible(false); 
                            label4.setVisible(false); 
                            label5.setVisible(false); 
                            label6.setVisible(false); 
                            userAdmin.setVisible(false); 
                            passAdmin.setVisible(false);  
                            passAdmin2.setVisible(false); 
                            button1.setVisible(false);  
                            textField1.setVisible(true); //Show components
                            button2.setVisible(true); 
                        label7.setText("Write down the code in the box below. Place it somewhere save. This code" + 
                                       " will be used by YOU the ADMIN to create new users.");
                                       
                        int code = 100000 + genNum.nextInt(899999); //Create a random code for the admin user to use to change other users passwords
                        file.setSerFile(FileName.CODE, code); //Add AdminCode to serilized file + FileName.CODE is a enum to set the .ser file name
                        
                        textField1.setText(String.format("%d",code));
                        file.setSerFile(FileName.COUNT, 1);  //set Count.ser file's '0' integer to a '1' interger, because the program will of been laungth for the first time and never again  
                    }
                    else
                    {
                        passAdmin2.setBackground(gcsYellow);
                        label6.setText("This password doesn't match the password from above");
                    }
                } 
            }
            else
            {
                GcsGui guiLogin = new GcsGui();
                    guiLogin.LoginGUI(0); //Reload FirstLogin form, because an error my of occurred
                    guiLogin.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                    guiLogin.setSize(1280,720);
                    guiLogin.setLocationRelativeTo(null);
                    guiLogin.setVisible(true);
                System.gc(); 
                dispose();                               
            }
        }        
    }   
    
    private class ChangePasswordHandler implements ActionListener
    {
        @Override
        public void actionPerformed(ActionEvent event)
        {
            // DIT MOET BLY !!!!!!!!!! NB
        }        
    }
    
    //###########################################################################################################################################################################################################################################
    //##        <<<  MAIN_GUI  >>>                     [4 Methodes + 3 Inner Classes] {Uses GCS classes: Admin, Finance, Management & FileClass<Integer>}                                                                                                          ##
    //###########################################################################################################################################################################################################################################
    
    public void MainGUI(int tabType)
    {
        setTitle("Main");
       
        borderLayout = new BorderLayout(10, 10);
        setLayout(borderLayout);
        
        itemName = managementClass.ListStockItems(); //Gets a list of all items name        
               
        managementClass.CreateGcsDataBase(); //Creates a database with al the size's of the items
        
        //managementClass.DisplayGcsDataBase();  //Test
        
        file.setSerFile(FileName.YEAR, (calendar.get(Calendar.DAY_OF_YEAR)) - 1);   //Test                   
        
        /**   ----*****----       Creating the Menu Strip       ----*****----  */
        
        fileMenu = createJMenu(1,"File");
        fileMenu.setMnemonic('F');      
        
        changeSizeMenu = createJMenu(1,"Resolution");                
        minimizeMenu = createJMenu(1,"_");
        exitMenu = createJMenu(1,"x");
                
            logout = createJMenuItem("Logout", 'L');
            exitApp = createJMenuItem("Exit Application", 'x');
            minimize = createJMenuItem("minimize", 'm');
            screenSize1 = createJMenuItem("1280x720", ' ');
            screenSize2 = createJMenuItem("1280x1024", ' ');
            screenSize3 = createJMenuItem("1440x900", ' ');
            screenSize4 = createJMenuItem("1600x900", ' ');
            screenSize5 = createJMenuItem("1820x980", ' ');
            screenSize6 = createJMenuItem("1920x1080", ' ');
        
            exitMenu.add(logout);
            exitMenu.add(exitApp);
            minimizeMenu.add(minimize);
            changeSizeMenu.add(screenSize1);
            changeSizeMenu.add(screenSize2);
            changeSizeMenu.add(screenSize3);
            changeSizeMenu.add(screenSize4);
            changeSizeMenu.add(screenSize5);
            changeSizeMenu.add(screenSize6);
            
            
        bar = new JMenuBar();
        bar.add(fileMenu);
        
        bar.add(Box.createHorizontalGlue()); //Place all the JMenuItem after this point at the left side of the menubar
        bar.add(changeSizeMenu);
        bar.add(createJMenu(0,"|")); //Creates a break between JMenu objects
        bar.add(minimizeMenu);
        bar.add(createJMenu(0,"|"));
        bar.add(exitMenu);  
        
        bar.setBackground(Color.WHITE);
        
        add(bar, BorderLayout.NORTH);
        
        /**#  ----*****----       Creating the Tabs       ----*****----  */                 
        
        tabbedPane = new JTabbedPane();
        
        panel1 = AdminTAB();  //Uses a method to create a JPanel
            tabbedPane.addTab("  Admin  ", null, panel1, "First Panel");         
        panel2 = FinanceTAB();
            tabbedPane.addTab("  Finance  ", null, panel2, "Second Panel");        
        panel3 = ManagementTAB();
            tabbedPane.addTab("  Management  ", null, panel3, "Third Panel");
                            
        tabbedPane.setBackground(gcsGreen);
        tabbedPane.setBorder(BorderFactory.createEtchedBorder(0, Color.gray, gcsYellow));
            
        add(tabbedPane, BorderLayout.CENTER);
        if (tabType == 2) //Sodat net die Finance tab wys vir 'n Finance-user
        {          
            tabbedPane.remove(0); //Close die tab by Index "0" 
            tabbedPane.remove(1); //is "1" omdat index verander nadat jy een delete, soos by vorige statment 
        }
        else if (tabType == 3) //Sodat net die Management tab wys vir 'n Management-user
        {
            tabbedPane.remove(0); 
            tabbedPane.remove(0); //is "0" omdat index verander nadat jy een delete, soos by vorige statment         
        } 
        
        /**  ----*****----        Eventhandlers for the Menu Strip       ----*****----  */
        
        MenuStripHandler stripHandler = new MenuStripHandler();
            exitApp.addActionListener(stripHandler);
            logout.addActionListener(stripHandler);
            minimize.addActionListener(stripHandler);
            screenSize1.addActionListener(stripHandler);
            screenSize2.addActionListener(stripHandler);
            screenSize3.addActionListener(stripHandler);
            screenSize4.addActionListener(stripHandler);
            screenSize5.addActionListener(stripHandler);
            screenSize6.addActionListener(stripHandler);
            
        /**#  ----*****----       Eventhandlers for the Tabs       ----*****----  */
        
        AdminHandler adminHandler = new AdminHandler(); 
            passAdmin2.addActionListener(adminHandler);  
            addUserAdmin.addActionListener(adminHandler);        
        
        FinanceHandler financeHandler = new FinanceHandler();  
            addFinance.addActionListener(financeHandler);
        
        ManagementHandler managementHandler = new ManagementHandler();
            btnSet.addActionListener(managementHandler);
        
            txtfItemExpi.addActionListener(managementHandler);
            btnNewItem.addActionListener(managementHandler); 
            
            txtfRemainSize.addActionListener(managementHandler);
            btnRemainSizeBack.addActionListener(managementHandler);
            btnRemainSizeNext.addActionListener(managementHandler);
            
            txtfBuffer.addActionListener(managementHandler);
            btnBuffer.addActionListener(managementHandler); 
    }
    
    public class MenuStripHandler implements ActionListener
    {
        @Override
        public void actionPerformed(ActionEvent event)
        {
            if (event.getSource() == exitApp)
            {
                int answer = JOptionPane.showConfirmDialog(null, "Do you want to exit?", "Exit", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
                if (answer == JOptionPane.YES_OPTION)
                {
                    System.exit(0); //Exit application
                }                                
            } else if (event.getSource() == logout)
            {
                int answer = JOptionPane.showConfirmDialog(null, "Do you want to logout?", "Logout", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
                if (answer == JOptionPane.YES_OPTION)
                {
                    GcsGui guiLogin = new GcsGui(); //Go back to Login form
                        guiLogin.LoginGUI(0);
                        guiLogin.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                        guiLogin.setSize(1280,720);
                        guiLogin.setLocationRelativeTo(null); 
                        guiLogin.setVisible(true);
                    System.gc(); 
                    dispose();
                }                 
            } else if (event.getSource() == minimize)
            {
                setState(JFrame.ICONIFIED);
            } else if (event.getSource() == screenSize1) //Change screen size
            {
                setSize(1280,720);
            } else if (event.getSource() == screenSize2)
            {
                setSize(1280,1024);
            } else if (event.getSource() == screenSize3)
            {
                setSize(1440,900);
            } else if (event.getSource() == screenSize4)
            {
                setSize(1600,900);
            } else if (event.getSource() == screenSize5)
            {
                setSize(1820,980);
            } else if (event.getSource() == screenSize6)
            {
                setSize(1920,1080);
            }
            setLocationRelativeTo(null);
        }
    }
    
    private JPanel AdminTAB()
    {        
        JPanel panel = new JPanel();
        borderLayout = new BorderLayout(10, 10);
        panel.setLayout(borderLayout);
        panel.setBackground(new Color(214, 238, 179));
        
        panel1 = createJPanel(2, 200, 900);
        gridLayout = new GridLayout(7, 2, 3, 3);
        panel1.setLayout(gridLayout);
        
        
            label1 = createJLabel(0,"Add Users",16);  
            label2 = createJLabel(0,"User Name",12);  
            userAdmin = createJTextField();  
            label3 = createJLabel(0,"Password",12);  
            passAdmin = createJTextField();  
            label4 = createJLabel(0,"Retype Password",12);  
            passAdmin2 = createJTextField(); 
            label5 = createJLabel(0,"User Privilege",12);  
            radFinance = createJRadioButton("Finance", true);
            radManagement = createJRadioButton("Management", false);
            radioGroup = new ButtonGroup();
            radioGroup.add(radFinance);
            radioGroup.add(radManagement);
            addUserAdmin = createJButton(0,"Add User");  
            lblConfirm = createJLabel(1,"",10); 
                
            panel1.add(label1);         panel1.add(new JLabel()); //Adds a empty block in grid
            panel1.add(label2);         panel1.add(label5);
            panel1.add(userAdmin);      panel1.add(radFinance);
            panel1.add(label3);         panel1.add(radManagement);
            panel1.add(passAdmin);      panel1.add(addUserAdmin);
            panel1.add(label4);         panel1.add(lblConfirm);
            panel1.add(passAdmin2);
            
        panel.add(panel1, BorderLayout.WEST);     
        
        
        panel1 = createJPanel(1 ,800 ,900);        
            button1 = createJButton(0,"Calander");
            
            panel1.add(button1);
            
        panel.add(panel1, BorderLayout.CENTER);     
        
        
        panel1 = createJPanel(2, 800, 100);
            button2 = createJButton(0,"Event Adder");
            
            panel1.add(button2);
        
        panel.add(panel1, BorderLayout.SOUTH);
        
        
        panel1 = createJPanel(2, 200, 900);
            
            button3 = createJButton(0,"Customer Info");
            
            panel1.add(button3);         
            
        panel.add(panel1, BorderLayout.EAST);
     
        return panel;
    }
    
    private class AdminHandler implements ActionListener
    {        
        @Override
        public void actionPerformed(ActionEvent event)
        {            
            int type = radFinance.isSelected() == true ? 2 : 3; //New users type
            
            if (testTextField(0,userAdmin) && testTextField(0,passAdmin) && testTextField(0,passAdmin2))
            {       
                if (passAdmin.getText().equals(passAdmin2.getText())) //Check both passwords are the same
                {
                    if (adminClass.FindUser(userAdmin.getText(), passAdmin.getText()) == 0)  //Check if user already exists
                    {        
                        adminClass.AddItem(new UserData(userAdmin.getText(), passAdmin.getText(), type));                                           
                        lblConfirm.setText("User Made");   
                    } 
                    else 
                    {
                        lblConfirm.setText("User already exists,try again");
                    }
                    radFinance.setSelected(true);
                    userAdmin.setText(null);
                    passAdmin.setText(null);
                    passAdmin2.setText(null);                    
                }
                else
                {
                    passAdmin.setBackground(gcsYellow);
                    passAdmin2.setBackground(gcsYellow);
                }
            }            
        }        
    }
    
    private JPanel FinanceTAB()
    {
        JPanel panel = new JPanel();
        borderLayout = new BorderLayout(15, 15);
        panel.setLayout(borderLayout);
        panel.setBackground(new Color(214, 238, 179));
        
        
        panel1 = createJPanel(2, 200, 600);
        gridLayout = new GridLayout(10, 2, 5, 5);
        panel1.setLayout(gridLayout); 
        
            textArea = createJTextArea("Some Text",10, 20);   
            label1 = createJLabel(0,"Choose date :",14);                
            label2 = createJLabel(0,"Date is : yyyy/mm/dd",14);
            
            panel1.add(textArea);
            panel1.add(label1);
            panel1.add(label2);
        
        panel.add(panel1, BorderLayout.WEST);
            
            
        panel1 = createJPanel(1 , 600, 600);
        gridLayout2 = new GridLayout(7, 2, 5, 5);
        panel1.setLayout(gridLayout); 
        
            label1 = createJLabel(0,"Add Current Funds :",14);                     
            txtfCapital = createJTextField();                         lblCapital = createJLabel(1,"",12);  
            label2 = createJLabel(0,"Add Profit :",14);                    
            txtfProfit = createJTextField();                          lblProfit = createJLabel(1,"",12);
            label3 = createJLabel(0,"Add Expens :",14);                    
            txtfExpens = createJTextField();                          lblExpens = createJLabel(1,"",12);  
            addFinance = createJButton(0,"Add Info");
            lblConfirm2 = createJLabel(1,"",14);
            
            panel1.add(label1);
            panel1.add(new JLabel());
            panel1.add(txtfCapital);
            panel1.add(lblCapital);
            panel1.add(label2);
            panel1.add(new JLabel());
            panel1.add(txtfProfit);
            panel1.add(lblProfit);
            panel1.add(label3);
            panel1.add(new JLabel());
            panel1.add(txtfExpens);
            panel1.add(lblExpens);
            panel1.add(addFinance);
            panel1.add(new JLabel());
            panel1.add(lblConfirm2);
        
        panel.add(panel1, BorderLayout.CENTER);        

        return panel;
    }
    
    private class FinanceHandler implements ActionListener
    {
        @Override
        public void actionPerformed(ActionEvent event)
        {
            if (testTextField(0,txtfCapital, lblCapital, "Capital is not entered") && testTextField(0,txtfProfit, lblProfit, "Profit is not entered") && testTextField(0,txtfExpens, lblExpens, "Expens is not entered"))
            {
                    double capital = Double.parseDouble(txtfCapital.getText());
                    double profit = Double.parseDouble(txtfProfit.getText());
                    double expens = Double.parseDouble(txtfExpens.getText());
                financeClass.AddItem(new AccountData(capital, profit, expens));
                lblConfirm2.setText("Balance added");
            }            
        }        
    }
    
    private JPanel ManagementTAB()
    {
        JPanel panel = new JPanel();
        borderLayout = new BorderLayout(10, 10);
        panel.setLayout(borderLayout);
        panel.setBackground(new Color(214, 238, 179));
        
        //PANEL1  
        
        panel1 = createJPanel(1, 300, 800); 
        gridLayout = new GridLayout(1, 2, 5, 5);  
        panel1.setLayout(gridLayout);        
            
            panel2 = createJPanel(1, 300, 800);  /** txtfItemExpi & btnNewItem */
            gridLayout = new GridLayout(10, 2, 5, 5);  
            panel2.setLayout(gridLayout);
            
                label1 = createJLabel(0,"Adding a new stock item:",16);        //Empty space
                label2 = createJLabel(0,"Item name",12);                       //Empty space
                txtfItemName = createJTextField();                        lblItemName = createJLabel(1,"",12);
                label3 = createJLabel(0,"Item size",12);                       //Empty space
                txtfItemSize = createJTextField();                        lblItemSize = createJLabel(1,"",12);
                radKilo = createJRadioButton("kg", true);                 radGram = createJRadioButton("g", false);        
                radLiter = createJRadioButton("l", false);                radMilli = createJRadioButton("ml", false);                                           
                label4 = createJLabel(0,"Days till item expires",12);          //Empty space
                txtfItemExpi = createJTextField();                        lblItemExpi = createJLabel(1,"",12);
                btnNewItem = createJButton(0,"Add new item");           lblConfirm3 = createJLabel(1,"",12);
                
                radioGroupSize = new ButtonGroup();                     
                radioGroupSize.add(radKilo);                            
                radioGroupSize.add(radGram);                            
                radioGroupSize.add(radLiter);                           
                radioGroupSize.add(radMilli);        
                
                panel2.add(label1);                                     panel2.add(new JLabel());        
                panel2.add(label2);                                     panel2.add(new JLabel());
                panel2.add(txtfItemName);                               panel2.add(lblItemName); 
                panel2.add(label3);                                     panel2.add(new JLabel());
                panel2.add(txtfItemSize);                               panel2.add(lblItemSize);         
                panel2.add(radKilo);                                    panel2.add(radGram); 
                panel2.add(radLiter);                                   panel2.add(radMilli); 
                panel2.add(label4);                                     panel2.add(new JLabel());
                panel2.add(txtfItemExpi);                               panel2.add(lblItemExpi); 
                panel2.add(btnNewItem);                                 panel2.add(lblConfirm3); 
        
            panel1.add(panel2);
            
        panel.add(panel1, BorderLayout.WEST);
            
        //PANEL2
        
        panel1 = createJPanel(1, 300, 800); 
        gridLayout = new GridLayout(1, 2, 5, 5);  
        panel1.setLayout(gridLayout);                    
            
            panel2 = createJPanel(1, 250, 800); /** btnSet */
            gridLayout = new GridLayout(9, 1, 5, 5);  
            panel2.setLayout(gridLayout);        
            
                label1 = createJLabel(0,"Date Settings",12);  
                label2 = createJLabel(0,"How many days a",12);
                label3 = createJLabel(0,"week do you check",12);
                label4 = createJLabel(0,"your stock? :",12);
                rad1day = createJRadioButton("Everyday", true);
                rad2day = createJRadioButton("Every second day", false);  
                rad1week = createJRadioButton("Once a week", false); 
                btnSet = createJButton(0,"SET");
                lblSetTest = createJLabel(1,"",12);
                
                radioSettings = new ButtonGroup();
                radioSettings.add(rad1day);
                radioSettings.add(rad2day);
                radioSettings.add(rad1week);
                
                panel2.add(label1);
                panel2.add(label2);
                panel2.add(label3);
                panel2.add(label4);
                panel2.add(rad1day);
                panel2.add(rad2day);
                panel2.add(rad1week);
                panel2.add(btnSet);
                panel2.add(lblSetTest);                
        
            panel1.add(panel2);
            
        panel.add(panel1, BorderLayout.EAST);
        
        //PANEL3 
        
        panel1 = createJPanel(1, 600, 900); 
        gridLayout = new GridLayout(1, 3, 10, 10);  
        panel1.setLayout(gridLayout);
        
        
            panel2 = createJPanel(2, 250, 900); /** txtfRemainSize & btnRemainSizeBack &  btnRemainSizeNext*/
            gridLayout = new GridLayout(5, 2, 4, 4);  
            panel2.setLayout(gridLayout); 
            
                label1 = createJLabel(0,"Add today's stock",16);                       //Empty space
                label2 = createJLabel(0,"Item name: ",12);                             //Empty space
                lblRemainItemName = createJLabel(1,"",12);                             //Empty space
                txtfRemainSize = createJTextField();                                  lblTestRemain = createJLabel(1,"",12);                                  
                 btnRemainSizeNext = createJButton(0,"NEXT");                       btnRemainSizeBack = createJButton(0,"BACK"); 
                //Sal txtfRemainSize met kg, g, l, ml by sit  !!!!!!!!
        
                panel2.add(label1);                             panel2.add(new JLabel());
                panel2.add(label2);                             panel2.add(new JLabel());
                panel2.add(lblRemainItemName);                  panel2.add(new JLabel());
                panel2.add(txtfRemainSize);                     panel2.add(lblTestRemain);                      
                panel2.add(btnRemainSizeNext);                  panel2.add(btnRemainSizeBack);
                
                int dayOfYear = calendar.get(Calendar.DAY_OF_YEAR);     // DAY_OF_YEAR = The current amount of days that have passed since the year began (1 - 364)
                int preDayOfYear = file.getSerFile(FileName.YEAR);      // Day of the year for the laaste time the application was ran. Gets it from a serilized file
                int sumDate = dayOfYear - preDayOfYear;                 
                int gapSettings = file.getSerFile(FileName.SETTINGS);   // Settings made of the frequency you check the stock. Daily = 1, Every 2de day = 2 and Once a week = 7. Gets it from a serilized file
                if (sumDate == gapSettings)
                {
                    lblRemainItemName.setText("[ Click Next ]");
                }
                else
                {
                    lblRemainItemName.setText("[ DONE ]");
                }
        
            panel3 = createJPanel(0, 100, 900);    
                
            panel4 = createJPanel(2, 250, 900); /** txtfRemainSize & btnBuffer */
            gridLayout = new GridLayout(7, 2, 5, 5);  
            panel4.setLayout(gridLayout);        
                                                
                label1 = createJLabel(0,"Buffer Stock",16);                            //Empty space
                label2 = createJLabel(0,"Item to add extra stock",12);                 //Empty space
                stockJList = new JList<String>(itemName);                       //Empty space
                label3 = createJLabel(0,"Add size of selected stock that",12);         //Empty space
                label4 = createJLabel(0,"will be added to item everyday.",12);         //Empty space
                txtfBuffer = createJTextField();                                  lblTestBuffer = createJLabel(1,"",10);
                btnBuffer = createJButton(0,"Add Buffer Stock");                    lblConfirm4 = createJLabel(1,"",10);
                
                stockJList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
                stockJList.setVisibleRowCount(6);
                
                panel4.add(label1);                                             panel4.add(new JLabel());
                panel4.add(label2);                                             panel4.add(new JLabel());
                panel4.add(new JScrollPane(stockJList));                        panel4.add(new JLabel());
                panel4.add(label3);                                             panel4.add(new JLabel());
                panel4.add(label4);                                             panel4.add(new JLabel());
                panel4.add(txtfBuffer);                                         panel4.add(lblTestBuffer);
                panel4.add(btnBuffer);                                          panel4.add(lblConfirm4);
                //txtfBuffer add k, kg, l, ml !!!!
                
                
            panel1.add(panel2);
            panel1.add(panel3);
            panel1.add(panel4);
            
        panel.add(panel1, BorderLayout.CENTER);
        
        //PANEL6
        
        panel1 = createJPanel(0, 800, 100);
            button5 = createJButton(0,"Message");
            
            panel1.add(button5);
       
        panel.add(panel1, BorderLayout.NORTH);
        
        //PANEL7
        
        panel1 = createJPanel(1, 800, 150);
            button6 = createJButton(0,"Graphf");
                                                    
            panel1.add(button6);
        
        panel.add(panel1, BorderLayout.SOUTH);

        
        return panel;
    }
    
    private class ManagementHandler implements ActionListener
    {
        @Override
        public void actionPerformed(ActionEvent event)
        {        
            /**#  ----*****----       WEST PANEL*       ----*****----  */
            if (event.getSource() == btnSet) 
            {
                lblSetTest.setText("Settings SAVED");
            }
            /**#  ----*****----       EAST PANEL       ----*****----  */
            if (event.getSource() == txtfItemExpi || event.getSource() == btnNewItem)
            {                                              
                String item = txtfItemName.getText();
                
                if (testTextField(0,txtfItemName, lblItemName,"Re-enter your itemname") && testTextField(1,txtfItemSize, lblItemSize,"Re-enter item size(Can only contain numbers)") && testTextField(1,txtfItemExpi, lblItemExpi,"Re-enter item expiration date in days(Can only contain numbers)"))    
                {                                                                                     // 1 = test if all the chars is the text are numbers
                    boolean found = false;
                    for (int k = 0;k < itemName.length;k++) //itemName = the list of items(one of each) made earlier
                    {
                        found = item.equals(itemName[k]) ? true : false; //Check if there are any instances of the item that already exists
                    }
                    if (found == false)
                    {        
                        int type = 1;
                        if (radGram.isSelected())
                        {
                            type = 2;
                        } else if (radLiter.isSelected())
                        {
                            type = 3;
                        } else if (radMilli.isSelected())
                        {
                            type = 4;
                        }
                        
                        float size = Float.parseFloat(txtfItemSize.getText());
                        int expi = Integer.parseInt(txtfItemExpi.getText());
                        managementClass.AddItem(new StorageData(txtfItemName.getText(), size, type, expi, calendar.get(Calendar.DAY_OF_WEEK))); 
                        /** AddItem adds a new item to a serilized file of type StorageData
                         *    calendar = A class that keeps trace of the era, year, month, day, time and milliseconds that it is currently
                         *    Calendar.DAY_OF_WEEK = The day this week is currently in( 1(Sunday) to 7(Saturday) )  */                        
                        lblConfirm3.setText("Item added");
                        
                        itemName = managementClass.ListStockItems(); //Reload the list of items, because a brand new item was added
                        stockJList.setListData(itemName);  //Reload the Jlist items with the new item list
                    }
                    else
                    {
                        lblConfirm3.setText("Item already exists");
                    }
                }
                else
                {
                    lblConfirm3.setText("Error was made");
                }      
                
                radKilo.setSelected(true);
                txtfItemName.setText(null);
                txtfItemSize.setText(null);
                txtfItemExpi.setText(null);                               
            }  
            /**#  ----*****----       CENTER PANEL*       ----*****----  */
            if (event.getSource() == txtfRemainSize || event.getSource() == btnRemainSizeNext)
            {
                /** Re-uses these 4 varibles, because the time in with the 'lblRemainItemName' is made, by the time you press this button the time(DAY_OF_YEAR) could of changed  */
                int dayOfYear = calendar.get(Calendar.DAY_OF_YEAR); 
                int preDayOfYear = file.getSerFile(FileName.YEAR);  // Day of the year for the laaste time an item was added. Gets it from a serilized file
                int sumDate = dayOfYear - preDayOfYear;
                int gapSettings = file.getSerFile(FileName.SETTINGS);
                //System.out.println(sumDate + "  " + num + "  " + itemName.length);
                if (sumDate == gapSettings) 
                {
                    //System.out.print("Reg" + sumDate + " " + dayOfYear + " " + preDayOfYear);
                    if (num != -1)
                    {
                        if (testTextField(1, txtfRemainSize, lblTestRemain, "Re-enter size of its items stock(Can only contain numbers)"))
                        {   
                            btnNewItem.setEnabled(false); //Grays-out the button to add new items, while your a busy adding the days stock
                            itemName = managementClass.ListStockItems();
                            if (num < itemName.length)
                            {
                                float size = Float.parseFloat(txtfRemainSize.getText());   
                                managementClass.AddItem(new StorageData(itemName[num], size, 0, 0, calendar.get(Calendar.DAY_OF_WEEK)));                                                                                                              
                                
                                num++;
                                if (num < itemName.length)
                                {
                                    lblRemainItemName.setText("[ " + itemName[num] + " ]");
                                } 
                                else
                                {
                                    lblRemainItemName.setText("[ DONE ]");
                                    file.setSerFile(FileName.YEAR, dayOfYear);
                                    btnNewItem.setEnabled(true);
                                    managementClass.DisplayGcsDataBase(); //NB
                                    
                                    num = -1;
                                }
                            }
                            txtfRemainSize.setText("");
                        }    
                    }
                    else
                    {
                        num++;
                        lblRemainItemName.setText("[ " + itemName[0] + " ]");
                    }                   
                }
                else
                {
                    if(sumDate > gapSettings) //missed deadline
                    {
                        //Message missed deadline
                        //file.setSerFile(FileName.YEAR, dayOfYear);
                        lblRemainItemName.setText("[ MISSED DEADLINE ]");
                        //System.out.print("OVER" + sumDate + " " + dayOfYear + " " + preDayOfYear);
                    }
                    else //before deadline
                    {
                        btnNewItem.setEnabled(true);
                        lblRemainItemName.setText("[ DONE ]");
                        //System.out.print("UNDER" + sumDate + " " + dayOfYear + " " + preDayOfYear);
                    }
                }
                
            }
            if (event.getSource() == btnRemainSizeBack)
            {
                if (testTextField(1, txtfRemainSize, lblTestRemain, "Re-enter size of its items stock(Can only contain numbers)"))
                {
                    txtfRemainSize.setText("");
                }
            }
            /**#  ----*****----       CENTER PANEL*       ----*****----  */
            if (event.getSource() == txtfBuffer || event.getSource() == btnBuffer)
            {
                if (stockJList.getSelectedIndex() != -1)
                {
                    if (testTextField(1, txtfBuffer, lblTestBuffer, "Re-enter size of its items stock(Can only contain numbers)"))
                    {
                        txtfBuffer.setText("");
                        lblConfirm4.setText("Buffer added to list");                        
                    }
                    else
                    {
                        lblConfirm4.setText("");
                    }
                } 
                else
                {
                    lblTestBuffer.setText("Must select a item from list");
                }
            }           
            /**#  ----*****----       NORTH PANEL       ----*****----  */
            
            /**#  ----*****----       SOUTH PANEL       ----*****----  */
            
        }        
    }
    
    //###########################################################################################################################################################################################################################################
    //##        <<<  TEST_FIELDS  >>>                        [2 Methodes]  {Doesn't use GCS classes}                                                                                                                                           ##
    //###########################################################################################################################################################################################################################################
    
    private boolean testTextField(int testType, JTextField field)
    {       
        return testTextField(testType, field, new JLabel(), null);
    }    
    
    private boolean testTextField(int testType, JTextField field, JLabel label, String text)
    {
        boolean test = false;
        field.setBackground(Color.WHITE);
        label.setText(null);
        if ( field.getText().equals("") || (testType == 1 && !field.getText().matches("[0-9]+")) )
        {            
            field.setBackground(gcsYellow);
            label.setText(text);   
        }
        else 
        {
            test = true;
        }
        return test;
    }
    
    //###########################################################################################################################################################################################################################################
    //##        <<<  END  >>>                                                                                                                                                                                                                  ##
    //###########################################################################################################################################################################################################################################    
}





















