using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Cars
{
    public partial class formView : System.Windows.Forms.Form
    {
        public string fileLocation; 
        public formView()
        {
            InitializeComponent();
        }

        private void formView_Load(object sender, EventArgs e)
        {
            openFileDialog1.InitialDirectory = @"C:\";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                fileLocation = openFileDialog1.FileName;
                StreamReader inFile = File.OpenText(fileLocation);
                string line = inFile.ReadLine();

                while (line != null)
                {
                    string newLine = null;
                    string[] words = line.Split(',');

                    for (int i = 0; i < words.Length; i++)
                    {
                        words[i] = words[i].Trim();
                        string space = i < 1 ? null : " ,\t";
                        newLine = newLine + space + words[i];
                    }
                    listBox1.Items.Add(newLine + "\n");
                    double aveFuel = Math.Round(Convert.ToDouble(words[1])/Convert.ToDouble(words[2]));
                    listBox2.Items.Add("Car " + words[0] + " uses " + Convert.ToString(aveFuel) + " liters of fuel per kilometers\n");
                    line = inFile.ReadLine();
                }
                inFile.Close();
            }
        }
    }
}
