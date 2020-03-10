using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Airline
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblDisplay.Text = TextBox1.Text + " proceed by selecting your destination";
        }

        protected void btnFindInfo_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem != null)
            {
                HttpCookie cookie = new HttpCookie("Airline");
                cookie["City"] = DropDownList1.SelectedItem.Text;
                string dist = null;
                switch (DropDownList1.SelectedItem.Text)
                {
                    case "Durban":
                        {
                            dist = "480";
                            break;
                        }
                    case "Cape Town":
                        {
                            dist = "1200";
                            break;
                        }
                    case "Port Elizabeth":
                        {
                            dist = "950";
                            break;
                        }
                    case "Polokwane":
                        {
                            dist = "380";
                            break;
                        }
                    case "Bloemfontein":
                        {
                            dist = "320";
                            break;
                        }
                }

                cookie["Dist"] = dist;
                cookie.Expires = DateTime.Now.AddDays(10);
                Response.Cookies.Add(cookie);
            }
        }
    }
}