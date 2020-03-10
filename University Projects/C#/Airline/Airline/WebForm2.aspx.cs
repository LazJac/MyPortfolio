using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Airline
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["Airline"];
            if (cookie != null)
            {
                string num = cookie["Dist"];
                int cost = Convert.ToInt16(num)*2;
                Label1.Text = cookie["City"] + " is " + cookie["Dist"] + " kilometers from JHB. Ticket Prize: R " + Convert.ToString(cost);
            }
        }
    }
}