using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Cars
{
    public partial class Form1 : System.Windows.Forms.Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void viewToolStripMenuItem_Click(object sender, EventArgs e)
        {
            formView childForm1 = new formView();
            childForm1.MdiParent = this;
            childForm1.Show();
        }

        private void staticticsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            formStats childForm2 = new formStats();
            childForm2.MdiParent = this;
            childForm2.Show();
        }

        private void tileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.TileVertical);
        }

        private void closeWindowToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.ActiveMdiChild.Close();
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Do your want to exit?","Exit",MessageBoxButtons.YesNo,MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }
    }
}
