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
    public partial class formStats : System.Windows.Forms.Form
    {
        public formStats()
        {
            InitializeComponent();
        }

        private void formStats_Load(object sender, EventArgs e)
        {
            openFileDialog1.InitialDirectory = @"C:\";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                int totalKM = 0;
                int totalLiters = 0;
                StreamReader inFile = File.OpenText(openFileDialog1.FileName);
                string line = inFile.ReadLine();
                while (line != null)
                {
                    string[] words = line.Split(',');
                    for (int i = 0;i < words.Length;i++)
                    {
                        words[i] = words[i].Trim();
                    }
                    totalKM += Convert.ToInt32(words[1]);
                    totalLiters += Convert.ToInt32(words[2]);
                    line = inFile.ReadLine();
                }
                inFile.Close();
                label3.Text = Convert.ToString(totalKM) + " kilometers";
                label4.Text = Convert.ToString(totalLiters) + " Liters";
            }
        }
    }
}
